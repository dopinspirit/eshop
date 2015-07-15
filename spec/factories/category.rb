FactoryGirl.define do
  factory :category do
    name {Forgery(:lorem_ipsum).word}
  end

end