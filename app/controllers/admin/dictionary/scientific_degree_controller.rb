#coding: UTF-8
class Admin::Dictionary::ScientificDegreeController < ApplicationController
  def index
    @scientific_degrees = ScientificDegree.all
  end

  def new
    if request.post?
      scientific_degree = ScientificDegree.new(:name => params[:name])
      if scientific_degree.save
        redirect_to :controller => 'admin/dictonary/scientific_degree', :action => 'index'
      else
        scientific_degree.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end

  def show
  end

  def destroy
    scientific_degree = ScientificDegree.find(params[:id])
    scientific_degree.destroy
    redirect_to :controller => 'admin/dictonary/scientific_degree', :action => 'index'
  end

  def edit
    @scientific_degree = ScientificDegree.find(params[:id])
    if request.post?
      if @scientific_degree.update_attributes(:name => params[:name])
        redirect_to :controller => 'admin/dictonary/scientific_degree', :action => 'index'
      else
        @scientific_degree.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end
end
