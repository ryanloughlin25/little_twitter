get '/' do
  erb :index
end

#logging in
post '/' do
  @user = User.find(params[:user])
end



#--- sign-up ---#
get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect ("/")
  else
    redirect '/signup'
  end
end
