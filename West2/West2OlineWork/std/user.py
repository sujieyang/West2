from flask import Blueprint, request, url_for, session
from West2OlineWork.globals.models import Class, AssignmentRead, CourseRead, User
from West2OlineWork.globals.utils import responseBody, responseError, responseSuccess,find_teacher
from West2OlineWork.globals.responses import Responses
import base64,datetime
from flask_dropzone import random_filename

user = Blueprint(name="user", url_prefix="/std", import_name=__name__)


# 处理用户相关视图

# 获取用户未读信息（课程+作业）
@user.route("/get_unread", methods=["POST"])
def get_unread():
    data = request.get_json()
    try:
        user_id = int(data.get("user_id"))
        user = User.query.get(user_id)
        # 未读课程和未读作业个数
        unread_classes = []
        unread_assignment_count = 0
        # 用户的所有班级
        classes = user.user_classes
        for c in classes:
            classes_read = CourseRead.query.filter_by(class_id=c.id).first()
            if classes_read is not None:
                cIds_str = classes_read.readed_std_ids
                # id不再里面表示该课程未读
                if str(user.id) not in cIds_str.split("|"):
                    unread_classes.append({"name": c.class_name})
                #  该课程的作业
                assignments = c.assignments
                for a in assignments:
                    assignment_read = AssignmentRead.query.filter_by(assignment_id=a.id).first()
                    aIds_str = assignment_read.readed_std_ids
                    if str(a.id) not in aIds_str.split("|"):
                        unread_assignment_count += 1
        response_info = {
            "readingClassNum": len(unread_classes),
            "classNameList": unread_classes,
            "messageNum": unread_assignment_count
        }
        return responseBody(data=response_info)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)



# 用户主页
@user.route("/get_classes", methods=["POST"])
def get_classes():
    try:
        data = request.get_json()
        user_id = int(data.get("user_id"))
        classes = User.query.get(user_id).user_classes
        Classes = []
        for i in classes:
            Classes.append({
                "teacher": find_teacher(i.id).username,
                "subName": str(i.class_name),
                "class_id": i.id
            })
        return responseBody(data=Classes)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)


# 个人中心页面
@user.route("/get_messages", methods=["POST"])
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
        classes =User.query.get(user_id).user_classes
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
        date = session.get("login_date")
        if session.get("login_date") is None:
            date = datetime.datetime.now()
        Users.append({
            "user_name": user.username,
            "avatar": avatar_base64_str,
            "total_study": user.total_study,
            "login_date": date.strftime("%Y-%m-%d %H:%M:%S"),
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
