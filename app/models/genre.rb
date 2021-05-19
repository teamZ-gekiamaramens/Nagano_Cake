class Genre < ApplicationRecord
    #従属============================
    has_many :item
    #================================
    
    #バリデーション追加==============
    validates :name, presence: true
    #================================
    
end
