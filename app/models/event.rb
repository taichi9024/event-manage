class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :place, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true

  validate :end_over_start

  def end_over_start
    unless end_time > start_time
      errors.add(:start_time, "は終了時刻より前に設定してください！")
    end
  end 
end
