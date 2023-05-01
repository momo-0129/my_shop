class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  before_action :require_admin_user, only: [:new, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  
  end

  def edit
  end

  def new
    @product = Product.new  
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created successfully"
      redirect_to @product
    else
      render :new, status: :bad_request
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Updated article"
      redirect_to @product
    else
      render :new, status: :bad_request
    end

  end



  private

  def set_product 
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :avatar)
  end

  def require_admin_user
    if !current_user.admin?
      flash[:alert] = "You are not admin user"
      redirect_to root_path
    end
  end

end