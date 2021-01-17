class EventsController < ApplicationController
    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(e_params)
        if @event.save
            redirect_to event_path(@event), notice:"[成功]イベントを作成しました"
        else
            render :new
        end
    end

    def show
        @event = Event.find_by(id: params[:id])
    end

    private
    def e_params
        params.require(:event).permit(:name, :place, :start_time, :end_time, :content)
    end
end
