module CurrentCart
  private

  def set_cart
    @cart ||= Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def delete_cart
    session[:cart_id] = nil
  end
end
