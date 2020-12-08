class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string     :postal_code,          null: false
      t.integer    :address_id,           null: false
      t.string     :city,                 null: false
      t.string     :house_number,         null: false
      t.string     :building_name
      t.string     :tell_number,          null: false
      t.references :purchase_record,      foreign_key: true
      t.timestamps
    end
  end
end
