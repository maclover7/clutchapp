class PagesController < ApplicationController
  def home
    @announcements = Announcement.all
    current_user.update_attribute :teacher, true
    current_user.update_attribute :can_announce, true
    current_user.update_attribute :admin, true
  end

  def about
  end

  def english
  end

  def music
  end
end
