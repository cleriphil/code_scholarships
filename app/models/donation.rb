class Donation < ActiveRecord::Base
  validates_presence_of :amount



  belongs_to :user
  belongs_to :scholarship

end
