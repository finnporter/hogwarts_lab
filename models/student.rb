require 'pry-byebug'
require_relative('../db/SqlRunner')

class Student

  attr_accessor :first_name,
  :last_name,
  :house,
  :age

  attr_reader :id, :house_id

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"].to_i   
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end
  
  def save
    sql = "INSERT INTO students (first_name, last_name, age) VALUES ('#{first_name}', '#{last_name}', #{age}) RETURNING *;"
    student_data = SqlRunner.run(sql)
    @id = student_data.first['id'].to_i
  end 

  def update()
    sql = "UPDATE students SET
    first_name = '#{ @first_name }',
    last_name = '#{ @last_name }',
    age = '#{ @age }'
    WHERE id = '#{ @id }';"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM students WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end

  def house()
   sql = "SELECT houses.* FROM houses
   INNER JOIN students
   ON students.house_id = students.id"
   house_hashes = SqlRunner.run(sql)
   result = house_hashes.map { |house_hash| House.new(house_hash) }
   return result
 end
 #needs some serious thought - breaks localhost/students

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

def self.delete_all()
  sql = "DELETE FROM students;"
  SqlRunner.run( sql )
end
end