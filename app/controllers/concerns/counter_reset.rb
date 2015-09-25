module CounterReset
  extend ActiveSupport::Concern

  private

  def reset_sessions_counter
  	if not session[:counter].nil?
  		session[:counter] = 0
    end
  end
end