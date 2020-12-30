FactoryBot.define do
  factory :comment do
    association :user
    association :item
    
    text   { 'テスト投稿' }
  end
end
