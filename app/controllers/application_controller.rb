class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all 
    erb :index 
  end 

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end 

  get '/recipes/new' do 
    erb :new
  end 

  post '/recipes' do
    @recipes = Recipe.all
    @recipe = Recipe.create(params[:recipe])
    erb :index
  end 

  get '/recipes/:id' do 
    id = params[:id]
    @recipe = Recipe.find(id)
    erb :show
  end 

  get '/recipes/:id/edit' do 
    id = params[:id]
    @recipe = Recipe.find(id)
    erb :edit 
  end 

  patch '/recipes/:id' do 
    id = params[:id]
    @recipe = Recipe.find(id)
    @recipe.name = params[:recipe][:name]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.cook_time = params[:recipe][:cook_time]
    @recipe.save
    erb :show
  end

  delete '/recipes/:id' do 
    binding.pry
    id = params[:recipe][:id]
    @recipe = Recipe.find
    Recipe.destroy(params[:recipe][:id])
    erb :index 
  end 



end
