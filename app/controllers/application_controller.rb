class ApplicationController < ActionController::Base
    helper_method :entered?

    def entered?
        !!session[:user_id]
    end
end
