class User < ActiveRecord::Base
  # Include default devise modules.
  has_secure_password
  devise :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_one :employee
  has_one :third_party_employee
end
