class Scholarship < ActiveRecord::Base
  validates_presence_of :amount_requested
  validates_presence_of :amount_fulfilled
  validates_presence_of :description
  validates_presence_of :study_type

  has_many :donations
  belongs_to :user

  def self.search(search)
    where("description LIKE ?", "%#{search}%")
    where("title LIKE ?", "%#{search}%")
    where("study_type LIKE ?", "%#{search}%")
  end

  def formatted_time
    return self.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%B %d")
  end

  def formatted_time_full
     return self.created_at.in_time_zone("Pacific Time (US & Canada)").strftime("%A, %B %d at %I:%M %p")
  end


end
