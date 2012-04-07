#coding: UTF-8
class Admin::Dictonary::SexController < Admin::DictonaryController
  def index
    @sexs = Sex.all
  end

  def new
    if request.post?
      sex = Sex.new(:name => params[:name])
      if sex.save
        redirect_to :controller => 'admin/dictonary/sex', :action => 'index'
      else
        sex.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end

  def show
  end

  def destroy
    sex = Sex.find(params[:id])
    sex.destroy
    redirect_to :controller => 'admin/dictonary/sex', :action => 'index'
  end

  def edit
    @sex = Sex.find(params[:id])
    if request.post?
      if @sex.update_attributes(:name => params[:name])
        redirect_to :controller => 'admin/dictonary/sex', :action => 'index'
      else
        @sex.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end
end
