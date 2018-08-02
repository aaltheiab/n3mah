class HomeController < ApplicationController

  before_action :set_user, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create

  def create
    if @user && @user.valid_password?(params[:password], @user.password)
      session.clear
      session[:phone_number] = @user.phone_number
      redirect_to root_path
    else
      @error = 'Username or password was incorrect'
      render :login
    end
  end


  def login
  end



  def show
  end



  private


  def set_user
    @user = User.find_by(phone_number: params[:phone_number])
    head :not_found unless @user
  end
end
