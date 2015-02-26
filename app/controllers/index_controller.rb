
get '/' do
  erb :index
end

post '/' do
  @user = User.find(params[:user])
end
