class User < ApplicationRecord
    has_many :events, dependent: :nullify
    has_many :tickets, dependent: :nullify

    def self.find_or_create_from_auth_hash!(auth_hash)
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        nickname = auth_hash[:info][:nickname]
        image_url = auth_hash[:info][:image]
        
        User.find_or_create_by!(provider: provider, uid: uid, name: nickname, image_url: image_url)
    end
end
