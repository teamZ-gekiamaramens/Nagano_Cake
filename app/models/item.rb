class Item < ApplicationRecord
    
    #従属しているモデル====================
    belongs_to :cart_item
    belongs_to :genre
    #======================================
    
    #バリデーションの追加==================
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :is_active, presence: true
    #======================================
    
end
