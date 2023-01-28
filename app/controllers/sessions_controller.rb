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
    render_login_error and return if @user.blank?

    if @user.authenticate(params[:user][:password])
      login(@user)
      remember(@user) if params[:user][:remember_me] == '1'
      redirect_to(root_path, notice: 'Signed in')
    else
      render_login_error
    end
  end

  # DELETE /sign_out
  # before_actions - authenticate_user!
  def destroy
    forget(current_user)
    logout
    redirect_to(root_path, notice: 'Signed out')
  end

  private

  def fetch_user
    @user = User.find_by(email: params[:user][:email].downcase)
  end

  def render_login_error
    flash.now[:alert] = 'Incorrect email or password'
    render(:new, status: :unprocessable_entity)
  end
end
