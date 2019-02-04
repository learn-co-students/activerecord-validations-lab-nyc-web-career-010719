require 'pry'
class MyValidator < ActiveModel::Validator

  def validate(post)
    if post.title != nil
      # binding.pry
      if post.title.include?("Won't Believe" || "Secret" || "Top #{Fixnum}" || "Guess")
        true
      else
        false
      end
    else
      false
    end
  end


end
