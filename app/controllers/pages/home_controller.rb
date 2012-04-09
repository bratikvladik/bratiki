#coding: UTF-8
class Pages::HomeController < ApplicationController
  before_filter :authorize
  def index
  end

  def schedule
    @last_name_with_initials = User.find(session[:user_id]).last_name_with_initials
    @schedule = Schedule.where(:last_name_with_initials => @last_name_with_initials)
    @date = params[:month] ? Date.strptime(params[:month],"%Y-%m") : Date.today
  end
end
