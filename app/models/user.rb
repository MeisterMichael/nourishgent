class User < SwellMedia::User

	devise 		:database_authenticatable, :omniauthable, :registerable, :recoverable, :rememberable, :trackable, :authentication_keys => [:login]


	### Class Methods   	--------------------------------------
	# over-riding Deivse method to allow login via name or email
	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			where(conditions.to_h).first
		end
	end


	def self.me
		self.first
	end

	def avatar_url( args = {} )
		aurl = self.properties["avatar_#{args.delete(:size)}"] if args[:size]
		aurl ||= super( args )

		aurl
	end

	def social_id( source )
		self.properties["#{source}_id"]
	end

end