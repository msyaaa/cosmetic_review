FactoryBot.define do
  factory :post do
    name { 'abc' }
    price { 11_111 }
    description { 'abcdefg' }
    category_id { 2 }
    evaluation { 2 }
    association :user
  end
end
