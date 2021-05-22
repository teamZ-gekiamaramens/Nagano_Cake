class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders
    has_many :deliveries
    def active_for_authentication?
        super && (self.withdrawal == false)
    end
    #is_activeが有効の場合は有効会員(ログイン可能)
end