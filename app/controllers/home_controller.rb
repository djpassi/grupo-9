class HomeController < ApplicationController

  include Secured

  def index;
    @categories = Category.all.pluck(:name)
  end

end
