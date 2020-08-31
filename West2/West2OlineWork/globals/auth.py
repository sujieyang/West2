from flask import Blueprint, session, request, url_for

from West2OlineWork.app import db
from West2OlineWork.globals.models import User
from West2OlineWork.globals.responses import Responses
from West2OlineWork.globals.utils import responseBody, responseError, generate_token, responseSuccess
import base64
import datetime

# 处理用户认证的蓝图
auth = Blueprint("auth", __name__, url_prefix="/auth")


# 登录
@auth.route("/login",methods=["POST"])
def login():
    data = request.get_json()
    account = data.get("account")
    password = data.get("password")
    # 用户身份，若是教师，则is_teacher为True
    is_teacher = data.get("is_teacher")
    user = User.query.filter_by(account=account).first()
    # 用户不存在
    if not user or user.is_teacher != is_teacher:
        return responseError(Responses.NO_USER_FOUND)
    # 密码错误
    if not user.check_password(password):
        return responseError(Responses.INCORRECT_PASSWORD)
    # 生成token
    token = generate_token(user_id=user.id)
    session["token"] = token
    session["user_id"] = user.id
    # 获取用户头像路径
    user_avatar = "default.jpg"
    if user.avatar != "default":
        user_avatar = user.avatar
    avatar_path ='/py3env/West2/West2OlineWork/static/avatars/%s' % user_avatar
    # 用户账号，姓名，当前时间
    account = user.account
    username = user.username
    date = datetime.datetime.now()
    # 保存登录时间
    session["login_date"] = date
    # 获得头像base64编码
    with open(avatar_path, 'rb') as f:
        stream = base64.b64encode(f.read())
        avatar_base64_str = bytes.decode(stream)
        #print(avatar_base64_str)
        # 返回数据
        response_info = {
            "avadar": avatar_base64_str,
            "name": username,
            "userid":account,
            "user_id":user.id,
            "date": date.strftime("%Y-%m-%d %H:%M:%S"),
            "classNum": len(user.user_classes),
            "token": token
        }
        return responseBody(data=response_info)

@auth.route("/logout", methods=["POST"])
def logout():
    try:
        # 清空session
        session["token"] = None
        session["user_id"] = None
        data = request.get_json()
        user_id = int(data.get("user_id"))
        # 计算时间差
        logout_date = datetime.datetime.now()
        login_date = session.get("login_date",datetime.datetime.now())
        # 时间差
        result = (logout_date - login_date)
        diff_hours = int(result.days*24 + result.seconds/3600 + 1)
        user = User.query.get(user_id)
        # 更新用户学习时长
        user.total_study += diff_hours
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


