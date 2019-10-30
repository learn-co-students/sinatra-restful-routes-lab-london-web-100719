class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # ==HOME
  get '/' do
    # redirect to index view
    redirect '/recipes'
  end

  # ==INDEX
  get '/recipes' do
    # logic
    @recipes = Recipe.all
    # directs to index view
    erb :index
  end

  #==CREATE

  # new form
  get '/recipes/new' do
    # logic
    # direct to new form
    erb :new
  end

  # create instance
  post '/recipes' do
    # logic
    @recipe = Recipe.create(params)
    # redirect to show form
    redirect "/recipes/#{@recipe.id}"
  end

  #==SHOW
  get '/recipes/:id' do
    # logic
    @recipe = Recipe.find_by_id(params[:id])
    # directs to show form
    erb :show
  end

  #==UPDATE

  get '/recipes/:id/edit' do
    # logic
    @recipe = Recipe.find_by_id(params[:id])
    # directs to edit form
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    # @recipe.update(params[:recipe])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    # directs to show form
    redirect "/recipes/#{recipe.id}"
  end

  #==DELETE

  delete '/recipes/:id' do
    #logic
    Recipe.destroy(params[:id])
    # directs to show form
    redirect '/recipes'
  end


end
