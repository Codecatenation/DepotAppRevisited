class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@counter = session[:counter]
  	@counter.nil? ? @counter = 1 : @counter += 1
  	#session[:counter] = @counter
  	#session[:counter] = nil
  end


end
