class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanatory_text
    validates :image
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :status_id
    validates :delivery_fee_id
    validates :address_id
    validates :delivery_date_id
    validates :genre_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee
end
