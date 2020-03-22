class Post < ApplicationRecord
    validates :content, presence: true
    validates :image, presence: true
    validates :user_id, presence: true
    mount_uploader:image, ImageUploader
    belongs_to :user
end
