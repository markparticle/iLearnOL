# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/12 17:35'
import random
from django.core.mail import send_mail,EmailMessage
from iLearnOL.settings import EMAIL_FROM
from django.core.mail import send_mail,EmailMessage
from users.models import EmailVerifyRecord
from django.template import loader

#随机字符串
def random_str(rangdomlength=8):
    code = ''
    for i in range(rangdomlength):
        add = random.choice([chr(random.randrange(65, 91)),chr(random.randrange(97, 122)),random.randrange(10)])
        code+=str(add)
    return code

def send_register_email(email,send_type="register"):
    email_record = EmailVerifyRecord()
    if send_type == 'update_email':
        code = random_str(8)
    else:
        code = random_str(32)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == "register":
        email_title = "ilearn学堂 注册激活链接（24小时内有效）"
        # email_body = "请点击下面的链接激活你的账号: http://127.0.0.1:8000/active/{0}".format(code)
        email_body = loader.render_to_string(
            "email_register.html",  # 需要渲染的html模板
            {
                "active_code": code  # 参数
            }
        )
        msg = EmailMessage(email_title, email_body, EMAIL_FROM, [email])
        msg.content_subtype = "html"
        send_status = msg.send()
        # 如果发送成功
        if send_status:
            pass

    elif send_type == "forget":
        email_title = "ilearn学堂 密码重置链接（请在24小时内更换密码，链接仅一次有效）"
        email_body = loader.render_to_string(
            "email_forget.html",  # 需要渲染的html模板
            {
                "active_code": code  # 参数
            }
        )
        msg = EmailMessage(email_title, email_body, EMAIL_FROM, [email])
        msg.content_subtype = "html"
        send_status = msg.send()
        if send_status:
            pass

    elif send_type == "update_email":
        email_title = "ilearn学堂 邮箱修改验证码（24小时内有效）"
        email_body = loader.render_to_string(
            "email_update_email.html",  # 需要渲染的html模板
            {
                "active_code": code  # 参数
            }
        )
        msg = EmailMessage(email_title, email_body, EMAIL_FROM, [email])
        msg.content_subtype = "html"
        send_status = msg.send()
        if send_status:
            pass













