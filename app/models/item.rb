class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :days

  validates :image, :name, :text, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :days_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 } 
  validates :price, format: { with: /\A[0-9]+\z/ } 
end