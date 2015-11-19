class ArticleCreatedJob < ActiveJob::Base
  queue_as :default

  def perform(h)

    article = h[:payload][:model]

    User.subscribed.each{|user|
      # @TODO sending notification
      logger.debug "Send notification to #{user.id} about article #{article.id}"
      UserMailer.welcome_email(user, article).deliver_later
    }

  end
end
