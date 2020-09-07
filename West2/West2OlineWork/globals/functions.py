import base64
import datetime

from flask import Blueprint, request, url_for
from flask_dropzone import random_filename

from West2OlineWork.app import db
from West2OlineWork.globals.utils import responseBody, responseError, responseSuccess,find_teacher
from West2OlineWork.globals.models import Class, Notices, User, FinishStatus, FirstCategory, SecondCategory, Comments, \
    Talkings, Assignment
from West2OlineWork.globals.responses import Responses

functions = Blueprint("functions", __name__)


# 获取最新的课程和作业，最多返回三条
@functions.route("/latest_courses_assigns", methods=["POST"])
def latest_courses_assigns():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        found_class = Class.query.get(class_id)
        # 排序获得课程列表
        Scs = SecondCategory.query.with_parent(found_class).order_by(SecondCategory.add_time.desc()).all()
        # 排序获得作业列表
        assigns = Assignment.query.with_parent(found_class).order_by(Assignment.publish_date.desc()).all()

        response_info = {}

        S_end = 3 if len(Scs) >= 3 else len(Scs)
        A_end = 3 if len(assigns) >= 3 else len(assigns)
        S_details = []
        A_details = []
        if Scs != [] and assigns != []:
            for sc in Scs[:S_end]:
                A_details.append({
                    "course_id": sc.id,
                    "course_name": sc.name
                })
            for a in assigns[:A_end]:
                S_details.append({
                    "assign_id": a.id,
                    "assign_name": a.title
                })
        response_info["course"] = S_details
        response_info["assign"] = A_details
        return responseBody(data=response_info)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 获取目录列表
@functions.route("/get_course_list", methods=["POST"])
def get_course_list():
    try:
        data = request.get_json()
        # 用户id
        user_id = int(data.get("user_id"))
        # 班级id
        class_id = int(data.get("class_id"))
        if class_id is None or user_id is None:
            return responseError(Responses.SEARCH_CATS_ERROR)
        # 获得班级记录
        user_class = Class.query.get(class_id)
        if user_class is None:
            return responseError(Responses.NO_CLASS_FOUND)
        # 班级对应的第一个一级目录
        first_cat = FirstCategory.query.with_parent(user_class).filter_by(is_first_category=True).first()
        if first_cat is None:
            return responseBody(data=[])
        response_data = []
        # 遍历目录的下一个目录,直到最后一个之前
        while first_cat.next_category_id != 0:
            details = []
            temp_dict = {
                "id": "1-" + str(first_cat.id),
                "name": first_cat.name,
                "num": len(first_cat.sub_categories)
            }
            # 每个一级目录对应的二级目录,通过添加时间排序
            for sc in SecondCategory.query.with_parent(first_cat).order_by(SecondCategory.add_time).all():
                details.append({
                    "details_id": "2-" + str(sc.id),
                    "details_name": sc.name,
                    # 二级目录对应的视频路径
                    "details_movie": "47.96.231.121/movies/"+sc.movie
                })
            temp_dict["details"] = details
            response_data.append(temp_dict)
            # 下一个一级目录
            first_cat = FirstCategory.query.get(first_cat.next_category_id)
        # 加入最后一个目录
        details = []
        temp_dict = {
            "id": "1-" + str(first_cat.id),
            "name": first_cat.name,
            "num": len(first_cat.sub_categories)
        }
        # 最后一个一级目录对应的二级目录
        for sc in SecondCategory.query.with_parent(first_cat).order_by(SecondCategory.add_time).all():
            details.append({
                "details_id": "2-" + str(sc.id),
                "details_name": sc.name,
                "details_movie": "47.96.231.121/movies/"+sc.movie
            })
        temp_dict["details"] = details
        response_data.append(temp_dict)

        return responseBody(data=response_data)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)



# 获取所有公告
@functions.route("/get_notices", methods=["POST"])
def get_notices():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        c = Class.query.get(class_id)
        notices = Notices.query.with_parent(c).order_by(Notices.create_time.desc()).all()
        response_info = []
        for n in notices:
            response_info.append({
                "notice_id":n.id,
                "title": n.title,
                "contant": n.content
            })
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)
    return responseBody(data=response_info)



# 处理搜索功能
@functions.route("/search", methods=["POST"])
def search_course():
    try:
        data = request.get_json()
        query = data.get("query")
        user_id = int(data.get("user_id"))
        user = User.query.get(user_id)
        result = Class.query.with_parent(user).whooshee_search(query).order_by(Class.id).all()
        class_info = []
        for i in result:
            class_info.append({
                "teacher": find_teacher(i.id).username,
                "subName": str(i.class_name),
                "class_id": i.id
            })
        return responseBody(data=class_info)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 获取班级下的所有作业（与二级目录一一对应）
