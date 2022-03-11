class Booke < ApplicationRecord
    belongs_to :schedule
    belongs_to :student
end
