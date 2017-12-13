class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    if @user.role.name=="user"
      @adminRole = Role.where(["name = ?", "admin"]).first
      @user.role = @adminRole
      @user.save
    else
      @userRole = Role.where(["name = ?", "user"]).first
      @user.role = @userRole
      @user.save
    end
    flash[:success] = 'OK!'
    redirect_to root_path
  end
end