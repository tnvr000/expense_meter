# frozen_string_literal: true

# users controller
class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to(root_path, notice: 'user account created succesfully')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
