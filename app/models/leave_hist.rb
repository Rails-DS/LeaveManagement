class LeaveHist < ApplicationRecord
	belongs_to :user
	enum hrStatus: { pending: 0, approved: 1, rejected: 2 }, _prefix: :hr_status
	enum tlStatus: { pending: 0, approved: 1, rejected: 2 }, _prefix: :tl_status
end
