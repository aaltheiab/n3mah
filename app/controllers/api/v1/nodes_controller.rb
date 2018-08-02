module Api::V1
  class NodesController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :update

    before_action :set_node, only: [:update]

    def update
      if @node.update(node_params)
        render json: {}, status: :ok
      else
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