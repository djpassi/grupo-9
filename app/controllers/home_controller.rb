class HomeController < ApplicationController

  include Secured

  def index
    ExampleMailer.sample_email(@user).deliver_later
  end

end
