class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :first_name,  :presence => true,
            :length => { :maximum => 50 }

  validates :last_name,   :presence => true,
            :length => { :maximum => 150 }

  validates :password, :presence => { on: create }, :length => { minimum: 8 }
end
