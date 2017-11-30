class Project < ApplicationRecord
	belongs_to :user
	has_many :comments
	before_validation :set_user
	PROJECT_TYPES = ["Private ", "Public"]

	private
  def set_user
    self.user ||= Current.user
  end
end
