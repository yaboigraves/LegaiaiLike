class_name Symbols

#general enums
enum Direction {UP,RIGHT,DOWN,LEFT}




#combat stat shit
#so we have red vs blue, and green vs yellow
#red and blue control the speed
#green yellow control flavor
#the zones are constructed by using vector math
#I guess we can do 8 zones actually
#pure red - hifi intense (punchy bangers)
#red green - stony and high energy, flylo stuff?
#pure green - stony kush anthems
#blue green - ambient stony stuff, dub, spirutal jazz
#pure blue - ambient and drone
#blue yellow - dnb, jungle, ambient but a little rhythmic
#pure yellow - breakbeat fast dnb shit
#yellow red - trappy heady or something

#these need work but we should code in support for 8 quadrants
#so any time an attack is processed, lets contribute an amount towards the vector


enum DamageType {BALANCED,RED,BLUE,GREEN,YELLOW}
