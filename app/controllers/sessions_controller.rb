# frozen_string_literal: true

# sessions controller
class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def new; end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    render_login_error and return if @user.blank?

    if @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to(root_path, notice: 'Signed in')
    else
      render_login_error
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Signed out')
  end

  private

  def render_login_error
    flash.now[:alert] = 'Incorrect email or password'
    render(:new, status: :unprocessable_entity)
  end
end
