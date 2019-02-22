class Admin::CategoriesController < ApplicationController
  before_filter :admin_auth

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

  protected

  def admin_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_NAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end