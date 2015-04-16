class StaticPagesController < ApplicationController
  def home
  	@projects = Amendment.where("completed IS NULL")
  end
end
