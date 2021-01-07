class ProductsController < ApplicationController

  get '/products' do
    redirect_if_not_logged_in
    @products = current_user.products.all
    erb :'products/index'
  end

  get '/products/new' do
    redirect_if_not_logged_in
    erb :'products/new'
  end

  get '/products/:id' do
    redirect_if_not_logged_in
    find_product
    redirect_if_product_not_found
    # redirect_if_not_owner
    erb :'products/show'
  end

  get '/products/:id/edit' do
    redirect_if_not_logged_in
    find_product
    redirect_if_product_not_found
    redirect_if_not_owner
    @place = "on" if find_product.favorite
    @product.update(favorite: nil)
    # binding.pry
    erb :'products/edit'
  end

  patch '/products/:id' do
    find_product
    if @product.update(params[:product])
      redirect "/products/#{@product.id}"
    else
      redirect "/products/#{@product.id}/edit"
    end
  end

  post '/products/new' do
    product = current_user.products.build(params[:product])
    if product_already_exists?
      redirect '/products'
    elsif product.save
      redirect '/products'
    else
      redirct '/products/new'
    end
  end

  delete '/products/:id' do
    redirect_if_not_logged_in
    find_product
    redirect_if_not_owner
    @product.destroy
    redirect '/products'
  end


  private
  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_already_exists?
    current_user.products.exists?(:brand => params[:product][:brand], :name => params[:product][:name])
  end

  def redirect_if_product_not_found
    redirect '/products' unless @product
  end

  def redirect_if_not_owner
    redirect '/products' unless @product.user == current_user
  end
end

#products will belong to a user, a user will have many products