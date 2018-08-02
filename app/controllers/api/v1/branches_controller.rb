module Api::V1
  class BranchesController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:update]

    before_action :set_branch, only: [:update]


    # The Branch update their current quantity by hitting this end-point
    def update
      if @branch.update(branch_params)
        # TODO initiate service object to process branch minimum quantity requirements
        render json: {}, status: :ok
      else
        # bug report about the branch not able to update itself
        render json: {errors: @branch.errors.messages}, status: 400
      end
    end


    private

    def set_branch
      @branch = Branch.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit(:current_quantity)
    end
  end
end