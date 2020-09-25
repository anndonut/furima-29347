FactoryBot.define do

  factory :item do  
    name                {"banana"}
    selling_price       {'11111'}
    introduction        {"aaa"}
    condition_id        {2}
    category_id         {2}
    shipping_expense_id {2}
    ship_from_area_id   {2}
    processing_time_id  {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end

end