@functions.route("/get_workList", methods=["POST"])
def get_work_list():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        user_id = int(data.get("user_id"))
        user_class = Class.query.get(class_id)
        # 获取该班级下的所有大章节链表表头
        first_cat = FirstCategory.query.with_parent(user_class).filter_by(is_first_category=True).first()
        if first_cat is None:
            return responseBody(data=[])
        response_info = []
        # 循环到最后一个章节之前
        while first_cat.next_category_id != 0:
            details = []
            temp_dict = {
                "id": "1-" + str(first_cat.id),
                "name": first_cat.name,
                "num": len(first_cat.sub_categories)
            }
            # 每个一级目录对应的二级目录,通过添加时间排序
            for sc in SecondCategory.query.with_parent(first_cat).order_by(SecondCategory.add_time).all():
                is_done = True
                assignment = sc.assignment
                if len(assignment) != 0:
                    # 查看用户是否完成该作业
                    assignment = assignment[-1]
                    record = FinishStatus.query.filter_by(assignment_id=assignment.id, finish_user_id=user_id).first()
                    if record is None:
                        is_done = False
                    details.append({
                        "sc_id": "2-" + str(sc.id),
                        "details_isdone": is_done,
                        # 作业的id
                        "details_id": assignment.id,
                        "details_name": assignment.title,
                    })
                temp_dict["details"] = details
            response_info.append(temp_dict)
            # 下一个一级目录
            first_cat = FirstCategory.query.get(first_cat.next_category_id)
        # 加入最后一个章节
        details = []
        temp_dict = {
            "id": "1-" + str(first_cat.id),
            "name": first_cat.name,
            "num": len(first_cat.sub_categories)
        }
        # 最后一个一级目录对应的二级目录,通过添加时间排序
        for sc in SecondCategory.query.with_parent(first_cat).order_by(SecondCategory.add_time).all():
            is_done = True
            assignment = sc.assignment
            if len(assignment) != 0:
                # 查看用户是否完成该作业
                assignment = assignment[-1]
                record = FinishStatus.query.filter_by(assignment_id=assignment.id, finish_user_id=user_id).first()
                if record is None:
                    is_done = False
                details.append({
                    "sc_id": "2-" + str(sc.id),
                    "details_isdone": is_done,
                    # 作业的id
                    "details_id": assignment.id,
                    "details_name": assignment.title,
                })
            temp_dict["details"] = details
        response_info.append(temp_dict)
        return responseBody(data=response_info)

    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)
        

# 获取某一条作业
@functions.route("/get_work", methods=["POST"])
def get_work():
    try:
        data = request.get_json()
        assignment_id = int(data.get("assignment_id"))
        assign = Assignment.query.get(assignment_id)
        if assign is None:
            return responseError(Responses.NO_RECORD_FOUND)
        content_info = assign.content.split("|")
        work_title = assign.title
        work_content = content_info[0]
        imgs = []
        if len(content_info) > 1:
            for img_url in content_info[1:]:
                work_img_path = "47.96.231.121/works/" + img_url
                with open(work_img_path, 'rb') as f:
                    stream = base64.b64encode(f.read())
                    work_base64_str = str(stream, encoding='utf-8')
                    imgs.append(work_base64_str)
        return responseBody(data={
            "title": work_title,
            "content": work_content,
            "imgs": imgs
        })
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)




# 上传头像
@functions.route("/update_face", methods=["POST"])
def update_face():
    try:
        user_data = request.get_json()
        user_id = int(user_data.get("user_id"))
        user_face = user_data.get("user_face")
        file_type=user_data.get("type")
        user = User.query.filter_by(id=user_id).first()
        user_avatar = "default.jpg"
        if user.avatar != "default":
            user_avatar = "%s.%s" % (user.username, file_type)
        avatar_filename = random_filename(user_avatar)
        user.avatar = avatar_filename
        db.session.commit()
        avatar_path = '/py3env/West2/West2OlineWork/static/avatars/%s' % avatar_filename
        Users = []
        # 写入图片并保存
        with open(avatar_path, 'wb') as w:
            w.write(base64.b64decode(user_face[23:]))
        # 获得修改后的头像的base64编码
        with open(avatar_path, 'rb') as f:
            stream = base64.b64encode(f.read())
            avatar_base64_str = str(stream, encoding='utf-8')
        Users.append({
            "user_name": user.username,
            "avatar": avatar_base64_str,
            "type":file_type,
            "total_study": user.total_study
        })
        return responseBody(data=Users)
    except Exception as e:
        print(e)
        db.session.commit()
        return responseError(Responses.PARAMETERS_ERROR)


