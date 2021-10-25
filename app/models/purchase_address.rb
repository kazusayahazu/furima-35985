class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_source_id, :municipalities, :address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :municipalities, :address, :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source_id, numericality: { other_than: 1 , message: "can't be blank" } 
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end