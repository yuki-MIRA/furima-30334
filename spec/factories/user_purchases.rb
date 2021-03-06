FactoryBot.define do
  factory :user_purchase do
    postal_code   { '123-4567' }
    address_id    { 1 }
    city          { '札幌市' }
    house_number  { '1 - 1 - 1' }
    building_name { '札幌ビル' }
    tell_number   { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
    user_id       { 1 }
    item_id       { 10 }
  end
end
