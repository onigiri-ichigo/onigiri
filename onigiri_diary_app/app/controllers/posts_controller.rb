class PostsController < ApplicationController
  before_action :set_current_user
  before_action :need_login,{only:[:index,:create_form,:create,:show,:destroy,:edit,:update]}
  before_action :ensure_user,{only:[:detstroy,:edit]}

  def index
    @posts=Post.all.order(created_at: :desc)
  end

  def create_form
    @post=Post.new
  end

  def create
    @post=Post.new(
      title: params[:title],
      content: params[:content],
      diary_image_name:"noimage.jpg",
      user_id:@current_user.id
    )
    if @post.save
      flash[:notice]="投稿できました"
      redirect_to("/posts/index")
    else
      render("posts/create_form")
    end
  end

  def show
    @post=Post.find_by(id: params[:id])
    @user=User.find_by(id: @post.user_id)
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="削除しました"
    redirect_to("/posts/index")
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])
    @post.title=params[:title]
    @post.content=params[:content]
    if params[:diary_image]
      @post.diary_image_name="#{@post.id}.jpg"
      diary_image=params[:diary_image]
      File.binwrite("public/diary_images/#{@post.diary_image_name}",diary_image.read)
    end
    if @post.save
      flash[:notice]="編集できました"
      redirect_to("/posts/index")
    else
      render("posts/create_form")
    end
  end
  
  def ensure_user
    @post=Post.find_by(id: params[:id])
    if @post.user_id!=@current_user.id
       flash[:notice]="権限がありません"
       redirect_to('/posts/index')
    end
  end
end
