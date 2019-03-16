class HomeController < ApplicationController

  before_action :authorize, only: [:contact]

  def index
    @page_title = "Home"
  end

  def about
    @page_title = "About"
  end

  def contact
    @page_title = "Contact"
  end
end
