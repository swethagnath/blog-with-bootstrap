class Permission < ApplicationRecord
	belongs_to :role
	belongs_to :user
	validates_presence_of :user_id,:role_id
end
