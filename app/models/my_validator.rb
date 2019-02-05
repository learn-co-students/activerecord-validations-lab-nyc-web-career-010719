class MyValidator < ActiveModel::Validator



def validate(post)
  unless post.title =~ /(Won\'t Believe) | (Secret) | (Top) | (Guess)/
    post.errors[:title] << "Umm"
  end
end
end
