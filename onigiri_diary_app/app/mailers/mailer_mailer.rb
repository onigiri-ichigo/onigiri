class MailerMailer < ApplicationMailer
    def send_mail(mailer)
        @mailer=mailer
        mail(
            from: ENV['SECRET_MAILADDRESS'],
            to: 'onigiri.qanda@gmail.com',
            subject: '問い合わせ通知'
         )
    end
end
