#coding: utf-8
class Admin::UserController < ApplicationController
  before_filter :check_of_existence_administrator
  before_filter :check_for_administrating
  def new
    if request.post?
      user = User.new(:email => params[:email],
                      :password => params[:password],
                      :password_confirmation => params[:password],
                      :activated => true,
                      :banned => false,
                      :last_name => params[:last_name],
                      :first_name => params[:first_name],
                      :middle_name => params[:middle_name],
                      :middle_name => params[:middle_name],
                      :sex_id => params[:sex],
                      :chair_id => params[:chair],
                      :military_rank_id => params[:military_rank],
                      :scientific_rank_id => params[:scientific_rank],
                      :scientific_degree_id => params[:scientific_degree],
                      :post_id => params[:post],
                      :phone => params[:phone],
                      :room => params[:room])
      if user.save
        redirect_to :controller => '/admin/user', :action => 'index'
      else
        validate?
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to :controller => "/admin/user", :action => "index"
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def activate
    @user = User.find(params[:id])
    @user.update_attributes(:activated => true)
    redirect_to :controller => 'admin/user', :action => 'index'
  end

  def edit
    @user = User.find(params[:id])
    if @user
      chair_id = @user.chair_id
      if chair_id
        chair = Chair.find(chair_id)
        if chair
          @faculty_id = chair.faculty_id
        end
      end
    end
    if request.post?
      update
      if validate?
        redirect_to(:controller => 'admin/user', :action => 'index')
      end
    end
  end


  def update
    @user.update_attributes(:email => params[:email],
                            :password => params[:password],
                            :banned => false,
                            :last_name => params[:last_name],
                            :first_name => params[:first_name],
                            :middle_name => params[:middle_name],
                            :middle_name => params[:middle_name],
                            :sex_id => params[:sex],
                            :chair_id => params[:chair],
                            :military_rank_id => params[:military_rank],
                            :scientific_rank_id => params[:scientific_rank],
                            :scientific_degree_id => params[:scientific_degree],
                            :post_id => params[:post],
                            :phone => params[:phone],
                            :room => params[:room])
  end

  def password_strength(password)
    strength = 0;
    password = password.split(//)
    digits = '1234567890'.split(//);
    lwr = 'abcdefghijklmnopqrstuvwxyz'.split(//);
    upr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(//);
    spec_symbols = "?'+-_<>\";`:!@\#$%^&*(){}[],./\\|".split(//);
    for symbol in password
      if digits.include?(symbol)
        strength = strength + 1;
        break;
      end
    end
    for symbol in password
      if lwr.include?(symbol)
        strength = strength + 1;
        break;
      end
    end
    for symbol in password
      if upr.include?(symbol)
        strength = strength + 1;
        break;
      end
    end
    for symbol in password
      if spec_symbols.include?(symbol)
        strength = strength + 1;
        break;
      end
    end
    if password.length > 7
      strength = strength + 1;
    end
    return strength;
  end

  def validate?
    valid = true
    if params[:email] == ""
      flash.now[:email] = "введите email"
      valid = false
    elsif params[:email] !~ /^([a-z0-9_\-\.]+\@([a-z0-9_\-\.])+\.([a-z]{2,4}))$/i
      flash.now[:email] = "некорректный email"
      valid = false
    elsif  User.find_by_email(params[:email]) != nil
      if @user
        if @user.email != params[:email]
          flash.now[:email] = "пользователь с таким email уже зарегистрирован"
          valid = false
        end
      else
        flash.now[:email] = "пользователь с таким email уже зарегистрирован"
        valid = false
      end
    end
    if params[:password] == ""
      flash.now[:password] = "введите пароль"
      valid = false
    elsif params[:password].length < 5
      flash.now[:password] = "пароль слишком короткий"
      valid = false
    elsif params[:password].length > 30
      flash.now[:password] = "пароль слишком длинный"
      valid = false
    elsif params[:password] !~ /^([a-z0-9\?\'\+\-\_\<\>\"\;\`\:\!\@\#\$\%\^\&\*\(\)\{\}\[\]\,\.\/\\\|])+$/i
      flash.now[:password] = "пароль должен состоять только из латинских букв, цифр и спец-символов: ?'+-_<>\";`:!@\#$%^&*(){}[],./\\| "
      valid = false
    elsif password_strength(params[:password]) <= 3
      flash.now[:password] = "слабый пароль"
      valid = false
    end

    if params[:last_name] == ""
      flash.now[:last_name] = "введите фамилию"
      valid = false
    elsif params[:last_name] !~ /^([а-я])+$/i
      flash.now[:last_name] = "фамилия введена некорректно"
      valid = false
    end
    if params[:first_name] == ""
      flash.now[:first_name] = "введите имя"
      valid = false
    elsif params[:first_name] !~ /^([а-я])+$/i
      flash.now[:first_name] = "имя введено некорректно"
      valid = false
    end
    if params[:middle_name] == ""
      flash.now[:middle_name] = "введите отчество"
      valid = false
    elsif params[:middle_name] !~ /^([а-я])+$/i
      flash.now[:middle_name] = "отчество введено некорректно"
      valid = false
    end
    if params[:phone] != "" && params[:phone] !~ /^[0-9]{11}$/
      flash.now[:phone] = "номер телефона введен некорректно"
      valid = false
    end
    return valid
  end

  def create

  end

end
