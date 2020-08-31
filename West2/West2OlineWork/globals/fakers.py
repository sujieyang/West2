import random

from faker import Faker

# from West2OlineWork.globals.models import User
from West2OlineWork.app import db
from West2OlineWork.globals.models import User, Class, Talkings, Comments, Notices, FirstCategory, SecondCategory
from werkzeug.security import generate_password_hash

faker_en = Faker()
faker_cn = Faker('zh_CN')

"""
    调用顺序
    1.调用generate_fake_account(is_teacher = True)生成教师账号(账号个数可自己指定)
    2.调用generate_fake_classes生成班级信息，教师随机选择一个班级--》一个教师可能有多个班级，但一个班级只能有一个教师
    3.在这之后就不能在添加教师账号和班级了，只可通过generate_fake_account(is_teacher = False)添加学生账号，学生会随机选择班级加入
    4.generate_fake_talkings，generate_fake_comments无特别调用顺序要求
"""


# 生成虚拟账号,is_teacher用于指定生成学生账号还是老师账号
def generate_fake_account(count=20, is_teacher=False):
    try:
        if is_teacher :
            for c in range(count):
                user = User(account=faker_en.first_name(), username=faker_en.name(),
                            password=generate_password_hash("123456"), mobile=faker_en.phone_number(),
                            email=faker_en.email(), is_teacher=is_teacher)
                db.session.add(user)
            db.session.commit()
        else:
            for c in range(count):
                user = User(account=faker_en.first_name(), username=faker_en.name(),
                            password=generate_password_hash("123456"), mobile=faker_en.phone_number(),
                            email=faker_en.email(), is_teacher=is_teacher)
                classes = Class.query.all()
                user.user_classes.append(random.choice(classes))
                db.session.add(user)
                db.session.commit()

    except Exception as e:
        print(e)
        db.session.rollback()


# 生成虚拟班级
def generate_fake_classes(count=10):
    try:
        for i in range(count):
            t_s = User.query.filter_by(is_teacher=True).all()
            t_ids = [t.id for t in t_s]
            t = User.query.get(random.choice(t_ids))
            c = Class(class_name=faker_cn.word())
            t.user_classes.append(c)
            db.session.add(c)
            db.session.commit()
    except Exception as e:
        print(e)
        db.session.rollback()


# 生成虚拟讨论数据
def generate_fake_talkings(count=20):
    try:
        for i in range(count):
            # 生成的文字数
            words_count = random.randint(150, 300)
            # 随机选择一个班级
            class_count = Class.query.count()
            class_id = random.randint(1, class_count)
            result = Class.query.get(class_id)
            stds = result.stds
            std_ids = [std.id for std in stds]
            title = faker_cn.sentence()
            content = faker_cn.text(words_count)
            t = Talkings(title=title, content=content,
                         belong_class_id=class_id,
                         publish_user_id=random.choice(std_ids))
            db.session.add(t)
            db.session.commit()
    except Exception as e:
        print(e)
        db.session.rollback()


# 生成虚拟评论
def generate_fake_comments(count=50):
    for i in range(count):
        class_id = random.randint(1, Class.query.count())
        random_class = Class.query.get(class_id)
        talking_ids = [t.id for t in random_class.talkings]
        if len(talking_ids) == 0:
            count += 1
            continue
        user_ids = [u.id for u in random_class.stds]
        content = faker_cn.sentence()
        c = Comments(content=content, from_user_id=random.choice(user_ids),
                     belong_talking_id=random.choice(talking_ids))
        db.session.add(c)
        db.session.commit()


# 验证每个班级的教师仅有一个
def test():
    for c in Class.query.all():
        exist = 0
        for std in c.stds:
            if std.is_teacher:
                exist += 1
        print(exist)

def generate_first_category(count=20):
    for i in range(count):
        class_id = Class.query.count()
        random_class = Class.query.get(random.randint(1, class_id))
        cs = random_class.categories
        if len(cs) == 0:
            fs = FirstCategory(name=faker_cn.sentence(), belong_class_id=random_class.id,
                               is_first_category=True)
            db.session.add(fs)
            db.session.commit()
        else:
            fc = None
            for c in cs:
                if c.next_category_id == 0:
                    fc = c
                    break
            new_id = max([f.id for f in FirstCategory.query.all()]) + 1
            fs = FirstCategory(name=faker_cn.sentence(), belong_class_id=random_class.id,
                               is_first_category=False)
            fc.next_category_id = new_id
            db.session.add(fs)
            db.session.commit()


def generate_second_category(count=40):
    for i in range(count):
        ids = [f.id for f in FirstCategory.query.all()]
        fc_id = random.randint(min(ids),max(ids))
        fc = FirstCategory.query.get(fc_id)
        sc = SecondCategory(name=faker_cn.word(),
                            parent_category_id=fc.id,
                            movie="default.mp4")
        db.session.add(sc)
        db.session.commit()


def generate_fake_notices(count = 20):
    for i in range(count):
        class_id = Class.query.count()
        random_class = Class.query.get(random.randint(1, class_id))
        n = Notices(title = faker_cn.sentence(),content = faker_cn.text(random.randint(200,250)),
                belong_class_id = random_class.id)
        db.session.add(n)
        db.session.commit()

def generate_repiles(count = 40):
    for i in range(count):
        class_id = Class.query.count()
        random_class = Class.query.get(random.randint(1,class_id))
        user_id = [s.id for s in random_class.stds]
        talking_id = [t.id for t in random_class.talkings]
        if len(talking_id) == 0:
            continue
        random_talking_id = random.choice(talking_id)
        talking = Talkings.query.get(random_talking_id)
        com_ids = [com.id for com in talking.comments]
        if com_ids == []:
            continue
        c = Comments(content = faker_cn.sentence(),from_user_id = random.choice(user_id),
                     is_reply = True,belong_talking_id = talking.id,replied_id = random.choice(com_ids))
        db.session.add(c)
        db.session.commit()

#generate_fake_account(count=5, is_teacher=True)
#generate_fake_classes(count=10)
#generate_fake_talkings(count=20)
#generate_fake_comments(count=40)
#generate_fake_account()


#generate_repiles()
#generate_first_category()
#generate_second_category()
#generate_fake_notices()