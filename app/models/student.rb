class Student < ApplicationRecord
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true

    has_many :bookes, dependent: :destroy
    has_secure_password
end
