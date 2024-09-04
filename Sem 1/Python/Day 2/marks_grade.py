# Write a python program to print grades according to marks

marks = eval(input("Enter your marks: "))

if marks < 35.0:
	print("Grade: Fail")
elif marks < 40.0:
	print("Grade: P")
elif marks < 50.0:
	print("Grade: E")
elif marks < 60.0:
	print("Grade: D")
elif marks < 70.0:
	print("Grade: C")
elif marks < 80.0:
	print("Grade: B")
elif marks < 90.0:
	print("Grade: A")
else:
	print("Grade: S")
