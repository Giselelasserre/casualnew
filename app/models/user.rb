class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :purchases
  has_many :purchased_item, through: :purchases, class_name: "Item", source: "item"
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :received_reviews, through: :items, source: :reviews
  after_create :send_welcome_email

  has_attachment :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

    def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def average_rating
    if received_reviews.count > 0
      received_reviews.sum(:star) / received_reviews.count
    else
      0
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def send_contactus_email
    UserMailer.contactus(self).deliver_now
  end

end
