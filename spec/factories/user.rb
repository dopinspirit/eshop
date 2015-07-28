FactoryGirl.define do

  factory :user do
    email { Forgery(:internet).email_address }
    admin false
    password "123456789"
  end

  factory :admin, class: User do
    email { Forgery(:internet).email_address }
    admin true
    password "123456789"
  end
end