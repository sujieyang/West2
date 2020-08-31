def get_response_dict(status, message):
    return {
        "status": status,
        "message": message
    }


class Responses:
    OPERATION_SUCCESS = get_response_dict(200,"操作成功")
    # 获取目录信息失败
    SEARCH_CATS_ERROR = get_response_dict(1001, "获取目录信息失败")
    # 未找到班级
    NO_CLASS_FOUND = get_response_dict(1002, "未找到班级!")
    # 未找到token信息
    NO_TOKEN = get_response_dict(1003, "为找到token信息!")
    INVALID_TOKEN = get_response_dict(1004, "无效的token！")
    TOKEN_EXPRIRED = get_response_dict(1005, "您的会话已过期!")
    NO_USER_FOUND = get_response_dict(1006, "该用户不存在!")
    INCORRECT_PASSWORD = get_response_dict(1007, "密码错误!")
    PARAMETERS_ERROR = get_response_dict(1008, "参数错误!")
    NOT_SAME_PASSWORD = get_response_dict(1009,"两次密码不一致!")
    AUTHORIZATION_ERROR = get_response_dict(1010,"权限不足!")
    NO_RECORD_FOUND = get_response_dict(1011,"未找到记录!")
