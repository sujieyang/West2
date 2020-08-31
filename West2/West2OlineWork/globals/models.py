from West2OlineWork.app import db, whooshee

from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash


class BaseModel:
    # id
    id = db.Column(db.Integer, primary_key=True)
    # 账号
    account = db.Column(db.String(120), nullable=False, unique=True)
    # 姓名
    username = db.Column(db.String(60), nullable=False)
    # 密码
    password = db.Column(db.String(100), nullable=False)
    # 手机
    mobile = db.Column(db.String(100), default="未填写", unique=True)
    # 邮箱
    email = db.Column(db.String(100), default="未填写", unique=True)
    # 学校
    college = db.Column(db.String(100), nullable=False,default="未填写")
    # 简介
    info = db.Column(db.String(255), default="该用户未填写简介~")
    # 性别,True为男
    gender = db.Column(db.Boolean, nullable=False,default=True)
    # 创建时间
    create_time = db.Column(db.DateTime, default=datetime.utcnow)
    # 用户头像
    avatar = db.Column(db.String(255), default="default")
    # 总学习时长
    total_study = db.Column(db.Integer, default=0)


# User 与 Class建立多对多关系
association_table = db.Table('association', db.Column('user_id', db.Integer, db.ForeignKey("user.id")),
                             db.Column('class_id', db.Integer, db.ForeignKey("class.id")), extend_existing=True)


# 用户表
class User(db.Model, BaseModel):
    __table_args__ = {"useexisting": True}
    # 用户班级，与Class表外键关联
    user_classes = db.relationship("Class", back_populates="stds", secondary=association_table)
    # 用户作业，集合属性，与作业状态表关联
    assignments = db.relationship("FinishStatus", back_populates="finish_user", cascade="all")
    # 用户发的讨论，集合属性，与讨论表关联
    talkings = db.relationship("Talkings", back_populates="publish_user", cascade="all")
    # 是否是教师
    is_teacher = db.Column(db.Boolean, default=False)
    # 用户发送的评论
    comments = db.relationship('Comments', back_populates="from_user", cascade="all")

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)

# 班级
@whooshee.register_model("class_name")
class Class(db.Model):
    __table_args__ = {"useexisting": True}
    # 班级id
    id = db.Column(db.Integer, primary_key=True)
    # 班级名
    class_name = db.Column(db.String(100), nullable=False)
    # 班级描述
    info = db.Column(db.String(255), default="该班级暂无描述")
    # 班级作业,与作业表关联
    assignments = db.relationship("Assignment", back_populates="belong_class", cascade="all")
    # 班级学生,与用户表关联
    stds = db.relationship("User", back_populates="user_classes", secondary=association_table)
    # 班级的讨论
    talkings = db.relationship("Talkings", back_populates="belong_class", cascade="all")
    # 班级视频目录
    categories = db.relationship("FirstCategory", back_populates="belong_class", cascade="all")
    # 班级公告
    notices = db.relationship("Notices", back_populates="belong_class", cascade="all")

# 作业
class Assignment(db.Model):
    __table_args__ = {"useexisting": True}
    # 作业id
    id = db.Column(db.Integer, primary_key=True)
    # 作业标题
    title = db.Column(db.String(255), nullable=False)
    # 作业内容 -->
    content = db.Column(db.Text, nullable=False)
    # 作业发布日期
    publish_date = db.Column(db.DateTime, default=datetime.utcnow)
    # 作业所属目录,与SecondCategory表关联
    belong_category = db.relationship("SecondCategory", back_populates="assignment")
    belong_category_id = db.Column(db.Integer, db.ForeignKey("second_category.id"))
    # 作业所属的班级
    belong_class = db.relationship("Class", back_populates="assignments")
    belong_class_id = db.Column(db.Integer, db.ForeignKey("class.id"))
    # 作业选择题对应的答案-->"A,B,C"
    answer = db.Column(db.String(255))
    # 该作业的完成情况
    finish_status = db.relationship("FinishStatus", back_populates="assignment", cascade="all")



# 作业完成状况
class FinishStatus(db.Model):
    __table_args__ = {"useexisting": True}

    # id
    id = db.Column(db.Integer, primary_key=True)
    # 作业,与作业表关联
    assignment = db.relationship("Assignment", back_populates="finish_status")
    assignment_id = db.Column(db.Integer, db.ForeignKey("assignment.id"))
    # 提交用户,与用户表关联
    finish_user = db.relationship("User", back_populates="assignments")
    finish_user_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    # 提交内容
    finish_content = db.Column(db.Text, nullable=False)
    # 提交时间
    finish_time = db.Column(db.DateTime, default=datetime.utcnow)
    # 作业得分,默认表示暂无得分
    score = db.Column(db.Integer, nullable=False, default=0)
    # 该作业是否已批改
    is_correct = db.Column(db.Integer, nullable=False, default=0)


