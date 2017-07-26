class User < ApplicationRecord
 acts_as_voter
 acts_as_followable
 acts_as_follower
 
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments


has_many :favorites
has_many :favorite_posts, through: :favorites, source: :favorited, source_type: 'Post'


   mount_uploader :avatar, AvatarUploader

   acts_as_messageable

  def mailboxer_name
   self.name
  end

  def mailboxer_email(object)
   self.email
  end
end