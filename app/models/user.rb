class User < ApplicationRecord

	has_secure_password

	has_many :leaveHists, dependent: :delete_all
	belongs_to :team
 	belongs_to :role


 
end