# 修改密码
@functions.route("/update_password", methods=["POST"])
def update_password():
    try:
        user_data = request.get_json()
        user_id = int(user_data.get("user_id"))
        old_password = user_data.get("old_password")
        new_password1 = user_data.get("new_password1")
        new_password2 = user_data.get("new_password2")
        users = User.query.filter_by(id=user_id).first()
        # 密码不等
        if not users.check_password(old_password):
            return responseError(Responses.INCORRECT_PASSWORD)
        # 两次密码不一致
        elif new_password1 != new_password2:
            return responseError(Responses.NOT_SAME_PASSWORD)
        else:
            users.set_password(new_password1)
            db.session.commit()
            return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 获取该讨论的所有评论
@functions.route("/get_comments", methods=["POST"])
def get_comments():
    try:
        data = request.get_json()
        talkings_id = int(data.get("talking_id"))
        comments = Comments.query.filter_by(belong_talking_id=talkings_id, is_reply=False).order_by(
            Comments.send_time.desc()).all()
        Message = []
        for index, c in enumerate(comments):
            Message.append({
                "index": index,
                "comment_id": c.id,
                "content": c.content,
                "userName": User.query.filter_by(id=c.from_user_id).first().username,
                "reply_num":len(c.replies),
                "date": datetime.datetime.strftime(c.send_time, '%Y-%m-%d %H:%M:%S')
            })
        return responseBody(data=Message)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 删除讨论
@functions.route("/del_talking", methods=["POST"])
def del_talking():
    try:
        data = request.get_json()
        talking_id = int(data.get("talking_id"))
        t = Talkings.query.get(talking_id)
        db.session.delete(t)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 发送评论
@functions.route("/send_comment", methods=["POST"])
def send_comment():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        talking_id = int(data.get("talking_id"))
        content = data.get("content")
        comment = Comments(content=content, from_user_id=user_id, belong_talking_id=talking_id, replied_id=None,
                           is_reply=False)
        db.session.add(comment)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)



# 删除评论
@functions.route("/delete_comments", methods=["POST"])
def delete_comments():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        comment_id = int(data.get("comment_id"))
        comments = Comments.query.filter_by(from_user_id=user_id, id=comment_id).first()
        db.session.delete(comments)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)

# 发送回复
@functions.route("/send_reply", methods=["POST"])
def send_reply():
    try:
        data = request.get_json()
        comment_id = int(data.get("comment_id"))
        user_id = int(data.get("user_id"))
        talking_id = int(data.get("talking_id"))
        content = data.get("content")
        comment = Comments(content=content, from_user_id=user_id, belong_talking_id=talking_id, replied_id=comment_id,
                           is_reply=True)
        db.session.add(comment)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)



# 获取某条评论的所有回复
@functions.route("/get_replies", methods=["POST"])
def get_replies():
    try:
        data = request.get_json()
        # comment_id为要查看的某条评论/回复 的id
        comment_id = int(data.get("comment_id"))
        Mes = Comments.query.filter_by(id=comment_id).first()
        # 获取这条评论/回复的所有回复，每个回复是一个Comment对象
        replies = Mes.replies
        Message = []
        for index, c in enumerate(replies):
            Message.append({
                # index为评论编号,从0开始
                "index": index,
                "comment_id": c.id,
                "user_id": c.from_user_id,
                "content": c.content,
                "userName": User.query.filter_by(id=c.from_user_id).first().username,
                "date": datetime.datetime.strftime(c.send_time, '%Y-%m-%d %H:%M:%S')
            })
        return responseBody(data=Message)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 获取所有讨论（帖子）
@functions.route("/get_talkings", methods=["POST"])
def get_talking():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        c = Class.query.get(class_id)
        talkings = Talkings.query.with_parent(c).order_by(Talkings.publish_time.desc()).all()
        response_info = []
        for t in talkings:
            cs = Comments.query.with_parent(t).filter_by(is_reply = False).count()
            response_info.append({
                "id": t.id,
                "title": t.title,
                "content": t.content,
                "userName": t.publish_user.username,
                "date": datetime.datetime.strftime(t.publish_time, "%Y-%m-%d %H:%M:%S"),
                "replyNum": cs
            })
        return responseBody(data=response_info)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)



# 发布讨论
@functions.route("/post_discussion", methods=["POST"])
def post_discussion():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        class_id = int(data.get("class_id"))
        title = data.get("title")
        content = data.get("content")
        New_talkings = Talkings(title=title, content=content, belong_class_id=class_id, publish_user_id=user_id)
        db.session.add(New_talkings)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)
