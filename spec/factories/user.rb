FactoryGirl.define do

  factory :user do
    email { Forgery(:internet).email_address }
    admin false
    password "123456789"
  end

  factory :admin do
    email { Forgery(:internet).email_address }
    admin true
    password {Forgery(:basic).password}
  end
end