class OrderController < ApplicationController


  def show
  end

  # fetch the prioritized order to be returned to the user
  # user will pass:
  # - quantity
  # - user_authentication
  def fetch
    @order = Order.where(owner_id:  current_user.branch.nodes.pluck(:id)).order('orders.quantity').last

    render json: {id: @order.id, quantity: @order.quantity,
                  date: @order.created_at.strftime('%d/%m/%Y'),
                  time: @order.created_at.strftime('%p %I:%M'),
                  destination: "#{t('fridge')} - #{@order.owner_id}"
                  }, status: :ok
  end

end