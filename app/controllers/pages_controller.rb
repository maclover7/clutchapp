class PagesController < ApplicationController
  def home
    @announcements = Announcement.all
  end

  def about
  end

  def english
  end

  def music
  end
end
