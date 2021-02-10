class MailerController < ApplicationController
    def create
        mailer=Mailer.new(
         name:params[:name],
         email:params[:email],
         message:params[:message])
            if mailer.name=="" || mailer.email=="" || mailer.message==""
                flash[:notice]="項目を埋めてください"
                @name=params[:name]
                @email=params[:email]
                @message=params[:message]
                redirect_to('/')
            else
               MailerMailer.send_mail(mailer).deliver_now
               flash[:notice]="メッセージを送りました"
               redirect_to('/')
            end
    end

end