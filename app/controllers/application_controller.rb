class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:card_id] = cart.id
      cart
    end

  def increment_counter
    session[:hit_counter] ||= 0
    session[:hit_counter] += 1
  end

  def reset_counter
    session[:hit_counter] = 0
  end


end
