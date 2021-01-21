class Event < ApplicationRecord

  searchkick language: "japanese"

  belongs_to :user
  has_one_attached :image
  has_many :tickets, dependent: :destroy

  validates :name, presence: true
  validates :place, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true
  validates :image, content_type:[:png,:jpg],
  size: {less_than_or_equal_to: 10.megabyte},
  dimension: {width: {max: 2000}, height:{height:2000}}

  validate :end_over_start

  scope :active, -> {where("end_time > ?", Time.zone.now)}

attr_accessor :remove_image

before_save :remove_image_hoge

  def end_over_start
    unless end_time > start_time
      errors.add(:start_time, "は終了時刻より前に設定してください！")
    end
  end 

  def remove_image_hoge
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)  
  end

  def search_data
    {
      name: name,
      place: place,
      content: content,
      start_time: start_time
    }
  end

end
