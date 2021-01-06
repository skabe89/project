class ProductsController < ApplicationController

  get '/products' do
    erb :'products/index'
  end

  get '/products/:id' do
    erb :'products/show'
  end

end

#products will belong to a user, a user will have many products