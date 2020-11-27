FactoryBot.define do
  factory :item do
    association :user

    name              {'テスト出品'}
    explanatory_text  {'テスト説明'}
    price             {1000}
    status_id         {1}
    delivery_fee_id   {1}
    address_id        {1}
    delivery_date_id  {1}
    genre_id          {1}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
