get '/' do
  erb :index
end

post '/new' do
  @user = params[:user]
  @newUser = User.create(name: @user["name"],
  address: @user["address"])

  redirect '/'
end
