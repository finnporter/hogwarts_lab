require 'pry-byebug'
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all
House.delete_all

student_01 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "age" => 17
})

student_02 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "age" => 18
})

student_03 = Student.new({
  "first_name" => "Luna",
  "last_name" => "Lovegood",
  "age" => 18
})

student_01.save
student_02.save
student_03.save

house_01 = House.new({
  "name" => "Gryffindor",
  "logo" => "https://goo.gl/xSxNQK"
  })

house_02 = House.new({
  "name" => "Ravenclaw",
  "logo" => "https://goo.gl/Ptz5Z3"
  })

house_03 = House.new({
  "name" => "Slytherin",
  "logo" => "https://goo.gl/pIjO88"
  })

house_04 = House.new({
    "name" => "Hufflepuff",
    "logo" => "https://goo.gl/Xrrj0U"
  })

house_01.save
house_02.save
house_03.save
house_04.save

binding.pry
nil