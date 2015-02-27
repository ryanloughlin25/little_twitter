get '/' do
  #render the profile page
  erb :index
end

# get list of users
get '/users' do
  @users = User.all
  erb :users_list
end


#-------- sessions -------------

# get '/sessions/new' do
#   #render sign-in page
#   erb :signin
# end # dont need because partial is on erb index

post '/' do
  #sign-in
  @user = User.find_by(username: params[:user][:username])
  if @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

# get '/sessions' do

#   erb :index
# end



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
    redirect "/"
  else
    redirect '/signup'
  end
end

#-------- profile -------------#

get '/users/:id' do
  @user = User.find(params[:id])
  @user_tweets = @user.tweets.sort
  erb  :profile
end

# get '/users/:id/tweets/new' do
#   erb :profile
# end

post '/users/:id/tweets' do
  @user = User.find(params[:id])
  @user.tweets.create(content: params[:content])
  # tweet = Tweet.create(content: params[:content])
  redirect "/users/#{params[:id]}"
end


# --- logout / sign out
get '/logout' do
#sign-out
  session.clear
  redirect '/'
end

post '/users/follow/:id' do
  Followership.find_or_create_by(followed_id: params[:id], follower_id: current_user.id)
  redirect "/users/#{params[:id]}"
end
