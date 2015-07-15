class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  attachment :product_image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
end
