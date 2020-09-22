FactoryBot.define do

  factory :user do
    first_name            {'kkk'}
    first_name_kana       {'カタカナ'}
    last_name             {'kkk'}
    last_name_kana        {'カタカナ'}
    nickname              {Faker::Name.initials(number: 2)}
    birth_year            {2020}
    birth_month           {1}
    birth_day             {1}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end