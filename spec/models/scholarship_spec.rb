require 'rails_helper'


describe Scholarship, type: :model do
  # it { should have_many :donations }
  # it { should have_many :users }
  # it { should validate_presence_of :amount_requested }
  it { should validate_presence_of :amount_fulfilled }
  it { should validate_presence_of :description }
  it { should validate_presence_of :type }

end
