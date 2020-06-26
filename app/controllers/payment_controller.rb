class PaymentController < ApplicationController  

  require 'paypal-sdk-rest'
  include PayPal::SDK::REST
  protect_from_forgery :except => [:create, :execute]

  PayPal::SDK::REST.set_config(
    :mode => "sandbox",
    :client_id => "AW4I8tHeTC_xdRHrcvpgD2RgBHC-QlhnNO3uP_ZyUjpCanJbxbMvM3qI9nbnSv2ZtrMf_jNOZMuJV055",
    :client_secret => "EG_reR8BdsdgdW59kWzqRL79fVCbBmqX3-S3UaUwf1WF29oNnzITagp-YTXqrHyfWYCklAedLi2LeqWm")


  def create

    domain = params[:domain]

      @payment = Payment.new({
        :intent =>  "sale",
        :payer =>  {
          :payment_method =>  "paypal" },
        :redirect_urls => {
          :return_url => "http://localhost:3000/payment/execute",
          :cancel_url => "http://localhost:3000/" },
        :transactions =>  [{
          :item_list => {
            :items => [{
              :name => "domain",
              :sku => "philippines",
              :price => "35",
              :currency => "USD",
              :quantity => 1 }]},
          :amount =>  {
            :total =>  "35",
            :currency =>  "USD" },
          :description =>  "This is the payment transaction description." }]})
# if @payment.create
#   @payment.id     # Payment Id
# else
#   @payment.error  # Error Hash
# end

    @payment.create

    render json: {id: @payment.id} # Fill in the the Payment ID
  end

  def execute
    payment_id = params[:payment_id]
    payer_id   = params[:payer_id]
    
    payment = Payment.find(payment_id)

    if payment.execute( :payer_id => payer_id )
      # Success Message
      # Note that you'll need to `Payment.find` the payment again to access user info like shipping address
    else
      payment.error # Error Hash
    end

 

    transaction = Transaction.create(payment_id)
    render json: {payment_state: ''} # Fill in the the payment state
  end

end