# Write a python program that rompts the user to enter a point (x, y) and checks whether the point is within the rectangle centred at (0, 0) with width 10 and height 5. (Hint: A point is within the rectangle if its horizontal distance to (0, 0) is less than or equal to 10/2 and its vertical distance to (0, 0) is less than or equal to 5/2

print("Enter coordinates of the point:")
x = eval(input("x-coordinate: "))
y = eval(input("y-coordinate: "))

length = 10
height = 5

if abs(x) <= (length / 2) and abs(y) <= (height / 2):
	print(f"Point ({x}, {y}) lies within the rectangle of length {length} and height {height}")
else:
	print(f"Point ({x}, {y}) does not lie within the rectangle of length {length} and height {height}")
