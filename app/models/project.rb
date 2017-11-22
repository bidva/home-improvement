class Project < ApplicationRecord
	belongs_to :user
	PROJECT_TYPES = ["Private ", "Public"]
end
