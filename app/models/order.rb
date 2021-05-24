class Order < ApplicationRecord

belongs_to :customer
has_many :order_details, dependent: :destroy
  enum payment: {
    クレジットカード: 0,
    銀行振込: 1
  }

  enum order_status: {pending: 0, confirm: 1, processing: 2, preparing: 3, shipped: 4}
end
