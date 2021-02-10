# Preview all emails at http://localhost:3000/rails/mailers/mailer_mailer
class MailerMailerPreview < ActionMailer::Preview
    
    def mailer
        mailer=Mailer.new(
            name:'いちご大福',
            message:"メッセージは仮"
            )
        MailerMailer.send_mail(mailer)
    end

end
