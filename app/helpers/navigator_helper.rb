module NavigatorHelper


  def user_email(review)
    email = User.find_by_id(review.user_id).try(:email) || "Anonymous"
  end

end
