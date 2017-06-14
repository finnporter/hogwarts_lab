require 'pry-byebug'
require_relative('../db/SqlRunner')

class Student

  attr_accessor :first_name,
                :last_name,
                :house,
                :age

  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house = options["house"]
    @age = options["age"].to_i   
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end
  
  def save
    sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ('#{first_name}', '#{last_name}', '#{house}', #{age}) RETURNING *;"
    student_data = SqlRunner.run(sql)
    @id = student_data.first['id'].to_i
  end 

  def self.find_all
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student)}
    return result
  end

def self.find(id)
    sql ="SELECT * FROM students WHERE id=#{id};"
    student = SqlRunner.run(sql)
    result = Student.new(student.first)
    return result
end
end