FactoryBot.define do
  factory :user do
    nickname { 'TestUser' }
    email { 'test@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    first_name { '太郎' }
    last_name { '山田' }
    katakana_first_name { 'タロウ' }
    katakana_last_name { 'ヤマダ' }
    birthday { '1990-01-01' }
  end
end
