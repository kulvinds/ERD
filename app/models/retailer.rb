class Retailer < ActiveRecord::Base
	before_save { self.contact = contact.downcase }
	validates :name, presence: true, length: { maximum: 100 }
	VALID_CONTACT_REGEX = /(^(\+91?|)\d{0,11}$)/
	validates :contact, presence: true, format: { with: VALID_CONTACT_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8 }
end
