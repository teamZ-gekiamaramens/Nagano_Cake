class Item < ApplicationRecord

    #従属しているモデル====================
    has_many :cart_items , dependent: :destroy
    belongs_to :genre, optional: true
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
    validates :is_active, inclusion:{in: [true, false]}
    # boolean型は「presence: true」と定義すると、false =「nil」と認識されるので
    #「inclusion:{in:[true,false]}で「true」と「false」の両方を認識させる 
    #======================================

end
