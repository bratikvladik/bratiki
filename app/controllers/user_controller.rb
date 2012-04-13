#coding: utf-8
class UserController < ApplicationController
  before_filter :check_of_existence_administrator
  before_filter :authorize
  def home
    @user = User.find(session[:user_id])
    if request.post?
      if params[:commit] == "Изменить"
        render("user")
      elsif params[:commit] = "Сохранить"
        if @user.update_attributes(:last_name => params[:last_name],
                                   :first_name => params[:first_name],
                                   :middle_name => params[:middle_name],
                                   :sex_id => params[:sex],
                                   :chair_id => params[:chair],
                                   :military_rank_id => params[:military_rank],
                                   :scientific_rank_id => params[:scientific_rank],
                                   :scientific_degree_id => params[:scientific_degree],
                                   :post_id => params[:post],
                                   :phone => params[:phone],
                                   :room => params[:room])
          redirect_to :controller => 'user', :action => 'home'
        else
          @user.errors[:last_name].each do |error|
            flash[:last_name] = error;
          end
          @user.errors[:first_name].each do |error|
            flash[:first_name] = error;
          end
          @user.errors[:middle_name].each do |error|
            flash[:middle_name] = error;
          end
          @user.errors[:phone].each do |error|
            flash[:phone] = error;
          end
          @user.errors[:room].each do |error|
            flash[:room] = error;
          end
          render("user");
        end
      end
    end
  end

  def schedule
    @last_name_with_initials = User.find(session[:user_id]).last_name_with_initials
    @pairs = Pair.where(:teacher => @last_name_with_initials)
    @date = params[:month] ? Date.strptime(params[:month],"%Y-%m") : Date.today
  end
end
