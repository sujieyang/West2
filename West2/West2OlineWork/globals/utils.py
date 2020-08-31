from flask import jsonify, session
from itsdangerous import TimedJSONWebSignatureSerializer, BadSignature, SignatureExpired

from West2OlineWork.globals.models import Class
from West2OlineWork.globals.responses import Responses
from faker import Faker

secret_key = "TOKEN"


# 返回格式
def responseBody(status=200, data=None, message=""):
    return jsonify(status=status, data=data, message=message)


def responseError(info_dict):
    return jsonify(status=info_dict.get("status"),
                   message=info_dict.get("message"))


def responseSuccess(info_dict):
    return jsonify(status=info_dict.get("status"),
                   message=info_dict.get("message"))


def token_check_required(func):
    def wrap_function():
        try:
            token = session.get("token")
            if token is None:
                return responseError(Responses.NO_TOKEN)
            user_id = validate_token(token)
            session["user_id"] = user_id
            func()
        except BadSignature:
            return responseError(Responses.INVALID_TOKEN)
        except SignatureExpired:
            return responseError(Responses.TOKEN_EXPRIRED)

    return wrap_function


def generate_token(user_id, expire=60 * 60):
    serializer = TimedJSONWebSignatureSerializer(expires_in=expire, secret_key=secret_key)
    return serializer.dumps(user_id).decode("ascii")


def validate_token(token):
    serializer = TimedJSONWebSignatureSerializer(secret_key=secret_key)
    user_id = serializer.loads(token)
    return user_id


def find_teacher(class_id):
    found_class = Class.query.get(int(class_id))
    for std in found_class.stds:
        if std.is_teacher:
            return std
