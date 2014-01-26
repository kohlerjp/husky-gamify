module UsersHelper

	def gravatar_for(user,height=100)
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle",height:height)
  end
end
