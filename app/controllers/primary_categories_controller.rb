# frozen_string_literal: true

# primary categories controller
class PrimaryCategoriesController < ApplicationController
  before_action :authenticate_user!

  # before_action - authenticate_user!
  def index
    @primary_categories = PrimaryCategory.with_category_count
  end

  # before_action - authenticate_user!
  def show
    @primary_category = PrimaryCategory.includes(:categories).find_by(id: params[:id])
  end
end
