class Item < ApplicationRecord

    #従属しているモデル====================
    has_many :cart_items
    belongs_to :genre, optional: true
    has_many :order_details
    #======================================

    #画像==================================
    attachment :image
    #======================================

    # enumの設定===========================
    enum status: {販売中:0, 販売停止中:1}
    #======================================

    #バリデーションの追加==================
    validates :name, presence: true
    validates :image, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :is_active, presence: true
    #======================================

end
