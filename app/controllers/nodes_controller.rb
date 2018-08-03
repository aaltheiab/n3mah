class NodesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :fetch_nodes

  def index
    @nodes = Node.all
  end

  def fetch
    node = Node.order(:updated_at).last
    render json: {id: node.id, current_quantity: node.current_quantity, branch_name: node.branch.name}, status: :ok
  end

end