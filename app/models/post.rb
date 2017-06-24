class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects

  validates :title, presence: true, length: {minimum: 1}

  mount_uploader :blogheader, BlogHeaderUploader

  searchkick word_start: [:title]

  def search_data
    {
      title: title,
      content: content,
      deploy_date: deploy_date,
      subjects: subjects.map(&:name).join(" ")
    }
  end
end
