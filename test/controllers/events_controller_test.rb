require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "自分のイベントを削除 成功" do
    owner = FactoryBot.create(:user)
    event = FactoryBot.create(:event, user: owner)
    sign_in_as(owner)
    assert_difference("Event.count", -1) do
      delete event_path(event)
    end
  end

end
