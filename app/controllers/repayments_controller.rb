class RepaymentsController < ApplicationController
  def index
    @scholarship = Scholarship.find(params[:scholarship_id])
    @repayments = @scholarship.repayments
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
    if @repayment.amount > (@scholarship.amount_owed - @scholarship.amount_repaid)
      flash[:alert] = "Payment amount is higher that the amount owed! Dont pay more than you owe!"
      redirect_to new_scholarship_repayment_path(@scholarship)
    else
      @repayment.user_id = current_user.id
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
  end

private

  def repayment_params
    params.require(:repayment).permit(:amount)
  end
end
