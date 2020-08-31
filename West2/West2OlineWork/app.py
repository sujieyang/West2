from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os
from flask_whooshee import Whooshee
from flask_cors import CORS
DATABASE = "education_web"

app = Flask(__name__)


# app配置
class Config:
    SECRET_KEY = "I'm  a secret key"
    # 数据库相关配置
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:Cold123#@127.0.0.1:3306/west2olinework"
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    # 搜索功能相关配置
    WHOOSHEE_MIN_STRING_LEN = 1


app.config.from_object(Config)
CORS(app)
db = SQLAlchemy(app)
whooshee = Whooshee(app)
# 注册蓝图

from West2OlineWork.globals.functions import functions
from West2OlineWork.globals.auth import auth
from West2OlineWork.std.user import user
from West2OlineWork.std.course import course
from West2OlineWork.teacher.user import t_user
from West2OlineWork.teacher.course import t_course
from West2OlineWork.teacher.manage import manage
app.register_blueprint(functions)
app.register_blueprint(auth)
app.register_blueprint(user)
app.register_blueprint(course)
app.register_blueprint(t_user)
app.register_blueprint(t_course)
app.register_blueprint(manage)
