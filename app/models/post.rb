class Post < ApplicationRecord
    validates :title, presence: true, exclusion: { in: %w(True Facts)}
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait

    def title_is_clickbait
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Must be clickbait-y")
        end
    end
end
