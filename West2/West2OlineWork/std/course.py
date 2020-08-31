import datetime

from flask import Blueprint, request

from West2OlineWork.app import db
from West2OlineWork.globals.models import Talkings, Class, Comments, User, FinishStatus
from West2OlineWork.globals.responses import Responses
from West2OlineWork.globals.utils import responseError, responseSuccess, responseBody

course = Blueprint("course", __name__, url_prefix="/std")


# 作业提交，提交内容直接保存到数据库
@course.route("/submit_work", methods=["POST"])
def submit_work():
    try:
        data = request.get_json()
        # 提交用户
        user_id = int(data.get("user_id"))
        # 作业id
        assignment_id = int(data.get("assignment_id"))
        # 提交内容
        content = data.get("content")
        # 如果要判断答案，则先找到Assignment对象，然后获取answer，与用户的提交内容选择题部分判断
        # 然后把分数加到score

        # 查看是否已存在提交记录
        fs = FinishStatus.query.filter_by(assignment_id=assignment_id, finish_user_id=user_id).first()
        if fs is not None:
            # 存在提交记录则更新内容和提交时间
            fs.finish_content = content
            fs.finish_time = datetime.datetime.utcnow
        else:
            # 否则构造提交记录并插入
            fs = FinishStatus(assignment_id=assignment_id, finish_user_id=user_id, finish_content=content)
            db.session.add(fs)
        db.session.commit()
        return responseSuccess(Responses.OPERATION_SUCCESS)
    except Exception as e:
        print(e)
        db.session.rollback()
        return responseError(Responses.PARAMETERS_ERROR)


# 获取用户提交内容
@course.route("/get_submit", methods=["POST"])
def get_submit():
    try:
        data = request.get_json()
        # 提交用户
        user_id = int(data.get("user_id"))
        # 作业id
        assignment_id = int(data.get("assignment_id"))
        fs = FinishStatus.query.filter_by(assignment_id=assignment_id, finish_user_id=user_id).first()
        if fs is None:
            return responseError(Responses.NO_RECORD_FOUND)
        response_info = [{
            "content": fs.finish_content,
            # 上次修改时间
            "update_time": datetime.datetime.strftime(fs.finish_time, "%Y-%m-%d %H:%M:%S")
        }]
        return responseBody(data=response_info)
    except Exception as e:
        print(e)
        return responseError(Responses.PARAMETERS_ERROR)
