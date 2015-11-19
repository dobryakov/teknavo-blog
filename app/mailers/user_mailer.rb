class UserMailer < ApplicationMailer

  def welcome_email(user, article)
    @user = user
    @article = article
    @unsubscribe_url  = 'http://example.com/login' # @TODO
    mail(to: @user.email, subject: 'New article from awesome Teknavo Blog')
  end

end
