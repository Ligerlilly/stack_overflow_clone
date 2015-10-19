FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end

  factory :question do
    title 'Adventure'
    content 'Time'
  end
end
