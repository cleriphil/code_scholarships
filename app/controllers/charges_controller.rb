class ChargesController < ApplicationController

  def index
    @donation = Donation.find(params[:donation_id])

  end

  def new
    if current_user.donor
    @donation = Donation.find(params[:donation_id])
    else
    @repayment = Repayment.find(params[:repayment_id])
  end

  def create
    # Amount in cents
    if current_user.donor

      @donation = Donation.find(params[:donation_id])


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
    else

      @repayment = Repayment.find(params[:repayment_id])


      customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @repayment.total * 100,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )

    end
  end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
