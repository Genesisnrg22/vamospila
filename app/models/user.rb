class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :orders
  has_many :services # vendedor
  has_many :line_items, through: :orders
  has_many :services, through: :line_items # comprador
end
