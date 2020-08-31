import base64,datetime
from West2OlineWork.globals.utils import find_teacher
from flask import Blueprint, request, url_for, session
from flask_ckeditor import random_filename

from West2OlineWork.globals.models import User, Class
from West2OlineWork.globals.responses import Responses
from West2OlineWork.globals.utils import responseBody, responseError, responseSuccess

# 老师端的个人信息相关的视图函数
t_user = Blueprint("t_user", __name__, url_prefix="/tech")


# 个人中心页面
@t_user.route("/get_messages", methods=["POST"])
def get_messages():
    try:
        user_data = request.get_json()
        user_id = int(user_data.get("user_id"))
        user = User.query.filter_by(id=user_id).first()

        Messages = []
        # 用户班级信息
        Classes = []
        # 用户个人信息
        Users = []
        classes = user.user_classes
        for i in classes:
            Classes.append({
                "teacher": find_teacher(i.id).username,
                "subName": str(i.class_name),
                "class_id": int(i.id)
            })
        user_avatar = "default.jpg"
        if user.avatar != "default":
            user_avatar = user.avatar
            Type=user_avatar.strip('.')[1]
        else:
            Type='jpg'
        avatar_path = '/py3env/West2/West2OlineWork/static/avatars/%s' % user_avatar
        with open(avatar_path, 'rb') as f:
            stream = base64.b64encode(f.read())
            avatar_base64_str = str(stream, encoding='utf-8')
        print(Type) 
        Users.append({
            "user_name": user.username,
            "avatar": avatar_base64_str,
            "login_date": session.get("login_date",datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S"),
            "class_count": len(classes),
            "type":Type
        })
        Messages.append(
            {
                "user_info": Users,
                "classes_info": Classes
            }
        )
        return responseBody(data=Messages)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)
