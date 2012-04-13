#coding: UTF-8
class Admin::Dictionary::ScientificRankController < ApplicationController
  before_filter :check_of_existence_administrator
  before_filter :check_for_administrating
  def index
    @scientific_ranks = ScientificRank.all
  end

  def new
    if request.post?
      scientific_rank = ScientificRank.new(:name => params[:name])
      if scientific_rank.save
        redirect_to :controller => 'admin/dictonary/scientific_rank', :action => 'index'
      else
        scientific_rank.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end

  def show
  end

  def destroy
    scientific_rank = ScientificRank.find(params[:id])
    scientific_rank.destroy
    redirect_to :controller => 'admin/dictonary/scientific_rank', :action => 'index'
  end

  def edit
    @scientific_rank = ScientificRank.find(params[:id])
    if request.post?
      if @scientific_rank.update_attributes(:name => params[:name])
        redirect_to :controller => 'admin/dictonary/scientific_rank', :action => 'index'
      else
        @scientific_rank.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end
end
