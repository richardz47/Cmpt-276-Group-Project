class User < ApplicationRecord
	validates :username, :email, :password, #all must be present and < 30 chars
			length: {maximum: 30}, 
			presence: true, on: :create

	validates  :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,
			message: "email must be of form: example@email.com"},
			uniqueness: true 

	validates :username, format: {with: /\A[a-z0-9\-_]+\Z/,
			message: "may contain letters, numbers, and underscores only"},
			length: {minimum: 3}

	has_secure_password
	validates :password, length: {minimum: 5},
			format: {with: /\A[a-z0-9]+\z/i,
			message: "may contain letters and numbers only, case sensitive"},
			confirmation: true, on: :create
 

end
