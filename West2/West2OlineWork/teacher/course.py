import base64
import datetime

from flask import Blueprint, request, url_for,session
from flask_dropzone import random_filename
import os

from West2OlineWork.app import db
from West2OlineWork.globals.models import User, Notices, Class, Talkings, Comments, FirstCategory, SecondCategory, \
    Assignment, FinishStatus
from West2OlineWork.globals.responses import Responses
from West2OlineWork.globals.utils import responseError, responseSuccess, responseBody

t_course = Blueprint("t_course", __name__, url_prefix="/tech")


# 发送公告
@t_course.route("/post_notices", methods=["POST"])
def post_notices():
    try:
        data = request.get_json()
        title = data.get("title")
        content = data.get("content")
        class_id = int(data.get("class_id"))
        user_id = int(data.get("user_id"))
        Tech = User.query.filter_by(id=user_id).first()
        if not Tech.is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)
        else:
            notice = Notices(title=title, content=content, belong_class_id=class_id)
            db.session.add(notice)
            db.session.commit()
            return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 删除公告
@t_course.route("/del_notice", methods=["POST"])
def del_notice():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        class_id = int(data.get("class_id"))
        notice_id = int(data.get("notice_id"))
        user = User.query.get(user_id)
        notice = Notices.query.get(notice_id)
        # 1.不是老师则无法删除
        # 2.是老师，但删除的不是该班级下的公告则失败
        if not user.is_teacher or notice.belong_class_id != class_id:
            return responseError(Responses.AUTHORIZATION_ERROR)
        db.session.delete(notice)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 创建新章节
@t_course.route("/create_fc", methods=["POST"])
def create_first_category():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        title = data.get("title")
        # 若before为"front"，则在最前加入
        # 若before不为空，则在指定位置后插入
        # 若before为"last",则在最后加入
        before = data.get("before")
        user_class = Class.query.get(class_id)
        # 要插入的章节的id
        new_fc_id = max([c.id for c in FirstCategory.query.all()]) + 1
        # 在最前面加入
        if before.strip() == "front":
            next_id = 0
            # 判断该班级是否已存在章节
            fc = FirstCategory.query.with_parent(user_class).filter_by(is_first_category=True).first()
            if fc is not None:
                # 存在已有章节，则插到最前
                # 修改第一个章节
                fc.is_first_category = False
                next_id = fc.id
            # 若不存在已有章节，则该章节的next章节id为0
            # 构造章节加入,该章节为第一章,下一章为原先的第一章
            new_fc = FirstCategory(name=title, belong_class_id=class_id, next_category_id=next_id,
                                   is_first_category=True)
        elif before.strip() == "last":
            # 找到最后一个章节
            lc = FirstCategory.query.with_parent(user_class).filter_by(next_category_id=0).first()
            # 最后一个章节的下一章为该章节的id
            lc.next_category_id = new_fc_id
            # 构造章节加入,该章节为最后一章 / 第一章
            new_fc = FirstCategory(name=title, belong_class_id=class_id, next_category_id=0)
        else:
            # 插入到指定章节后
            # 找到指定章节
            found_fc = FirstCategory.query.filter_by(belong_class_id=class_id, name=before).first()
            # 保存原来的下一个章节id
            next = found_fc.next_category_id
            found_fc.next_category_id = new_fc_id
            # 构造新章节，该章节为id=next的章节的后面一章
            new_fc = FirstCategory(name=title, belong_class_id=class_id, next_category_id=next)
        # 插入数据
        db.session.add(new_fc)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 删除章节
@t_course.route("/del_fc", methods=["POST"])
def del_fc():
    try:
        data = request.get_json()
        # fc_id 是 1-XX 的形式
        # 获得要删除的章节的id
        fc_id = data.get("fc_id")
        fc_id = int(fc_id.split("-")[1])
        fc = FirstCategory.query.get(fc_id)
        # 如果该章节是第一章
        if fc.is_first_category:
            # 若总共只有一章则什么也不做
            if fc.next_category_id != 0:
                # 否则该章节的下一章设为链表头
                next_fc = FirstCategory.query.get(fc.next_category_id)
                next_fc.is_first_category = True
        # 如果该章节不是第一章
        else:
            # 找到该章节的上一章
            pre_fc = FirstCategory.query.filter_by(next_category_id=fc.id).first()
            # 上一章的指针指向要删除的章节的下一章
            pre_fc.next_category_id = fc.next_category_id
        # 删除章节
        db.session.delete(fc)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 重命名章节
@t_course.route("/rename_fc", methods=["POST"])
def rename_fc():
    try:
        data = request.get_json()
        name = data.get("name")
        fc_id = data.get("fc_id")
        fc_id = int(fc_id.split("-")[1])
        fc = FirstCategory.query.get(fc_id)
        fc.name = name
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 添加小章节/添加视频
@t_course.route("/create_sc", methods=["POST"])
def create_sc():
    try:
        title=session.get("title")
        fc_id=session.get("fc_id")
        #title="测试"
        #fc_id='1-3'
        # 接受视频文件
        movie_file = request.files.get("file")
        # 生成随机文件名
        filename = random_filename(movie_file.filename)
        # 生成文件保存路径
        save_path = '%s' %filename
        Path='/py3env/West2/West2OlineWork/static/movies/%s'%filename
        # 保存文件
        movie_file.save(Path)
        # 该视频属于的大章节
        #fc_id = str(dataDict.get("fc_id"))
        fc_id = int(fc_id.split("-")[1])
        # 构造二级目录
        new_sc = SecondCategory(name=title, parent_category_id=fc_id, movie=save_path)
        db.session.add(new_sc)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 删除小章节
