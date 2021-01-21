class EventsController < ApplicationController
  helper_method :correct_person?
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(e_params)
    redirect_to event_path(@event), notice: '[成功]イベントを作成しました' if @event.save
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    @events = Event.active.order(end_time: :asc)
  end

  def edit
    @event = current_user.events.find_by(id: params[:id])
  end

  def update
    @event = current_user.events.find_by(id: params[:id])
    if @event.update(e_params)
      redirect_to event_path(@event), notice: '[成功]イベント情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find_by(id: params[:id])
    @event.destroy
    redirect_to events_path, alert: '[成功]イベントを削除しました'
  end

  private

  def e_params
    params.require(:event).permit(:name, :place, :start_time, :end_time, :content, :image, :remove_image)
  end

  def correct_person?(current_user)
    @event = Event.find_by(id: params[:id])
    true if current_user == @event.user
  end
end
