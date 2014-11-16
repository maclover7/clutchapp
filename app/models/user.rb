class User < ActiveRecord::Base

  has_many :assignments
  has_many :submissions

  # Omniauth stuff
  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    user = User.where(email: auth.info.email).first
    unless user
      user = User.create(
        provider: auth.provider,
        uid:      auth.uid,
        name:     auth.info.name,
        email:    auth.info.email)
      end
    user
  end
end
