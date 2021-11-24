class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,          null: false
      t.integer :category_id,   null: false
      t.integer :price,        null: false
      t.integer :explanation_id,     null: false
      t.integer :status_id,      null: false
      t.integer :days_id,       null: false
      t.references :user, foreign_key: true
      t.text :description,   null:false
      t.integer :prefectures_id ,    null:false

    end
  end
end