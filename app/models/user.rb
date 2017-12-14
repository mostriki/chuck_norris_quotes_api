class User < ActiveRecord::Base
  # Include default devise modules.
  has_many :quotes
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
