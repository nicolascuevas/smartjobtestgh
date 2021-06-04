class UserMailer < ApplicationMailer
    default from: 'SartJob quiz <nicolascuevas@gmail.com>' # Replace this email address with your own
    layout 'mailer'


    def applicant_answered_tests

        @user = params[:user]
        @applicant = params[:applicant]
        mail(to: @user.email, subject: "SmartJob Testing - Solicitud de Test")

    end

end
