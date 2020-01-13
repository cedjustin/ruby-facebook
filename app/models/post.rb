class Post < ApplicationRecord
    validates :content, presence: true
    validates :image, presence: true
    validates :user_id, presence: true
    has_attached_file :image, styles: { large: "600x300>", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :user
end
