class Upmin::ApplicationController < ApplicationController
  before_action :login_required
  before_filter :is_admin?

  def is_admin?
    if current_user.admin == false
      redirect_to main_app.root_path, notice: "Not authorized"
    end
  end
end
