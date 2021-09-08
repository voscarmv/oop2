class Classroom
  attr_accessor :label, :student

  has_many :students

  def initialize(label, student)
    @label = label
    @student = student
  end

  def add_students(student)
    @students.push(student)
  end
end
