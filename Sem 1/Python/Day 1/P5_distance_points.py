# Write a python program to find the distance between 2 points: (x1, y1, z1) and (x2, y2, z3)

x1, y1, z1 = eval ( input ("Enter the 3 coordinates of point 1: "))
x2, y2, z2 = eval ( input ("Enter the 3 coordinates of point 2: "))

distance = (((x2 - x1) ** 2) + ((y2 - y1) ** 2) + ((z2 - z1) ** 2)) ** (1/2)

print ("Distance: ", distance)
