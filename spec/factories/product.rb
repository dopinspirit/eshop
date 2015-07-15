FactoryGirl.define do
  factory :product do
    title { Forgery(:lorem_ipsum).word}
    description {Forgery(:lorem_ipsum).words(5) }
    price 999.9

    category_id {FactoryGirl.create(:category).id}
  end

end