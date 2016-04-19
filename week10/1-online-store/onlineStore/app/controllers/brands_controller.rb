class BrandsController < ApplicationController
def index
  render json: Brand.all
end

def count
  render json: Brand.count
end

def range
  range json: Brand.where("index" ,params[:index] )
 # GET .brands/range/1; DROP TABLE brands;
#params[:index] = "1; DROP TABLE brands"
 # SELECT * FROM brands Where index > 7
  
end

def show
  render json:@brand = Brand.find(params[:index])
  
end

def create
  @brand = Brand.new(brand_params)
if @brand.save
  render json:@brand, status: :created
else
  render json:@brand.errors, status: :unprocessable_entity
end
end

def destroy
  @brand = Brand.find(params[:index])
  @brand.destroy

  if @brand.destroy?
    render json: {deleted_brand_id: params[:index]}
  else
    redner json: @brand.errors
  end
end
#params[:name]
#params[:quality]
#params[:controller] #brands
#params[:action] #create
#params[:brand] = {name: "So fancy", quality : "Great"}
def update
  @brand = Brand.find(params[:index])
  render json: @brand.update(brand_params)
 if @brand.update?
  render json: @brand
 else
  render json: @brand.errors
  end
end

def from
  render json: Brand.where("index >= ?", params[:index].limit(params[:count]))  
end

private
def brand_params
  params.require(:brand).permit(:name, :description)
  
end
end
