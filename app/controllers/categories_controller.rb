class CategoriesController < ApplicationController
  before_action :category, only:[:show, :edit, :update, :destroy]
  before_action :require_admin, only:[:new, :create, :edit, :update, :destroy]

  def index
    @category = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "A new category has been created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "You have successfully updated the category name"
      redirect_to categories_path
    else
      render 'edit'
    end

  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Only Admin can access this"
      redirect_to root_path
    end
  end
end