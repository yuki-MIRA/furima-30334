class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :address_id, :city, :house_number, :building_name, :tell_number, :purchase_record, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :address_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :house_number
    validates :tell_number, format: { with: /\A\d{11}\z/, message: 'input Only Numbers.Number of digits 11' }
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    BuyerAddress.create(postal_code: postal_code, address_id: address_id, city: city, house_number: house_number, building_name: building_name, tell_number: tell_number, purchase_record_id: purchase_record.id)
  end
end
