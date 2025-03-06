# ============================================
# INTRODUCTION TO R: VARIABLES, DATA TYPES & TYPE CASTING
# ============================================

# 1️⃣ R Language Introduction
# ------------------------------------------------

# R is a statistical programming language and is widely used in the Data Science industry.
# The language's nickname is "Pile of Leaves", and the version we are using is 4.4.2.
# Although R can be run independently, it is recommended to use RStudio for better functionality.

# RStudio is an Integrated Development Environment (IDE) for R.
# It consists of two important areas:
# 1. Console: Executes statements one by one directly.
# 2. Script Area: Allows writing multiple statements and executing them together.

# -------------------------------------------------
# 2️⃣ VARIABLES AND CONSTANTS
# -------------------------------------------------

# A variable is a storage for data that can change, while constants remain fixed.
# Example: If x = 10, x is a variable assigned the constant value 10.
# R is case-sensitive, meaning 'x' and 'X' are different.

# Assigning a value to a variable
x = 10
print(x)  
# Output: 10  
# Explanation: 'x' is assigned the value 10 and printing 'x' displays the stored value.

# What happens when we print 'X'?
print(X)
# Output: Error: object 'X' not found  
# Explanation: R is case-sensitive, so 'X' is different from 'x'. Since 'X' was never assigned a value, it throws an error.

# -------------------------------------------------
# 3️⃣ DATA TYPES IN R
# -------------------------------------------------

# Data type refers to the kind of data stored in a variable.
# R has three primary data types:
# 1. Numeric (e.g., 10, 3.14)
# 2. Character (e.g., "King", "Data")
# 3. Logical (e.g., TRUE, FALSE)

# Checking data type using the class() function

class(x)  
# Output: "numeric"  
# Explanation: Since x stores a number (10), its data type is numeric.

# Let's assign different data types to variables
y = "King"  
z = TRUE  

# Checking their data types
class(y)  
# Output: "character"  
# Explanation: The value "King" is enclosed in quotes, making it a character.

class(z)  
# Output: "logical"  
# Explanation: The value TRUE is a logical type.

# What happens if we assign a number inside quotes?
a = "10"  
class(a)  
# Output: "character"  
# Explanation: Even though "10" is a number, enclosing it in quotes makes it a character.

# -------------------------------------------------
# 4️⃣ TYPE CASTING (CONVERTING DATA TYPES)
# -------------------------------------------------

# Sometimes, datasets contain numbers stored as characters, and we need to convert them back to numeric.
# This process is called type casting.

# Converting character "10" to numeric
b <- as.numeric(a)  

# Checking the values before and after conversion
print(a)  
class(a)  
# Output: "character"  
# Explanation: 'a' is still a character type because we haven't changed it.

print(b)  
class(b)  
# Output: "numeric"  
# Explanation: 'b' is now a numeric value because we converted 'a' using as.numeric().

# What happens if we try to convert a non-numeric character to numeric?
print(y)  # "King"

c <- as.numeric(y)  
print(c)  
# Output: Warning message: "NAs introduced by coercion"  
# Explanation: R cannot convert "King" into a numeric value, so it assigns 'NA' (Not Available).

