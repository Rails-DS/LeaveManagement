class Role < ApplicationRecord

	belongs_to :team
	has_many :users,  dependent: :delete_all

end
