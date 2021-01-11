class Goal < ApplicationRecord
  validates :set,presence: true, length:{maximum: 255}
end
