class Api::V1::ProductsController < ApplicationController
  # index renders all items in the products table
  def index
    products = Product.all
    render json: products, status: 200
  end

  #create new product
  # if the prodcut saves correctly, json redors
  # otherwise object error rendered
  def create
    product = Product.new(
      name: prod_params[:name],
      brand: prod_params[:brand],
      price: prod_params[:price],
      description: prod_params[:description]
    )

    if product.save
      render json: product, status: 200
    else 
      render json: {error: "Error creating review."}
    end
  end

  def update
      product = Product.find(params[:id])
      product.update_attributes(product_params)
      render json: product
  end

 def destroy
  Product.destroy(params[:id])
 end

  #This method looks up the product by id, if it is found json object returned, 
  # otherwise, error returned
  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
    else
      rendor json: {error: "Product not found."}
    end
  end

  #private method available only to this controller
  #uses built-in methods .require and .permit provided by ActionController
  private
    def prod_params
      params.require(:product).permit([
        :name,
        :brand,
        :price,
        :description
      ])
    end
end
