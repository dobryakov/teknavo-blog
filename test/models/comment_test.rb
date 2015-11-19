require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test 'basic workflow' do

    user    = users(:User1)
    assert    user.present?

    article = articles(:Article1)
    assert    article.present?

    comment = Comment.create(
      :body        => 'test',
      :commentable => article,
      :user        => user
    )

    assert comment.persisted?

    article.reload
    assert article.comments.count == 1
    assert article.comments == [ comment ]

  end

end
