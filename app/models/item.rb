class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :delivery_fee
  belongs_to :delivery_time
  belongs_to :state

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :area_id
    validates :delivery_fee_id
    validates :delivery_time_id
    validates :state_id
  end

end