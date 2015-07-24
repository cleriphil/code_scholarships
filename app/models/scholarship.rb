class Scholarship < ActiveRecord::Base
  validates_presence_of :amount_requested
  validates_presence_of :amount_fulfilled
  validates_presence_of :description
  validates_presence_of :study_type
  validates_presence_of :plan

  has_many :donations
  has_many :repayments
  belongs_to :user

  def self.search(search)
    if search
      where("study_type ILIKE ? OR description ILIKE ? OR title ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where(nil)
    end
  end

  def formatted_time
    return self.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%B %d")
  end

  def formatted_time_full
     return self.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%A, %B %d at %I:%M %p")
  end

end
