class UserMailer < ApplicationMailer

  def welcome_email(user, article)
    @user = user
    @article = article
    mail(to: @user.email, subject: 'New article from awesome Teknavo Blog')
  end

end
