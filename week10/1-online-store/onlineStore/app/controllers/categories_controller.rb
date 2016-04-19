class CategoriesController < ApplicationController
def index
  render json: Category.all
end

def count
  render json: Category.count
end

def show
  render json: Category.find(params[:index])
end

def range
  render json: Category.where("index >= ?" ,params[:index] )
end

def from
  render json: Category.where("index >= ?", params[:index].limit(params[:count])) 
end

def create
  @category = Category.new(category_params)
if @category.save
  render json:@category, status: :created
else
  render json:@category.errors, status: :unprocessable_entity
end
end

def update
  @category = Category.find(params[:index])
  render json: @category.update(category_params)

 if @brand.update?
  render json: @category
 else
  render json: @category.errors
  end
end

def destroy
   @category = Category.find(params[:index])
   @category.destroy

  if @category.destroy?
    render json: {deleted_brand_id: params[:index]}
  else
    redner json: @category.errors
  end
end

private
def category_params
  params.require(:category).permit(:name)
  
end
end