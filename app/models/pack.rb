class Pack < ActiveRecord::Base
  attr_accessible :international, :promo, :star, :category_id, :pdf, :image
  
  mount_uploader :pdf, FileUploader
  mount_uploader :image, FileUploader
end
