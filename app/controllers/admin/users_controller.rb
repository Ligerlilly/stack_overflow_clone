class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action do
    unless current_user && current_user.admin?
      redirect_to questions_path, alert: 'You are not admin'
    end
  end

  def index
    @users = User.all
  end

  private

  def admin?
    self.admin == true
  end
end
