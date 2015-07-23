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

    Stripe.api_key = "sk_test_0roGt5wf7EbTkpWbCQ5X6SPx"
    if @repayment.plan == "Platinum"
      Stripe::Plan.create(
      :amount => (@scholarship.amount_requested * 1.1).to_i,
      :name => 'Platinum Plan',
      :interval => "year",
      :currency => 'usd',
      :id => 'platinum'
      )
    elsif @repayment.plan == "Gold"
      Stripe::Plan.create(
      :amount => (@scholarship.amount_requested * 1.15/12.0).to_i,
      :name => 'Gold Plan',
      :interval => "month",
      :currency => 'usd',
      :id => 'gold'
      )
    elsif @repayment.plan == "Bronze"
      Stripe::Plan.create(
      :amount => (@scholarship.amount_requested * 1.2/60.0).to_i,
      :name => 'Bronze Plan',
      :interval => "month",
      :currency => 'usd',
      :id => 'bronze'
      )
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

private

  def repayment_params
    params.require(:repayment).permit(:plan)
  end
end
