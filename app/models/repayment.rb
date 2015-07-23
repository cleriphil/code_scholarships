class Repayment < ActiveRecord::Base
  belongs_to :user
  belongs_to :scholarship
end
