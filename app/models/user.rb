class User < ApplicationRecord
  # validations
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  # Associations
  has_many :events, foreign_key: "creator_id"
  has_many :invitations, foreign_key: "attendee_id"
  has_many :attended_events, through: :invitations,source: :attended_event

  def feed
    Event.where("creator_id = :user_id", user_id: id)
  end

  def upcoming_events
    attended_events.where('date > ? ', Time.now )
  end

  def previous_events
    attended_events.where('date < ? ', Time.now )
  end
end
