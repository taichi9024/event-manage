class ApplicationController < ActionController::Base
  helper_method :entered?
  helper_method :current_user

  before_action :login_first

  def entered?
    !!session[:user_id]
  end

  def login_first
    redirect_to root_path, alert: '[失敗]ログインしてください' if entered? == false
  end

  def current_user
    return unless session[:user_id]

    @current_user = User.find_by(id: session[:user_id])
  end

  rescue_from Exception, with: :e500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :e404

  def e500(e)
    logger.error [e, e.backtrace].join("\n")
    render 'e500', status: 500
  end

  def e404(e)
    logger.error [e, e.backtrace].join("\n")
    render 'e404', status: 404
  end
end
