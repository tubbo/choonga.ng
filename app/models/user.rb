class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
         :trackable, :validatable, :token_authenticatable, :recoverable,
         :lockable, :timeoutable

  validates :name, presence: true
  validates :email, presence: true
end
