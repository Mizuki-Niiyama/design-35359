class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: /\A[a-zA-Z]+\z/, message: 'is invalid. Input half-width characters' } do
      validates :nickname
      validates :first_name
      validates :last_name
    end
  end

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }

  has_many :designs
  has_many :rooms
  has_many :messages
end
