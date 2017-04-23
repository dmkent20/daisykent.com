class Video < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects

  validates :title, presence: true, length: {minimum: 1}
  validates :ytlink, presence: true, length: {minimum: 1}
end
