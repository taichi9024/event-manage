class Base < ApplicationController
    helper_method :entered? 
    helper_method :current_user

    before_action :login_first

    def entered?
        !!session[:user_id]
    end

    def login_first
        if entered? == false
            redirect_to root_path , alert:"[失敗]ログインしてください"
        end
    end

    def current_user
        return unless session[:user_id]
        @current_user = User.find_by(id: session[:user_id])
    end

end