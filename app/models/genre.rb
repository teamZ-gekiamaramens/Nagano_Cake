class Genre < ApplicationRecord
    #従属============================
    has_many :items
    #================================
    enum valid_invalid_status: { 有効: 0, 無効: 1}
    #バリデーション追加==============
    validates :name, presence: true
    #================================
    
end
