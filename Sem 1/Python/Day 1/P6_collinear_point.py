# Write a python program to to check if three points are collinear or not

x1, y1 = eval ( input ("Enter the 2 coordinates of point 1: "))
x2, y2 = eval ( input ("Enter the 2 coordinates of point 2: "))
x3, y3 = eval ( input ("Enter the 2 coordinates of point 3: "))

determinant = x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 -y2)

if determinant == 0:
		print ("The 3 points are collinear with determinant: ", determinant)
else:
		print ("The 3 points are not collinear with determinant: ", determinant)
