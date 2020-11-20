FactoryBot.define do
  factory :post do
    name { 'abc' }
    price { 11_111 }
    description { 'abcdefg' }
    evaluation { 2 }
    shop_name { 'hijk' }
    association :category
    association :user
  end
end
