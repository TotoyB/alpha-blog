class UsersController < ApplicationController
  before_action :user_id, only:[:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created!, Welcome to the Alpha-Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end

  def show
    @users_article = @user.articles
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Users account has been updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def desttroy

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)

  end

  def user_id
    @user = User.find(params[:id])
  end

end