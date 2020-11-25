class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,              null: false
      t.text       :explanatory_text,  null: false
      t.integer    :price,             null: false
      t.integer    :status_id,         null: false
      t.integer    :delivery_fee_id,   null: false
      t.integer    :address_id,        null: false
      t.integer    :delivery_date_id,  null: false
      t.integer    :genre_id,          null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
