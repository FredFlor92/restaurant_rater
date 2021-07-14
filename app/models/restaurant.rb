class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: reviews

    belongs_to :users
    belongs_to :companies 

    validates :name, :type, :price_range, :address, presence: true  
    validates :name, :address, uniqueness: true  
    validates :name, length: { minimum: 3}

    accepts_nested_attributes_for :company
end
