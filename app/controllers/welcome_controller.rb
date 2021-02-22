class WelcomeController < ApplicationController
  skip_before_action :login_first
  def index
    @events = Event.page(params[:paga]).per(5).where('end_time > ?', Time.zone.now)
  end
end
