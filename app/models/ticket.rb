class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :comment, presence: true, length:{maximum:30}, allow_blank: true
end
