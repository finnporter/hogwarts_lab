require 'pry-byebug'
require_relative('../models/student')
require_relative('../models/house')

student_01 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 17
})

student_01.save

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