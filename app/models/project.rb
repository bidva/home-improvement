class Project < ApplicationRecord
	belongs_to :user
	has_many :comments, :dependent => :destroy
	before_validation :set_user
  validates :name, presence: true
  validates :desc, presence: true
  validates :project_type, presence: true
  validates :status, presence: true

  PROJECT_TYPES = ["Private", "Public"]
	STATUS_TYPES = ["created", "started", "stopped", "completed"]

	private
  def set_user
    self.user ||= Current.user
  end
end
