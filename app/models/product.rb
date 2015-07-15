class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  attachment :product_image
  validates_presence_of :title, :description, :category_id, :price

end
