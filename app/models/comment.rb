class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  before_validation :set_user

  def set_user
    self.user ||= Current.user
  end
end
