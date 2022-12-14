class Public::HomesController < ApplicationController

  def new_guest
   user = User.find_or_create_by(email: 'guest@example.com',name: 'guest') do |user|
     user.password = SecureRandom.urlsafe_base64
   end
   sign_in user
   redirect_to works_path
  end

end
