class TicketsController < ApplicationController
  def new
    @ticket = current_user.tickets.build
    redirect_to event_path(params[:event_id]), notice: '[失敗]イベントに参加できませんでした！'
  end

  def create
    @ticket = current_user.tickets.build(event_id: params[:event_id], comment: params[:comment])
    redirect_to event_path(params[:event_id]), notice: '[成功]イベントに参加を表明しました！' if @ticket.save
  end

  def destroy
    ticket = Ticket.where(event_id: params[:event_id], user_id: current_user.id)
    p "dddddddddddddddddddddddddd#{ticket.inspect}"
    ticket.first.destroy
    redirect_to event_path(params[:id]), notice: '[キャンセル]イベントへの参加をキャンセルしました'
  end
end
