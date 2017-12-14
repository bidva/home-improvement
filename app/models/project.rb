class Project < ApplicationRecord
	belongs_to :user
	has_many :comments, :dependent => :destroy
	before_validation :set_user
  validates :name, presence: true
  validates :desc, presence: true
  validates :status, presence: true
  scope :privates, -> { where(public: false)}
  scope :publics, -> { where(public: true)}

	STATUS_TYPES = ["created", "started", "stopped", "completed"]
  def owned?(current_user)
    self.user.id == current_user.id
  end
	private
  def set_user
    self.user ||= Current.user
  end
end
