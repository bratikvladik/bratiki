#coding: UTF-8
class Admin::Dictionary::PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if request.post?
      post = Post.new(:name => params[:name])
      if post.save
        redirect_to :controller => 'admin/dictonary/post', :action => 'index'
      else
        post.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end

  def show
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :controller => 'admin/dictonary/post', :action => 'index'
  end

  def edit
    @post = Post.find(params[:id])
    if request.post?
      if @post.update_attributes(:name => params[:name])
        redirect_to :controller => 'admin/dictonary/post', :action => 'index'
      else
        @post.errors[:name].each do |error|
          flash[:name] = error;
        end
      end
    end
  end
end
