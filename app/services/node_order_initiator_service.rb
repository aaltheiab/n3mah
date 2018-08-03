class NodeOrderInitiatorService

  prepend SimpleCommand

  def initialize(node_id:)
    @node = Node.find(node_id)
  end


  def call
    # sub of the orders quantities
    sum_quantities = @node.orders.sum(:quantity)
    # ignore if node has more than minimum of 50 + on going orders
    return unless @node.current_quantity + sum_quantities < 50

    quantity_needed = @node.capacity - @node.current_quantity

    order = @node.orders.new(quantity: quantity_needed)

    unless order.save
      #   report a Bug not being able to save order
      logger.info "================ fail to save order =================="
    end
  end

end