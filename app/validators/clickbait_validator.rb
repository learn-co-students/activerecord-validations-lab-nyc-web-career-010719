class ClickbaitValidator < ActiveModel::Validator

  def validate(post)
    unless post.title =~ /(Won\'t Believe)|(Secret)|(Top \d)/
      post.errors[:title] << "The Number One Error You Won't Believe."
    end
  end
end
