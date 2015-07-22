class Scholarship < ActiveRecord::Base
  validates_presence_of :amount_requested
  validates_presence_of :amount_fulfilled
  validates_presence_of :description
  validates_presence_of :study_type

  has_many :donations
  belongs_to :user

end
