

  class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates_inclusion_of :category, :in => %w( Fiction Non-Fiction )
    validate :clickbait
  end

  CLICKBAIT_PATS = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]
  def clickbait
    if CLICKBAIT_PATS.none? { |pattern| pattern.match title }
      errors.add(:title, "must be clickbait")
    end
  end
# end
# end




  # class TitleValidator < ActiveModel::EachValidator
  #   def validate_each(record, attribute, value)
  #     unless value.none? %w(Wont Believe Secret Top [number] Guess)
  #       record.errors[:title] << FALSE
  #     end
  #   end
  # end

#   validates :click_bait, acceptance: true, message: "Humans only!"
#   # validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
#
#   def validate(record)
#       unless record.title.includes? "Won't Believe", "Secret", "Top [number]", "Guess"
#         record.errors[:title] << False
#       end
#     end
#   end
# end
