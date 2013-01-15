# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
Tolerance = 0.0001

def is_valid_triangle(a, b ,c)
    sum_of = (a + b).abs
      diff_of = (a - b).abs
        return diff_of < c && c < sum_of
end

def triangle(a, b, c)
    raise TriangleError, "sides must be strictly positive" unless a > 0 && b > 0 && c > 0
      raise TriangleError, "only triangles embeddable in the euclidean plane allowed" unless is_valid_triangle(a,b,c)
        a_b_are_equals = ( (a-b).abs < Tolerance )
          a_c_are_equals = ( (a-c).abs < Tolerance )
            b_c_are_equals = ( (b-c).abs < Tolerance )
              isosceles = a_b_are_equals || a_c_are_equals || b_c_are_equals
                equilateral = a_b_are_equals && a_c_are_equals
                  if equilateral
                        return :equilateral
                          end
                    if isosceles
                          return :isosceles
                            end
                      return :scalene
end


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
