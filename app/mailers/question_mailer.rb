class QuestionMailer < ApplicationMailer

  def response_notification(user, question)
    @user = user
    @question = question

    mail to: user.email, subject: "You have a response to your question"
  end
end
