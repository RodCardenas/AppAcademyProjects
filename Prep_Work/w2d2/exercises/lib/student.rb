# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.
#

class Student

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def courses
    @courses
  end

  def enroll(course)
    @courses.each do |enrolled_course|
      if enrolled_course.conflicts_with?(course)
        raise "course conflicts with already enrolled course"
      end
    end
    @courses.push(course) unless @courses.include?course
    @courses.last.students.push(self)
  end

  def course_load
    course_load = {}
    credits = 0
    @courses.each do |course|
      if course_load.include?course.department
        credits = course_load.fetch(course.department)
        credits += course.credits
        course_load.store(course.department, credits)
      else
        course_load.store(course.department, course.credits)
      end
    end

    course_load
  end
end
