FactoryBot.define do
  factory :item do
    name               { Faker::Commerce.name }
    text               { Faker::Lorem.sentence }
    category_id        { 2 }
    status_id          { 2 }
    delivery_fee_id    { 2 }
    shipment_source_id { 2 }
    days_id            { 2 }
    price              { 1500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
