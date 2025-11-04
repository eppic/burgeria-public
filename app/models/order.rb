class Order < ApplicationRecord
    validates :name, :email, :address, :city, :zip_code, presence: true
end
