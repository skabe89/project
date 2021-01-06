class ProductsController < ApplicationController

  get '/products' do
    @products = current_user.products.all
    # binding.pry
    erb :'products/index'
  end

  get '/products/new' do
    erb :'products/new'
  end

  get '/products/:id' do
    @product = Product.find_by(id: params[:id])
    # binding.pry
    erb :'products/show'
  end

  get '/products/:id/edit' do
    @product = Product.find_by(id: params[:id])
    @product.update(favorite: nil)
    erb :'products/edit'
  end

  patch '/products/:id' do
    @product = Product.find_by(id: params[:id])
    # binding.pry
    if @product.update(params[:product])
      redirect "/products/#{@product.id}"
    end
  end

  post '/products/new' do
    product = current_user.products.build(params[:product])
    if product.save
      redirect '/products'
    else
      redirct '/products/new'
    end
  end

end

#products will belong to a user, a user will have many products