# 讨论
class Talkings(db.Model):
    __table_args__ = {"useexisting": True}

    # id
    id = db.Column(db.Integer, primary_key=True)
    # 讨论题目
    title = db.Column(db.String(255), nullable=False)
    # 讨论内容
    content = db.Column(db.Text, nullable=False)
    # 讨论回复,与评论类关联
    comments = db.relationship("Comments", back_populates="belong_talking", cascade="all")
    # 讨论所属班级
    belong_class = db.relationship("Class", back_populates="talkings")
    belong_class_id = db.Column(db.Integer, db.ForeignKey("class.id"))
    # 公开时间
    publish_time = db.Column(db.DateTime, default=datetime.utcnow)
    # 发起用户
    publish_user = db.relationship("User", back_populates="talkings")
    publish_user_id = db.Column(db.Integer, db.ForeignKey("user.id"))


# 评论和回复
class Comments(db.Model):
    __table_args__ = {"useexisting": True}

    id = db.Column(db.Integer, primary_key=True)
    # 评论内容
    content = db.Column(db.Text, nullable=False)
    # 评论用户
    from_user = db.relationship("User", back_populates="comments")
    from_user_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    # 评论发布日期
    send_time = db.Column(db.DateTime, default=datetime.utcnow)
    # 评论是否是回复
    is_reply = db.Column(db.Boolean, default=False)
    # 评论属于的讨论
    belong_talking = db.relationship("Talkings", back_populates="comments")
    belong_talking_id = db.Column(db.Integer, db.ForeignKey("talkings.id"))
    # 被回复的评论id
    replied_id = db.Column(db.Integer, db.ForeignKey("comments.id"))
    # 被回复的评论
    replied = db.relationship("Comments", back_populates="replies", remote_side=[id])
    # 该评论的所有回复
    replies = db.relationship("Comments", back_populates="replied", cascade="all")


# 一级目录
class FirstCategory(db.Model):
    __table_args__ = {"useexisting": True}
    __tablename__ = "first_category"
    id = db.Column(db.Integer, primary_key=True)
    # 目录名
    name = db.Column(db.String(255))
    # 该目录属于的班级
    belong_class = db.relationship("Class", back_populates="categories")
    belong_class_id = db.Column(db.Integer, db.ForeignKey("class.id"))
    # 该目录下的二级目录
    sub_categories = db.relationship("SecondCategory", back_populates="parent_category", cascade="all")
    # 下一个一级目录的id，若下一个没有了则为0
    next_category_id = db.Column(db.Integer, default=0)
    # 该目录是否是第一个目录
    is_first_category = db.Column(db.Boolean, default=False)


# 二级目录
class SecondCategory(db.Model):
    __table_args__ = {"useexisting": True}

    __tablename__ = "second_category"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255))
    # 属于的父级目录
    parent_category = db.relationship("FirstCategory", back_populates="sub_categories")
    parent_category_id = db.Column(db.Integer, db.ForeignKey("first_category.id"))
    # 该目录对应的视频地址
    movie = db.Column(db.String(255))
    # 该二级目录对应的作业
    assignment = db.relationship("Assignment", back_populates="belong_category", cascade="all")
    # 该二级目录添加的时间
    add_time = db.Column(db.DateTime, default=datetime.utcnow)


# 课程已读情况
class CourseRead(db.Model):
    __table_args__ = {"useexisting": True}

    id = db.Column(db.Integer, primary_key=True)
    class_id = db.Column(db.Integer)
    # 保存已读学生id的字符串，如"1|2|3"
    readed_std_ids = db.Column(db.Text, default="")


# 作业已读情况
class AssignmentRead(db.Model):
    __table_args__ = {"useexisting": True}

    id = db.Column(db.Integer, primary_key=True)
    assignment_id = db.Column(db.Integer)
    readed_std_ids = db.Column(db.Text, default="")


class Notices(db.Model):
    __table_args__ = {"useexisting": True}
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255), nullable=False)
    content = db.Column(db.Text, nullable=False)
    belong_class = db.relationship("Class", back_populates="notices")
    belong_class_id = db.Column(db.Integer, db.ForeignKey("class.id"))
    create_time = db.Column(db.DateTime, default=datetime.utcnow)


# whooshee.reindex()
#db.drop_all()
db.create_all()