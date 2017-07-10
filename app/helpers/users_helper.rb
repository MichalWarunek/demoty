module UsersHelper
	def avatar_for(user, options = {size: 50})
		size = options[:size]
		if user.avatar?
			image_tag user.avatar.url(:thumb),size: size, class: 'avatar-image'
		else
			image_tag "default-avatar.jpg", size: size, class: 'avatar-image'
		end
	end
end