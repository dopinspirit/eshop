class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :msg, presence: true
  validates :product_id, presence: true
  validates :user_id, presence: true
end
