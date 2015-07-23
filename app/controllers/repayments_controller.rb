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
      redirect_to scholarship_path(@scholarship)
    else
      flash[:alert] = "There was a problem submitting your repayment."
      render :new
    end

    customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @donation.amount * 100,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

private

  def repayment_params
    params.require(:repayment).permit(:plan)
  end
end
