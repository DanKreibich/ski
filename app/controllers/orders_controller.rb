class OrdersController < ApplicationController

  def create

    instructor = User.find(params[:instructor_id])
    order = Order.create!(
      instructor: instructor,
      amount: params[:amount].to_i,
      state: 'pending',
      student: current_user,
      trip_id: params[:trip_id]
    )
    # test

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Your ski lessons with #{instructor.first_name}",
        amount: params[:amount].to_i * 100,
        images: [instructor.avatar],
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    # if success, then order.status = 'success'
    order.update(checkout_session_id: session.id)

    # updating the Trip status
    trip = Trip.find(params[:trip_id])
    trip.status = 1
    trip.save
    sessions = Session.where(trip_id: trip.id)
    sessions.each do |session|
      session.status = 1
      session.save
    end
    redirect_to new_order_payment_path(order)
  end

  def show
    # @order = current_user.orders.find(params[:id])
    @order = Order.find(params[:id])
  end

end
