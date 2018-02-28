class Event < ApplicationRecord

  scope :past,->{where("date < ?", Time.now)}
  scope :upcoming,->{where("date > ?", Time.now)}
  default_scope -> { order(created_at: :desc) }
  
  validates :title,  presence: true, length: { maximum: 20 }
  validates :location,  presence: true, length: { maximum:10 }
  validates :description,  presence: true, length: { maximum: 200 }
  validates :date,  presence: true

  belongs_to :creator,class_name: "User"
  has_many :invitations,foreign_key: "attended_event_id"
  has_many :attendees,through: :invitations,source: :attendee
    
   
end
