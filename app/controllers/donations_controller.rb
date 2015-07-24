class DonationsController < ApplicationController

  def new
    @donation = Donation.new
    @scholarship = Scholarship.find(params[:scholarship_id])
  end

  def create
    @user = current_user
    @scholarship = Scholarship.find(params[:scholarship_id])
    @donation = @scholarship.donations.new(donation_params)
    @donation.user_id = current_user.id
    @user.donations.push(@donation)


    if @donation.save
      @scholarship.amount_fulfilled += @donation.amount
      @scholarship.save
      redirect_to new_donation_charge_path(@donation)
    else
      flash[:alert] = "There was a problem with your submission. Please try again."
      render :new
    end
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
