FactoryGirl.define do

  factory :review do
    msg { Forgery(:lorem_ipsum).words(5) }
    user {FactoryGirl.create(:user)}
    product {FactoryGirl.create(:product)}
  end
end