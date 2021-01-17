class DeletesController < ApplicationController

    def new
    end

    def create
        current_user.destroy
        reset_session
        redirect_to root_path, alert:"退会しました"
    end
end
