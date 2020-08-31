from flask import Blueprint, request

from West2OlineWork.app import db
from West2OlineWork.globals.models import User, Class
from West2OlineWork.globals.responses import Responses
from West2OlineWork.globals.utils import responseError, responseBody, responseSuccess

manage = Blueprint("manage", __name__, url_prefix="/manage")


# 班级人数管理
@manage.route("/class_num_management", methods=["POST"])
def class_num_management():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        user_id = int(data.get("user_id"))
        # 判断要操作的用户是不是老师
        if not User.query.filter_by(id=user_id).first().is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)
        teacher_class = Class.query.get(class_id)
        stds = User.query.with_parent(teacher_class).filter_by(is_teacher=False).all()
        Message = []
        for s in stds:
            Message.append({
                'user_id': s.id,
                'account': s.account,
                'username': s.username
            })
        return responseBody(data=Message)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 删除选中学生，学生id用列表保存
@manage.route("/del_selected_stds", methods=["POST"])
def del_selected_stds():
    try:
        data = request.get_json()
        class_id = int(data.get("class_id"))
        # 要删除的学生id列表
        selected_stds = data.get("selected_stds")
        user_id = int(data.get("user_id"))
        user_class = Class.query.get(class_id)
        # 判断要操作的用户是不是老师
        if not User.query.filter_by(id=user_id).first().is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)
        for std in selected_stds:
            student = User.query.get(int(std))
            # 解除该学生和班级的关联
            user_class.stds.remove(student)
            db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 班级管理
@manage.route("/class_management", methods=["POST"])
def class_management():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        user = User.query.filter_by(id=user_id).first()
        if not user.is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)

        classes = User.query.get(user_id).user_classes
        Message = [{
            'avatar': user.avatar,
        }]
        classes_message = []
        for c in classes:
            classes_message.append({
                'subName': c.class_name,
                'class_id': c.id,
                'num': len(c.stds)
            })
        Message[0]["classes_message"] = classes_message
        return responseBody(data=Message)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 添加单个班级成员
@manage.route("/add_single_std", methods=["POST"])
def add_single_std():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        class_id = int(data.get("class_id"))
        # 用户账号
        account = data.get("account")
        # 用户名
        username = data.get("username")
        user = User.query.filter_by(id=user_id).first()
        if not user.is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)
        classes = Class.query.get(class_id)
        u = User.query.filter_by(account=account, username=username)
        # 若要添加的学生不存在则添加进User表后再加入班级
        if u is None:
            new_user = User(account=account,username=username)
            # 初始密码可设置
            new_user.set_password("2020")
            db.session.add(new_user)
            # 先插入用户
            db.session.commit()
            found_user = User.query.filter_by(account=account, username=username)
            # 在加入班级关联
            classes.stds.append(found_user)
            db.session.commit()
        else:
            classes.stds.append(u)
            db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 申请新班级
@manage.route("/apply_class", methods=["POST"])
def apply_class():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        class_name = data.get("class_name")
        user = User.query.filter_by(id=user_id).first()
        if not user.is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)
        # 若为空，则默认值
        class_info = data.get("class_info")
        if class_info.strip() == "":
            c = Class(class_name=class_name)
        else:
            c = Class(class_name=class_name, info=class_info)
        c.stds.append(user)
        db.session.add(c)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 解散班级
@manage.route("/close_class", methods=["POST"])
def close_class():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        class_id = int(data.get("class_id"))
        user = User.query.filter_by(id=user_id).first()
        if not user.is_teacher:
            return responseError(Responses.AUTHORIZATION_ERROR)
        found_class = Class.query.get(class_id)
        db.session.delete(found_class)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseSuccess(Responses.PARAMETERS_ERROR)
