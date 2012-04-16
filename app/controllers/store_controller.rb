class StoreController < ApplicationController
  def index
    @products = Product.all
    @count = increment_counter
    if @count <= 5
      @count = nil
    end
  end
end
