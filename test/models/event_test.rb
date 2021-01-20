require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "date_validateion" do
    start_time = rand(1..30).days.from_now
    end_time = start_time + rand(1..30).hours
    event = FactoryBot.build(:event, start_time: start_time, end_time: end_time)
    event.valid?
    assert_empty(event.errors)
  end

  test "date_validateion fails" do
    start_time = rand(1..30).days.from_now
    end_time = start_time - rand(1..30).hours
    event = FactoryBot.build(:event, start_time: start_time, end_time: end_time)
    event.invalid?
    true
  end
end
