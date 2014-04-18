class StaticPagesController < ApplicationController
  def index
     flash[:notice] = "You are in the landing page"
  end
end
