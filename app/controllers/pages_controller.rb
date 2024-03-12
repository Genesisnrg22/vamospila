class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:home]
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
