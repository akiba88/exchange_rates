FactoryGirl.define do
  factory :user do
    email 'admin@project.com'

    password '111111111'
    password_confirmation '111111111'
  end
end
