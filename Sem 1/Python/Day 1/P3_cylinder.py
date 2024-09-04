# Write a python program to compute the volume, curved surface area and total surface area of a cylinder of radius 7 cm and height 40 cm

radius = 7
height = 40

volume = 3.1412 * (radius ** 2) * height
curved_surface_area = 2 * 3.1412 * radius * height
total_surface_area = (2 * 3.1412 * radius * height) + (2 * 3.1412 * (radius ** 2))

print ("Volume of the cylinder is: ", volume, " cubic units")
print ("Curved Surface Area of the cylinder is ", curved_surface_area, " square units")
print ("Total Surface Area of the cylinder is ", total_surface_area, " square units")
