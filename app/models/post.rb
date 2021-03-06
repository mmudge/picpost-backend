class Post < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :comments, as: :object
  has_one_attached :photo

  def as_json(options={})
    super.merge(user: user, comments: comments)
  end
end
