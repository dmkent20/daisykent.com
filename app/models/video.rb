class Video < ApplicationRecord
  has_and_belongs_to_many :categories
  
  validates :title, length: {minimum: 1}
  validates :ytlink, length: {minimum: 1}
  # validates_format_of :ytlink, with: /\Ahttps\:\/\/www.youtube.com\/watch\?v=.+/
  # before_save :convert_to_embed
  #
  # def convert_to_embed
  #   self.ytlink = 'https://www.youtube.com/embed/' + self.ytlink.split('=').last
  # end
end
