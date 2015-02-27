get '/' do
  #render the profile page
  erb :index
end

#-------- sessions -------------

get '/sessions/new' do
  #render sign-in page
  erb :signin
end

post '/sessions' do
  #sign-in
  @user = User.find_by(username: params[:user][:username])
  if @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

get '/sessions' do

  erb :index
end

get '/sessions/:id' do
#sign-out
  session.clear
  redirect '/'
end


#--- sign-up ---#
get '/users/new' do
  #render signup page
  erb :signup
end

post '/users' do
  #sign-up a user
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect ("/")
  else
    redirect '/signup'
  end
end
