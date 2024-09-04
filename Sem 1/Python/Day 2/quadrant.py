# Write a python program to evaluate quandrant system when user enters the coordinates of x and y

x = eval(input("x-coordinate: "))
y = eval(input("y-coordinate: "))

if x > 0.0 and y > 0.0:
	print("Given point (", x, ",", y, ") is in First Quadrant")
elif x < 0.0 and y > 0.0:
	print("Given point (", x, ",", y, ") is in Second Quadrant")
elif x < 0.0 and y < 0.0:
	print("Given point (", x, ",", y, ") is in Third Quadrant")
elif x > 0.0 and y < 0.0:
	print("Given point (", x, ",", y, ") is in Fourth Quadrant")
else:
	print("Given point (", x, ",", y, ") is at Origin")
