FactoryBot.define do
  factory :event do
    user
    sequence(:name) {|i| "イベント名#{i}"}
    sequence(:place) {|i| "place#{i}"}
    start_time {rand(1..30).days.from_now }
    end_time {start_time + rand(1..50).hours }
    sequence(:content) {|i| "内容#{i}"}
  end
end
