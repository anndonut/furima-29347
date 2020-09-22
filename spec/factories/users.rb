FactoryBot.define do

  factory :user do
    first_name            {'亜あア'}
    first_name_kana       {'カタカナ'}
    family_name             {'亜あア'}
    family_name_kana        {'カタカナ'}
    nickname              {Faker::Name.initials(number: 2)}
    # birth_year            {2020}
    # birth_month           {1}
    birth_day             {20200101}
    email                 {"kkk@gmail.com"}
    # password              {Faker::Internet.password(min_length: 6)}
    password              {"aaa123456"}
    password_confirmation {password}
  end
end