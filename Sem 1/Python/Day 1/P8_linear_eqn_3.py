# Solve system of homogeneous linear eqations with 3 unknowns using Cramer's Rule or Cross Multiplication method
# correction required in D1 formula


a1, b1, c1, d1 = eval(input("Enter the coefficients of x, y, z and constant for first equation: "))
a2, b2, c2, d2 = eval(input("Enter the coefficients of x, y, z and constant for second equation: "))
a3, b3, c3, d3 = eval(input("Enter the coefficients of x, y, z and constant for third equation: "))

D = int(a1 * (b2 * c3 - b3 * c2) - b1 * (a2 * c3 - a3 * c2) + c1 * (a2 * b3 - a3 * b2))
D1 = int(d1 * (b2 * c3 - b3 * c2) - b1 * (d2 * c3 - d3 * c2) + c1 * (a2 * b3 - d3 * b2))
D2 = int(a1 * (d2 * c3 - d3 * c2) - d1 * (a2 * c3 - a3 * c2) + c1 * (a2 * d3 - a3 * d2))
D3 = int(a1 * (b2 * d3 - b3 * d2) - b1 * (a2 * d3 - a3 * d2) + d1 * (a2 * b3 - a3 * b2))
print("Value of D: ", D)
print("Value of D1: ", D1)
print("Value of D2: ", D2)
print("Value of D3: ", D3)

if D == 0:
		if D1 == 0 and D2 == 0 and D3 == 0:
				print("Infinite number of solutions")
		else:
				print("No solution")

else:
		x = int(D1/D)
		y = int(D2/D)
		z = int(D3/D)
		print("Values of x, y and z are ", x, y, z)
