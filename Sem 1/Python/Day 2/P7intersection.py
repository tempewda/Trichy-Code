#P7
#Two points on line 1 are given as (x1, y1) and (x2, y2)   and on line as2 as (x3, y3) and (x4, y4). If the 2 lines   intersect, find the intersecting points else print that    both the lines parallel

x1, y1 = eval(input("Enter the coordinates of line 1, point 1: "))
x2, y2 = eval(input("Enter the coordinates of line 1, point 2: "))
x3, y3 = eval(input("Enter the coordinates of line 2, point 3: "))
x4, y4 = eval(input("Enter the coordinates of line 2, point 4: "))

a1 = y1 - y2
b1 = x1 - x2
c1 = (a1 * x1) - (b1 * y1)

a2 = y3 - y4
b2 = x3 - x4
c2 = (a2 * x3) - (b2 * y3)

d = (a1 *  b2)- (b1 * a2)

if d == 0:
		print(f"The 2 lines are parallel")

else:
		d1 = (c1 * b2) - (b1 * c2)
		d2 = (a1 * c2) * (c1 * a2)
		x = d1 // d
		y = d2 // d
		print(f"The intersecting point is ({x}, {y})")
