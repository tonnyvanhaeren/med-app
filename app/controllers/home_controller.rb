class HomeController < ApplicationController

  before_action :authorize, only: [:contact]

  def index
  end

  def about
  end

  def contact
  end
end
