class Charges::PaymentsController < ApplicationController
  def create
    @money_request = Charges::MoneyRequest.find(params[:money_request_id])

    #customer = Stripe::Customer.create(
      #email: params[:stripeEmail],
      #source: params[:stripeToken]
    #)

    charge = Stripe::Charge.create(
      #customer: customer.id,
      amount: @money_request.amount_cents,
      description: @money_request.description,
      currency: 'usd',
      metadata: { token: @money_request.token },
      source: params[:stripeToken],
      receipt_email: params[:stripeEmail]
    )

    @money_request.update(stripe_charge_id: charge.id, paid: true)
    redirect_to charges_money_request_path(@money_request)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_money_request_path(@money_request)
  end
end
