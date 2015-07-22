class HomeController < ApplicationController

  def index
    @scholarships = Scholarship.all
  end

end
