class EventsController < ApplicationController
    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(e_params)
        if @event.save
            redirect_to event_path(@event), notice:"[成功]イベントを作成しました"
        end
    end

    def show
        @event = current_user.events.find_by(id: params[:id])
    end

    private
    def e_params
        params.require(:event).permit(:name, :place, :start_date, :end_date, :content)
    end
end
