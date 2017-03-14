class Video < ApplicationRecord
  before_save :convert_to_embed

  def convert_to_embed
    self.ytlink = 'https://www.youtube.com/embed/' + self.ytlink.split('=').last
  end
end
