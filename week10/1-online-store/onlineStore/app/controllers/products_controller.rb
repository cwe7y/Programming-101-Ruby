class ProductsController < ApplicationController
def index
  render json: Product.all
end

def count
  render json: Product.count
end

def show
  render json: Product.find(params[:index])
end

def range
  render json: Product.where("index >= ?" ,params[:index] )
end

def from
  render json: Product.where("index >= ?", params[:index].limit(params[:count])) 
end

def create
  @Product = Product.new(product_params)
if @product.save
  render json:@product, status: :created
else
  render json:@product.errors, status: :unprocessable_entity
end
end

def update
  @product = Product.find(params[:index])
  render json: product.update(product_params)

 if @brand.update?
  render json: @product
 else
  render json: @product.errors
  end
end

def destroy
   @product = Product.find(params[:index])
   @product.destroy

  if @product.destroy?
    render json: {deleted_product_id: params[:index]}
  else
    redner json: @product.errors
  end
end

private
def product_params
  params.require(:product).permit(:name, :price, :quantity)
  
end
end