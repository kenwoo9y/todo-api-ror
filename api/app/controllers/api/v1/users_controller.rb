class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: { status: '200', message: 'Loaded users', data: users }
  end

  def show
    render json: { status: '200', message: 'Loaded the user', data: @user }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: '200', data: user }
    else
      render json: { status: '500', data: user.errors }
    end
  end

  def update
    if @user.update(user_params)
      render json: { status: '200', message: 'Updated the user', data: @user }
    else
      render json: { status: '500', message: 'Not updated', data: @user.errors }
    end
  end

  def destroy
    if @user.destroy
      render json: { status: '200', message: 'Deleted the user', data: @user}
    else
      render json: { status: '500', message: 'Not deleted', data: @user.errors }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_name, :email, :last_name, :first_name, :password)
    end
end
