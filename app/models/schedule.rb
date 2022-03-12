class Schedule < ApplicationRecord
    belongs_to :lesson
    belongs_to :timeline
    has_one :booke
end
