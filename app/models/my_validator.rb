class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.title =~ /Won\'t Believe|Secret|Top \/d*|Guess/
      post.errors[:title] << 'must be clickbait'
    end
  end
end
