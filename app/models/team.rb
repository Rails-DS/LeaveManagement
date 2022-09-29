class Team < ApplicationRecord

	has_many :users
	has_many :roles, :dependent => :delete_all
end
