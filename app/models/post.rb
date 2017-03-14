class Post < ApplicationRecord
  has_and_belongs_to_many :categories

  validates :title, length: {minimum: 1}

  mount_uploader :blogheader, BlogHeaderUploader
end
