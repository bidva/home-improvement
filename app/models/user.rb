class User < ApplicationRecord
  belongs_to :role
  has_many :projects
  has_many :commnets
  before_create :set_default_role
  scope :private_projects, -> {projects.private}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :omniauthable, :omniauth_providers => [:facebook]
  def self.new_with_session(params, session)
	  super.tap do |user|
	    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	      user.email = data["email"] if user.email.blank?
	    end
	  end
	end

	def self.from_omniauth(auth)
    role_id = Role.where(name: 'user').first.id
  	where(provider: auth.provider, uid: auth.uid).first_or_create(role_id: role_id ) do |user|
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    	user.name = auth.info.name
    	user.image = auth.info.image
  	end
	end

  def admin?
    self.role.name.eql? "admin"
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end
