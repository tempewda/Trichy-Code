# Write a python program to compute the volume and surface area of a sphere

radius = eval (input ("Enter the radius of the sphere: "))

volume = ( 4 / 3 ) * 3.1412 * (radius ** 3)
surface_area = 4 * 3.1412 * (radius ** 2)

print ("Volume of the sphere is: ", volume, " cubic units")
print ("Surface Area of the sphere is ", surface_area, " square units")
