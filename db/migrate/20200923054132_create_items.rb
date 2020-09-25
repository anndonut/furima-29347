class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :name
      t.text      :introduction
      t.integer   :category_id
      t.integer   :condition_id
      t.integer   :shipping_expense_id
      t.integer   :ship_from_area_id
      t.integer   :processing_time_id
      t.integer   :selling_price
      t.references   :user, foreign_key:true
      t.timestamps
    end
  end
end
