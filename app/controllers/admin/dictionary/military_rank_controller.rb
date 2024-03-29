#coding: UTF-8
class Admin::Dictionary::MilitaryRankController < ApplicationController
  def index
    @military_ranks = MilitaryRank.all
  end

  def new
    if request.post?
      military_rank = MilitaryRank.new(:name => params[:name])
      if military_rank.save
        redirect_to :controller => 'admin/dictionary/military_rank', :action => 'index'
      else
        military_rank.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end

  def show
  end

  def destroy
    military_rank = MilitaryRank.find(params[:id])
    military_rank.destroy
    redirect_to :controller => 'admin/dictionary/military_rank', :action => 'index'
  end

  def edit
    @military_rank = MilitaryRank.find(params[:id])
    if request.post?
      if @military_rank.update_attributes(:name => params[:name])
        redirect_to :controller => 'admin/dictionary/military_rank', :action => 'index'
      else
        @military_rank.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end
end
