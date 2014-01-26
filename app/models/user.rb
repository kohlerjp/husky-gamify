class User < ActiveRecord::Base
	default_scope -> { order('points DESC') }
	has_many :attendings
	has_many :events, through: :attendings
	has_many :microposts

	before_save { self.name = name.downcase }
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	has_one :profile, class_name: 'UserProfile'

	validates :name, presence: true,length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
				uniqueness: { case_sensitive: false }

	# implements secure password for user
	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
	      self.remember_token = User.encrypt(User.new_remember_token)
	    end


end
