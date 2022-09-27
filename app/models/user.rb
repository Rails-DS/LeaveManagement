class User < ApplicationRecord

	has_secure_password

	has_many :leaveHists, dependent: :delete_all

	#attr_accessor :email, :password, :password_digest


end
