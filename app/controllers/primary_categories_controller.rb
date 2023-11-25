# frozen_string_literal: true

# primary categories controller
class PrimaryCategoriesController < ApplicationController
  before_action :authenticate_user!

  # before_action - authenticate_user!
  def index
    @primary_categories = PrimaryCategory.all
  end
end
