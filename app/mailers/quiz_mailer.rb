class QuizMailer < ApplicationMailer
    default from: 'SartJob Testing <nicolascuevas@gmail.com>' # Replace this email address with your own
    layout 'mailer'


    def send_quiz_to_applicant

        @applicant = params[:applicant]
        mail(to: @applicant.email, subject: "Solicitud de Test - SmartJob Testing")

    end

end
