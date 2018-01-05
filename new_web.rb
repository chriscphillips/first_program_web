require "sinatra"

get '/' do
    erb :sandwich_greeting
end

get '/home' do
    erb :home
end

get '/get_sandwich' do
    redirect '/get_sandwich '
end

post '/sandwich_choice' do
    sandwich = params[:sandwich]
    redirect '/sides?sandwich=' + sandwich
end 

get '/sides' do
    sandwich = params[:sandwich]
    erb :sides, :locals => {:sandwich => sandwich}
end

post '/sides' do
    sandwich = params[:sandwich]
    sides = params[:yes]
    no_sides = params[:no]
    if params[:yes] = 'yes'
        side = "sides"
        redirect '/drink?sandwich=' + sandwich + '&side=' + side
    else
        erb :sides, :locals => {:sandwich => sandwich}
    end
end

post '/side_choice' do
    sandwich = params[:sandwich]
    side = params[:side]
    redirect '/drink?sandwich=' + sandwich + '&side=' + side
end

get '/drink' do
    sandwich = params [:sandwich]
    sides = params[:sides]
	drink = params[:drink]
	erb :drink, :locals => {:drink => drink}
    redirect '/drink?sandwich=' + sandwich + '&sides' +sides
end
 
post '/drink' do
	sandwich = params[:sandwich]
    side = params[:side]
    drink = params[:drink]
    redirect '/order?sandwich=' + sandwich + '&side=' + side + '&drink=' + drink
end

get '/complete_order' do
    order = params[:order]
    erb :complete_order, :locals => {:order => order}
end

post '/complete_order' do
    order = params[:order]
    redirect '/complete_order?complete_order=' + complete_order
end
