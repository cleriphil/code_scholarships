class RepaymentsController < ApplicationController
  def index
  end

  def new
    @scholarship = Scholarship.find(params[:scholarship_id])
    @repayment = Repayment.new
  end

  def create
    # Amount in cents
    @user = current_user
    @scholarship = Scholarship.find(params[:scholarship_id])
    @repayment = @scholarship.repayments.new(repayment_params)
    @repayment.user_id = current_user.id
    @repayment.total = @scholarship.amount_requested
    @repayment.scholarship_id = @scholarship.id
    @user.repayments.push(@repayment)
    if @repayment.save
      flash[:notice] = "Repayment has been submitted!"
      redirect_to new_repayment_charge_path(@repayment)
    else
      flash[:alert] = "There was a problem submitting your repayment."
      render :new
    end
  end

private

  def repayment_params
    params.require(:repayment).permit(:plan)
  end
end
