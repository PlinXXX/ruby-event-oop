class User

	attr_accessor :name, :email
	@@all_user = []

	def initialize(email_to_save)
		@email = email_to_save
		@@all_user << self
	end

	def self.all
		return @@all_user
	end

end

julie = User.new("julie@julie.com")
puts julie