class Post < ApplicationRecord
  mount_uploader :blogheader, BlogHeaderUploader
end
