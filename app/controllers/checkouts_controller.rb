class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = @current_cart
    @price = Stripe::Price.create(currency: 'USD', unit_amount: @cart.sub_total.to_i * 100, product_data: {
      name: "contants of the cars"
    })
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: @price,
        quantity: 1
      }],
      shipping_address_collection: {
        allowed_countries: ['JP']
      },
      phone_number_collection: {
        enabled: true,
      },
      mode: 'payment',
      success_url: checkout_success_url,
      cancel_url: root_url,
    })
    redirect_to @session.url, allow_other_host: true
  end

  def success
    session[:cart_id] = nil

    
  end
  
  def cancel
    # not empty out cart, but do something
  end

  

 
end
 