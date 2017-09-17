class User < ActiveRecord::Base
  # Include default devise modules.
  has_secure_password
  devise :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #:confirmable, :omniauthable
  # include DeviseTokenAuth::Concerns::User
  has_many :matches
  has_many :reportees, through: :matches, dependent: :destroy
end
