class Post < ApplicationRecord
	 acts_as_votable
	 acts_as_commentable
	 acts_as_taggable
	 has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
 	 belongs_to :user
 	 has_many :comments
 	
 	#tutaj
 	has_many :notifications, dependent: :destroy  
 	 

end
