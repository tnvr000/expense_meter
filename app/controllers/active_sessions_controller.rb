# frozen_string_literal: true

# active sessions controller
class ActiveSessionsController < ApplicationController
  before_action :authenticate_user!

  # GET /active_sessions
  # before_action - authenticate_user!
  def index
    @active_sessions = current_user.active_sessions
  end

  # DELETE /active_sessions/:id
  # before_action - authenticate_user!
  def destroy
    @active_session = current_user.active_sessions.find(params[:id])
    @active_session.destroy

    redirect_to(active_sessions_path) and return if current_user

    reset_session
    redirect_to(root_path, notice: 'Signed Out')
  end

  # DELETE /active_sessions/destroy_all
  # before_action - authenticate_user!
  def destroy_all
    current_user.active_sessions.destroy_all
    reset_session

    redirect_to(root_path, notice: 'Signed Out')
  end
end
