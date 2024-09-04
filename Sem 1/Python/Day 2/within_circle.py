# Write a python program that prompts the user to enter a point (x, y) and checks whether the point is within the circle centred at (0, 0) with radius 10

print("Enter coordinates of the point:")
x = eval(input("x-coordinate: "))
y = eval(input("y-coordinate: "))

radius = 10
distance_from_origin = (x**2 + y**2) ** 0.5
if distance_from_origin <= radius:
	print(f"Point ({x}, {y}) is inside the circle with radius {radius}")
else:
	print(f"Point ({x}, {y}) is outside the circle with radius {radius}")
