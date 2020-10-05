FactoryBot.define do
  factory :transaction_distination do
    post_code { '123-4567' }
    prefecture_code_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    token {'sample_token'}
    phone_number {'09000000000'}

  end
end