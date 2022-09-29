class Team < ApplicationRecord

	has_many :users, dependent: :delete_all
	has_many :roles, dependent: :delete_all
end
