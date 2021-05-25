class CartItem < ApplicationRecord
    #従属されているアイテム=========
   belongs_to :item
   belongs_to :customer
   #===============================
   
   validates :amount, presence: true
   
   
end
