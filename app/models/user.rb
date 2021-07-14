class User < ApplicationRecord
    has_secure_password
    
    has_many :restaurants
    has_many :reviews through: restaurants

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
end