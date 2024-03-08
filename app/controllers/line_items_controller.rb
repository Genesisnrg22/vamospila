class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: :create

  def index
    @line_items = LineItem.all
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @cart = set_cart
    @line_item.cart = @cart
    if @cart.save
      redirect_to @cart, notice: 'Se ha añadido con éxito tu producto.'
    else
      render :new
    end
  end

  def show
    @line_item = set_line_item
    @photo = @line_item.photo
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    redirect_to @line_item, status: :see_other
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
