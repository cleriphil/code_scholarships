class DonationsController < ApplicationController

  def new
    @donation = Donation.new
    @scholarship = Scholarship.find(params[:scholarship_id])
  end

  def create
    @user = current_user
    @scholarship = Scholarship.find(params[:scholarship_id])
    @donation = @scholarship.donations.new(donation_params)
    if @scholarship.amount_requested < @donation.amount + @scholarship.amount_fulfilled
      flash[:alert] = "The amount you donated was over the amount requested."
      render :new
    else
      @donation.user_id = current_user.id
      @user.donations.push(@donation)

      if @donation.save
        @scholarship.amount_fulfilled += @donation.amount
        @scholarship.save
        if @scholarship.amount_requested == @scholarship.amount_fulfilled
          RepaymentMailer.repayment_notification(User.find(@scholarship.user_id)).deliver
        end
        redirect_to new_donation_charge_path(@donation)
      else
        flash[:alert] = "There was a problem with your submission. Please try again."
        render :new
      end
    end
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
