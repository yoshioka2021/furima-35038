class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :token
    validates :item_id
  end

  validates :area_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
