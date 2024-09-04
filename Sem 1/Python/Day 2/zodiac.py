# Write a python program  to find out Chinese Zodiac Sign for given year. It is based on 12 year cycle and each given year in this cycle is represented by animal
# use multi way selection if elif and else

year = eval(input("Enter year: "))
zodiacSign = year % 12

if zodiacSign == 0:
		print("Zodiac Sign 0: Monkey")

elif zodiacSign == 1:
		print("Zodiac Sign 1: Rooster")

elif zodiacSign == 2:
		print("Zodiac Sign 2: Dog")

elif zodiacSign == 3:
		print("Zodiac Sign 3: Pig")

elif zodiacSign == 4:
		print("Zodiac Sign 4: Rat")

elif zodiacSign == 5:
		print("Zodiac Sign 5: Ox")

elif zodiacSign == 6:
		print("Zodiac Sign 6: Tiger")

elif zodiacSign == 7:
		print("Zodiac Sign 7: Rabbit")

elif zodiacSign == 8:
		print("Zodiac Sign 8: Dragon")

elif zodiacSign == 9:
		print("Zodiac Sign 9: Snake")

elif zodiacSign == 10:
		print("Zodiac Sign 10: Horse")

else:
		print("Zodiac Sign 11: Sheep")
