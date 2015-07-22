require 'rails_helper'


describe Donation, type: :model do
  # it { belong_to :user }
  it { belong_to :scholarship }
  it { should validate_presence_of :amount }

end
