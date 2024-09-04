#P2
#twin primes less than 1000 (pair of prime numbers that differ by 2)

print("All Twin Prime Numbers less than 1000: ")

# store the last found prime number
last_prime = 2

for number in range(3, 1000):

		# check if number is prime
		is_prime = True
		for factor in range (2, (number // 2) + 1):
				if number % factor == 0:
						is_prime = False
						break

		# if number is not prime then check for the next number
		if not is_prime:
				continue

		# check if difference with last prime number is 2
		if (number - last_prime) == 2:
				print(f"({last_prime}, {number})", end = ", ")

		last_prime = number
