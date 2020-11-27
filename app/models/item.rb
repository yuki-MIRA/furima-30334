class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanatory_text
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
    validates :status_id, numericality: { other_than: 0, message: 'Select' }
    validates :delivery_fee_id, numericality: { other_than: 0, message: 'Select' }
    validates :address_id, numericality: { other_than: 0, message: 'Select' }
    validates :delivery_date_id, numericality: { other_than: 0, message: 'Select' }
    validates :genre_id, numericality: { other_than: 0, message: 'Select' }
    validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
