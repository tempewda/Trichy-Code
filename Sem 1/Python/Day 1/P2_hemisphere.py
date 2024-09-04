# Write a python program to compute the volume, curved surface area and total surface area of a hemisphere

radius = eval (input ("Enter the radius of the hemisphere: "))

volume = ( 2 / 3 ) * 3.1412 * (radius ** 3)
curved_surface_area = 2 * 3.1412 * (radius ** 2)
total_surface_area = 3 * 3.1412 * (radius ** 2)

print ("Volume of the hemisphere is: ", volume, " cubic units")
print ("Curved Surface Area of the hemisphere is ", curved_surface_area, " square units")
print ("Total Surface Area of the hemisphere is ", total_surface_area, " square units")
