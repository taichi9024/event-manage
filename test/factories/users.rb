FactoryBot.define do
  factory :user do
    provider {"github"}
    sequence(:uid) {|i| "uid#{i}"}
    sequence(:name) {|i| "nam#{i}"}
    sequence(:image_url) {|i| "http://github.com/image#{i}.jpg"}
  end
end
