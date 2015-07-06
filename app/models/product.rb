class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  attachment :product_image
end
