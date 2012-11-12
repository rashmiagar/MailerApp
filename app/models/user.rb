class User < ActiveRecord::Base

   validates_presence_of :user_name, :password
   validates_length_of :user_name, :minimum => 5 
   validates_uniqueness_of :user_name
   validates_confirmation_of :password
   #validates_format_of :birthdate, :with => 
   validates_format_of :email, :with => /^(\S+)@(\S+)\.(\S+)$/

   def password_correct?(password_confirm)
    unless password_confirm.empty?
      password == encrypt_password(password_confirm)
    end
   end


   def hasBday_today?
      return (birthdate.month.eql?(Date.today.month) && birthdate.day.eql?(Date.today.day))
   end
end