@t_course.route("/del_sc", methods=["POST"])
def del_sc():
    try:
        data = request.get_json()
        # sc_id 是 2-XX 的形式
        # 获得要删除的章节的id
        sc_id = data.get("sc_id")
        sc_id = int(sc_id.split("-")[1])
        sc = SecondCategory.query.get(sc_id)
        # 删除小章节对应的视频
        os.remove(sc.movie)
        db.session.delete(sc)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 重命名小章节
@t_course.route("/rename_sc", methods=["POST"])
def rename_sc():
    try:
        data = request.get_json()
        # sc_id 是 2-XX 的形式
        # 获得要删除的章节的id
        sc_id = data.get("sc_id")
        sc_id = int(sc_id.split("-")[1])
        name = data.get("name")
        sc = SecondCategory.query.get(sc_id)
        sc.name = name
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 上传作业图片,通过base64保存
@t_course.route("/submit_work", methods=["POST"])
def submit_work():
    try:
        data = request.get_json()
        title = data.get("title")
        sc_id = data.get("sc_id")
        sc_id = int(sc_id.split("-")[1])
        imgs_arr = data.get("imgs")
        content = data.get("content")
        class_id=int(data.get("class_id"))
        save_content = content
        if len(imgs_arr) != 0:
            for img in imgs_arr:
                # 要上传的作业图片base64编码
                work_id = max([a.id for a in Assignment.query.all()]) + 1
                file_name = random_filename('works/%s.jpg' % str(work_id))
                # 保存路径
                work_path = "47.96.231.121/works/" + file_name
                # 动态拼接字符串
                save_content += "|%s" % file_name
                with open(work_path, 'wb') as w:
                    # 将作业图片保存到文件夹
                    w.write(base64.b64decode(img[23:]))
        assignment = Assignment(title=title, content=save_content, belong_category_id=sc_id,belong_class_id=class_id)
        db.session.add(assignment)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 重命名作业
@t_course.route("/rename_work", methods=["POST"])
def rename_work():
    try:
        data = request.get_json()
        name = data.get("name")
        assignment_id = data.get("assignment_id")
        sc_id = int(assignment_id.split("-")[1])
        sc = SecondCategory.query.get(sc_id)
        assign = sc.assignment
        assign = assign[0]
        assign.title = name
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 删除作业
@t_course.route("/del_work", methods=["POST"])
def del_work():
    try:
        data = request.get_json()
        assignment_id = data.get("assignment_id")
        sc_id = int(assignment_id.split("-")[1])
        sc = SecondCategory.query.get(sc_id)
        assign = sc.assignment
        for a in assign:
            db.session.delete(a)
            db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)




# 获取某个作业的所有提交内容
@t_course.route("/get_assignment_submit", methods=["POST"])
def get_assignment_submit():
    try:
        # 可以一次性获得所有，也可以只获取一个
        data = request.get_json()
        assignment_id = int(data.get("assignment_id"))
        # index表示要获取第几个提交内容,若不传则获取所有
        require_index = data.get("index")
        assign = Assignment.query.get(assignment_id)
        found_classes = Class.query.get(assign.belong_class_id)
        # 先获取到所有提交内容
        fss = assign.finish_status
        response_info = []
        temp = {"total_num": len(fss), "stds_num": len(found_classes.stds)}
        if require_index is None:
            # 提交总数
            details = []
            for fs in fss:
                details.append({
                    "id": fs.id,
                    "from_user": fs.finish_user.username,
                    "content": fs.finish_content,
                    "submit_time": datetime.datetime.strftime(fs.finish_time, "%Y-%m-%d %H:%M:%S"),
                    "score": fs.score,
                    "checkState": fs.is_correct
                })
            temp["details"] = details
        else:
            # 获取单个,index从0开始
            single_fs = fss[int(require_index)]
            temp["detail"] = [{
                "id": single_fs.id,
                "from_user": single_fs.finish_user.username,
                "content": single_fs.finish_content,
                "submit_time": datetime.datetime.strftime(single_fs.finish_time, "%Y-%m-%d %H:%M:%S"),
                "score": single_fs.score,
                "checkState": single_fs.is_correct
            }]
        response_info.append(temp)
        return responseBody(data=response_info)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)



# 批改作业（为某一份作业添加成绩）
@t_course.route("/correct_work", methods=["POST"])
def correct_work():
    try:
        data = request.get_json()
        # 获得要批改的某一份提交内容对象的id
        finish_id = int(data.get("finish_id"))
        # 简答题的得分
        score = int(data.get("score"))
        fs = FinishStatus.query.get(finish_id)
        fs.is_correct = 1
        # 得分加到成绩上
        fs.score += score
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 某一项作业的统计数据
@t_course.route("/get_statistical_data", methods=["POST"])
def get_statistical_data():
    try:
        data = request.get_json()
        assignment_id = int(data.get("assignment_id"))
        assign = Assignment.query.get(assignment_id)
        # 获取该作业的所有完成情况
        fss = assign.finish_status
        score_list = []
        max_score = 0
        min_score = 0
        avg_score = 0.0
        if len(score_list) != 0:
            for fs in fss:
                score_list.append(fs.score)
                max_score = max(score_list)
                min_score = min(score_list)
                avg_score = sum(score_list) / len(score_list)
        return responseBody(data=[{
            "avg_score": round(avg_score, 2),
            "min_score": min_score,
            "max_score": max_score

        }])
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


@t_course.route("/save_scdata", methods=["POST"])
def save_scdata():
    try:
        data = request.get_json()
        fc_id = data.get("fc_id")
        title = data.get("title")
        session["fc_id"] = fc_id
        session["title"] = title
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        session["fc_id"] = None
        session["title"] = None
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)
