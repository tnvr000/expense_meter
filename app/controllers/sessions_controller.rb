# frozen_string_literal: true

# sessions controller
class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]
  before_action :fetch_user, only: %i[create]
  before_action :authenticate_user!, only: %i[destroy]

  # GET /sign_in
  # before_actions - redirect_if_authenticated
  def new; end

  # POST /sign_in
  # before_actions - redirect_if_authenticated, fetch_user
  def create
    render_sign_in_error and return if @user.blank?

    if @user.authenticate(params[:user][:password])
      after_sign_in_path = session[:user_return_to] || root_path
      active_session = sign_in(@user)
      remember(active_session) if params[:user][:remember_me] == 'true'
      redirect_to(after_sign_in_path, notice: 'Signed in')
    else
      render_sign_in_error
    end
  end

  # DELETE /sign_out
  # before_actions - authenticate_user!
  def destroy
    forget_active_session
    sign_out
    redirect_to(root_path, notice: 'Signed out')
  end

  private

  def fetch_user
    @user = User.find_by(email: params[:user][:email].downcase)
  end

  def render_sign_in_error
    flash.now[:alert] = 'Incorrect email or password'
    render(:new, status: :unprocessable_entity)
  end
end
