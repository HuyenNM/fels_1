class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @category.update_attributes category_params
      redirect_to admin_category_path(@category), notice: 'Category was successfully updated.' 
    else
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path 
  end

  private   
    def set_category
      @category = Category.find params[:id]
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
