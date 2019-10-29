class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # index / READ => GET
  get '/' do
    redirect to '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # new / CREATE => GET
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end

  # create / CREATE => POST
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # show / READ => GET
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # edit / UPDATE => GET
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # update / UPDATE => PUT
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}" # params[:id] instead?
  end

  # destroy / DELETE => DELETE
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
