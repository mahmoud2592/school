class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tag, dependent: :destroy
  has_many :tag, through: :post_tagss
end
