require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase

  setup do
    sign_in_as(FactoryBot.create(:user))
    event = FactoryBot.create(:event)
  end

  teardown do
    sleep 3
  end

  test "ログイン失敗パターン" do
    visit event_path(event)
  
    assert_selector "h4", text: "awsome-manager"
  end

  test "ログイン 成功パターン" do
    assert_selector "h1", text:"EVENT-MANAGER"
  end

  test "イベント作成" do    
    visit new_event_path
    assert_selector "h2", text:"イベント作成ページ"

    fill_in "名前", with: "name-event-hoge"
    fill_in "場所", with:"place-event-hoge"
    fill_in "開始時刻",with:Date.today
    fill_in "終了時刻", with:Date.today + 1.days
    fill_in "内容", with:"content-event-hoge"
    click_on "登録する"

    assert_selector "div.alert", text:"[成功]イベントを作成しました"
  end

  # test "イベント削除 成功" do
  #   visit event_path(FactoryBot.create(:event))
  #   assert_difference("Event.count", -1) do
  #     accept_confirm do
  #       click_on "削除する"
  #       assert_selector "div.alert", text:"削除してもよろしいですか？"
  #     end
  #   end
  #end
end
