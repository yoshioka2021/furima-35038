FactoryBot.define do
  factory :item do
    name {'オムライス'}
    description {'美味しいよ'}
    price {'300'}
    category_id {'3'}
    area_id {'3'}
    delivery_fee_id {'3'}
    delivery_time_id {'3'}
    state_id {'3'}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
