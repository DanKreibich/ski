class OrdersController < ApplicationController

  def create

    instructor = User.find(params[:instructor_id])

    order = Order.create!(instructor: instructor, amount: instructor.hourly_rate, state: 'pending', student: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "#{instructor.first_name},#{Date.today}",
        amount: instructor.hourly_rate_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
    end
end

# teddy = Teddy.find(params[:teddy_id])
# order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)
