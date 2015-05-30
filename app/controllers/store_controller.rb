class StoreController < ApplicationController
  
  def index
  	@products = Product.all.order(:title)
    @count = session_count
  end

  def session_count
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end
  end
end
