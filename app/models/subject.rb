class Subject < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :videos

  validates :name, presence: true, uniqueness: true, length: {minimum: 1}
end
