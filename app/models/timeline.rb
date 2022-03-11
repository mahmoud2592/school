class Timeline < ApplicationRecord
    belongs_to :teacher
    has_many :schedules, dependent: :destroy
  end