class QuizMailer < ApplicationMailer
    default from: 'SartJob quiz <nicolascuevas@gmail.com>' # Replace this email address with your own
    layout 'mailer'


    def send_quiz_to_applicant
        @applicant = params[:applicant]

        mail(to: @applicant.email, subject: "SmartJov Testing - Solicitud de Test")
    end

end
