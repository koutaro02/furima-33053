FactoryBot.define do
  factory :item do
    product { 'ぬいぐるみ' }
    product_explain { 'イルカのぬいぐるみ' }
    category_id { '7' }
    condition_id { '2' }
    burden_id { '3' }
    prefecture_id { '24' }
    delivery_time_id { '2' }
    price { '1000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image_sample.png'), filename: 'image_sample.png')
    end
  end
end
