require "sinatra"

get '/' do
    erb :sandwich_greeting
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
    sides = params[:sides]
    redirect '/drink?sandwich=' + sandwich + '&sides=' + sides
end

get '/drink' do
    sandwich = params[:sandwich]
    sides = params[:sides]
	erb :drink, :locals => {:sandwich => sandwich, :sides => sides}
end
 
post '/drink' do
	sandwich = params[:sandwich]
    sides = params[:sides]
    drink = params[:drink]
    redirect '/complete_order?sandwich=' + sandwich + '&sides=' + sides + '&drink=' + drink
end

get '/complete_order' do
    sandwich = params[:sandwich]
    sides = params[:sides]
    drink = params[:drink]
    erb :complete_order, :locals => {:sandwich => sandwich, :sides => sides, :drink => drink}
end
