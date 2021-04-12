class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:area_id,:municipality,:address,:building,:phone_number,:purchase_id,:user_id,:item_id

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end