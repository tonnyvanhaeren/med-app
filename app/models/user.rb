class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :first_name,  :presence => true,
            :length => { :maximum => 50 }

  validates :last_name,   :presence => true,
            :length => { :maximum => 150 }

  validates :password, :presence => true, :length => { minimum: 8 }, on: :create

  def fullname
    "#{self.first_name} #{self.last_name}" 
  end
end
