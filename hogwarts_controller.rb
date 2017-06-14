require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'models/student'
require_relative 'models/house'

#INDEX Students
get "/students" do
  @students = Student.find_all
  erb(:index_s)
end

#INDEX Houses
get "/houses" do
  @houses = House.find_all
  erb(:index_h)
end

#NEW
get "/students/new" do
  erb(:new)
end

#DELETE Students
post "/students/:id/delete" do
  @student = Student.find(params["id"].to_i)
  @student.delete()
  erb(:delete)
end

#DELETE Houses
post "/houses/:id/delete" do
  @house = House.find(params["id"].to_i)
  @house.delete()
  erb(:delete)
end

#SHOW
get "/students/:id" do
  @student = Student.find(params["id"].to_i)
  erb(:show)
end

#CREATE
post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end




