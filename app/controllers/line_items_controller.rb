class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart, only: [:create, :index]

  def index
    cart = @cart
    @line_items = LineItem.all
    if current_user.id
      @line_items = LineItem.where(cart: cart.id)
    #else
      #@line_items = LineItem.where(cart: @cart)
    end
  end

  def new
    @service = Service.find(params[:service_id])
    @line_item = LineItem.new
  end

  def create
    @service = Service.find(params[:service_id])
    @qtty = line_item_params[:qtty].to_i
    @line_item = LineItem.new(service: @service, qtty: @qtty)
    @line_item.price = @service.price * @qtty
    @line_item.cart = @cart
    if @line_item.save
      redirect_to @line_items, notice: 'Se ha añadido con éxito tu producto.'
    else
      render :new, status: :unprocessable_entity
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

  def line_item_params
    params.require(:line_item).permit(:qtty)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
