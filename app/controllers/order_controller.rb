class OrderController < ApplicationController


  before_action :set_order, only: [:confirm, :details, :confirm_delivery]
  skip_before_action :verify_authenticity_token, only: [:confirm, :details, :confirm_delivery]

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

  # confirm assigning the order to the user
  def confirm
    # quantity picked by user.
    quantity = params['quantity']

    new_order_id = nil

    # when order owner require more quantity than the user ability
    if @order.quantity.to_i > quantity.to_i
      new_order = current_user.orders.new(owner: @order.owner, quantity: quantity, status: 'in_progress')

      new_order_id = new_order.id if new_order.save

      @order.update(quantity: @order.quantity - quantity.to_i, status: 'pending')
    else
      @order.update(status: 'in_progress')
    end

    # return the newly created order id, otherwise return the original order id
    render json: {id: new_order_id || @order.id}, status: :ok
  end


  # page with order details
  def details
  end


  # user confirm the delivery of the boxes
  def confirm_delivery
    if @order.complete!
      render json: {}, status: :ok
    else
      render json: {errors: @order.errors.messages}, status: :bad_request
    end
  end


  # landing page after delivery confirmed
  def thank_you
  end


  private


  def set_order
    @order = Order.find(params[:id])
  end

end