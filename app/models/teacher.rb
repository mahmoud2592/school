class Teacher < ApplicationRecord
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
    
    has_many :timelines, dependent: :destroy
    has_secure_password
end
