module Api::V1
  class NodesController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :update

    before_action :set_node, only: [:update]


    # The nodes update their current quantity by hitting this end-point
    def update
      if @node.update(node_params)
        # initiate service object to process node minimum quantity requirements
        NodeOrderInitiatorService.call(node_id: @node.id)
        render json: {}, status: :ok
      else
        # bug report about the node not able to update itself
        render json: {errors: @node.errors.messages}, status: 400
      end
    end


    private

    def set_node
      @node = Node.find(params[:id])
    end

    def node_params
      params.require(:node).permit(:current_quantity)
    end
  end
end