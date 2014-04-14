class Retailer < ActiveRecord::Base
	before_save { self.contact = contact.downcase }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 100 }
	VALID_CONTACT_REGEX = /(^(\+91?|)\d{0,11}$)/
	validates :contact, presence: true, format: { with: VALID_CONTACT_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8 }

	def Retailer.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Retailer.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = Retailer.hash(Retailer.new_remember_token)
		end
end
