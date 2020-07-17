class Post < ActiveRecord::Base



    CATEGORIES = %w( 'Bowling Ball', Fiction ).freeze # if it were multiple categories you could do %w( Mrs M Other) same as CATEGORIES = ['Mrs', 'M', 'Other']
    validates :category, presence: true, inclusion: { in: CATEGORIES }
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 10 }
    CLICKBAIT_PATTERNS = [
   /Won't Believe/i,
   /Secret/i,
   /Top [0-9]*/i,
   /Guess/i]
    validate :clickbait?

 private

 def clickbait?
  if CLICKBAIT_PATTERNS.none? { |pattern| pattern.match title }
    errors.add(:title, "its gotta be clickbait")
  end
 end


end
