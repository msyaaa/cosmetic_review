FactoryBot.define do
  factory :post do
    name { 'abc' }
    price { 11_111 }
    description { 'abcdefg' }
    evaluation { 2 }
    association :category
    association :user
  end
end
