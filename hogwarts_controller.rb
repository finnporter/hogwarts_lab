require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'models/student'
require_relative 'models/house'

#INDEX
get "/students" do
  @students = Student.find_all
  erb(:index_s)
end

#INDEX
get "/houses" do
  @houses = House.find_all
  erb(:index_h)
end

#NEW
get "/students/new" do
  erb(:new)
end

post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# #SHOW
# get "/students/:id" do
#   @student = Student.find_all(params["id"].to_i)
#   erb(:show)
# end