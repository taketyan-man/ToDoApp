class Item < ApplicationRecord
  mount_uploader :image,  ItemUploader

  # crop用の仮想attribute
  attr_accessor :image_x
  attr_accessor :image_y
  attr_accessor :image_w
  attr_accessor :image_h
end
