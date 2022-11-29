class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :click_bait


    private 

    def click_bait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
            errors.add(:title, "This is no click bait!")
        end
    end

end
