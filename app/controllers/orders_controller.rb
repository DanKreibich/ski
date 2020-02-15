class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # changes trip state if payment was successful
    if @order.state == 'paid'
      trip = @order.trip
      trip.status = 1
      trip.save
      sessions = Session.where(trip_id: trip.id)
      sessions.each do |session|
        session.status = 1
        session.save
      end
    end
  end
end
