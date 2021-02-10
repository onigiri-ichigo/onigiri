class UsersController < ApplicationController
  before_action :set_current_user
  before_action :need_login,{only:[:index,:show,:own_posts,:destroy,:update,:edit]}
  before_action :ensure_user,{only:[:update,:destroy]}

  def index
    @users=User.all
  end

  def show
    @user=User.find_by(id: params[:id])
  end

  def signup
    @user=User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      user_image:"noimage.jpg"
    )
    if @user.save
      session[:user_id]=@user.id
      flash[:notice]="ユーザー登録が完了しました"
      redirect_to("/users/index")
    else
      render("signup_form")
    end
  end

  def signup_form
    @user=User.new
  end

  def login_form
  end

  def login
    @user=User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/posts/index")
    else
      @error_messages="ログインできません"
      @email=params[:email]
      @password=params[:password]
      render("login_form")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/")
  end

  def edit
    @user=User.find_by(id:params[:id])
  end

  def update
    @user=User.find_by(id:params[:id])
    @user.name=params[:name]
    @user.email=params[:email]
    @user.password=params[:password]
    if params[:user_image_date]
      @user.user_image="#{@user.id}.jpg"
      user_image_date=params[:user_image_date]
      File.binwrite("public/user_images/#{@user.user_image}",user_image_date.read)
    end
    if @user.save
      flash[:notice]="編集できました"
      redirect_to("/users/index")
    else
      render("users/edit")
    end
  end

  def destroy
    @user=User.find_by(id:params[:id])
    if @user.destroy
      flash[:notice]="削除しました"
      redirect_to("/users/index")
    end
  end

  def own_posts
    @user=User.find_by(id:session[:user_id])
  end
  
  def ensure_user
    if @current_user.id!=params[:id].to_i
       flash[:notice]="権限がありません"
       redirect_to('/posts/index')
    end
 end
end
