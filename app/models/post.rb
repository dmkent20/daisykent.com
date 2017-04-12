class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects

  validates :title, presence: true, length: {minimum: 1}

  mount_uploader :blogheader, BlogHeaderUploader
end
