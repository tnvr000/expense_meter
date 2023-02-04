# frozen_string_literal: true

# users controller
class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]
  before_action :authenticate_user!, only: %i[index edit update]

  # GET /users/:id
  # before_action - authenticate_user!
  def index
    @profile = current_user.profile
  end

  # GET /sign_in
  # before_action - redirect_if_authenticated
  def new
    @user = User.new
  end

  # POST /sign_in
  # before_action - redirect_if_authenticated
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to(root_path, notice: 'user account created successfully')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # GET /users/:id/edit
  # before_action - authenticate_user!
  def edit
    @profile = current_user.profile
  end

  # PUT /users/:id
  # PATCH /users/:id
  # before_action - authenticate_user!
  def update
    @profile = current_user.profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to(users_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def profile_params
    params[:profile][:gender] = params.dig(:profile, :gender)&.to_i
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth, :gender)
  end
end
