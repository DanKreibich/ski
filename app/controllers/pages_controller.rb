class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    @resorts = User.where(role: 1).pluck(:resort).uniq.sort
  end

  def contact
  end
end
