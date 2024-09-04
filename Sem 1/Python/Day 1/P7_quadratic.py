# Write a python program to find whether the roots are real, equal or imaginary of a given quadratic equation

a, b, c = eval ( input ( "Enter coefficient of x^2, x and constant: "))
discriminant = (b ** 2) - (4 * a * c)
print ("Discriminant of the quadratic equation is: ", discriminant)

if discriminant == 0:
		print ("equal roots")
		x = int(-b / (2 * a))
		print ("Both roots are equal to: ", x)

elif discriminant > 0:
		print ("Real and distinct roots")
		x1 = int((-b + discriminant ** 0.5) / (2 * a))
		x2 = int((-b - discriminant ** 0.5) / (2 * a))
		print ("Roots are ", x1, " and ", x2)

else:
		discriminant = - discriminant
		root_discriminant = int(discriminant ** 0.5)
		x = int(-b / (2 * a))
		print ("Imaginary roots")
		x1 = str(x) + "+" + str(root_dis) + "i"
		x2 = str(x) + "-" + str(root_dis) + "i"
		print("Roots are ", x1, " and ", x2)
