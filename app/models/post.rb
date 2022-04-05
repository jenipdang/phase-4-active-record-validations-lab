class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)} 
    validate :be_valid?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def be_valid?
        if CLICKBAIT_PATTERNS.none? { |pattern| pattern.match title }
            errors.add(:title, "Must be clickbaity-y")
        end
    end

end
