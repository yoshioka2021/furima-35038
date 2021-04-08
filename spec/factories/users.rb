FactoryBot.define do
  factory :user do
    nickname {'a'}
    email {Faker::Internet.free_email}
    password  {'abc123'}
    password_confirmation {password}
    first_name {'山田'}
    first_name_furigana {'ヤマダ'}
    last_name {'太郎'}
    last_name_furigana {'タロウ'}
    birth_date {'1956-07-21'}
  end
end
