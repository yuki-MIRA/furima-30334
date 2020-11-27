FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { 'aaa111' }
    password_confirmation  { password }
    family_name            { '田中' }
    first_name             { '太郎' }
    family_name_reading    { 'タナカ' }
    first_name_reading     { 'タロウ' }
    birthday               { Faker::Date.between(from: '1993-01-01', to: '1995-12-31') }
  end
end
