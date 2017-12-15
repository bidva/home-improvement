# base application class
class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  around_action :set_current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    # flash[:warning] = "You are not authorized to perform this action."
    policy_name = exception.policy.class.to_s.underscore
    flash[:warning] = t(
      "#{policy_name}.#{exception.query}",
      scope: 'pundit',
      default: :default
    )
    redirect_to(request.referrer || root_path)
  end

  def set_current_user
    Current.user = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end
end
