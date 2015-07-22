class ChargesController < ApplicationController
  def new
    @donation = Donation.find(params[:donation_id])

  end

  def create
    # Amount in cents

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
