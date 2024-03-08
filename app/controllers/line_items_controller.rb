class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: create

  def index
  end

  def new
  end

  def create
    @cart
  end

  def show
  end

  def destroy
  end
end
