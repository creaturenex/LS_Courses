class Student

    attr_accessor :name

    def initialize(name, grade_score)
        self.name = name
        set_grade(grade_score)
    end

    def view_grade
        grade
    end

    def better_grade_than?(student)
        view_grade > student.view_grade 
    end

    private

    attr_accessor :grade

    def set_grade(grade)
        self.grade = grade
    end
    
end

joe = Student.new("Joe", 95)
bob = Student.new("Bob", 80)

puts joe.name
puts joe.view_grade
puts joe.better_grade_than?(bob)
# puts joe.grade does not work because the instance variable is currently private

=begin
LS Solution 
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)
=end