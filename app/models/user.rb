class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # def self.from_omniauth(auth)
  #   # Check out the Auth Hash function at https://github.com/mkdynamic/omniauth-facebook#auth-hash
  #   # and figure out how to get email for this user.
  #   # Note that Facebook sometimes does not return email,
  #   # in that case you can use facebook-id@facebook.com as a workaround
  #   email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
  #   user = where(email: email).first_or_initialize
  #   #
  #   # Set other properties on user here. Just generate a random password. User does not have to use it.
  #   # You may want to call user.save! to figure out why user can't save
  #   #
  #   # Finally, return user
  #   user.save && user
  # end

end
