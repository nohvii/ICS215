from BacligFrederick02 import *; # Change LastnameFirstname02 to your own LastnameFirstname02

"""
  shopping.py will test the functions displayGroceries, addGroceries, and groceryTotal defined in a separate file.
  An initial grocery list is implemented as a dictionary and new items are added to the grocery list.
  This file and LastnameFirstname02.py must be in the same folder.
  Author: Ed Meyer
"""

# ~~~ Do not modify code beyond this point other than to uncomment the lines
# ~~~ that are related to calling your custom functions.

# Current grocery list, implemented as a dictionary to store the quantities of each item.
groceries = {
	'apple': 2,
	'banana': 2,
	'yogurt': 7,
	'milk': 1,
	'eggs': 12,
	'spam': 1,
	'cabbage': 3,
	'rice': 1,
	'bread': 1,
	'chips': 1,
	'peanut butter': 1
};

# New items to add to the grocery list.
new_items = ['banana', 'yogurt', 'bread', 'negi', 'peanut butter', 'yogurt',
             'yogurt', 'apple', 'banana', 'spam', 'ham', 'chocolate'];

# Price list for each grocery item.
prices = {
	'apple': 0.50,
	'banana': 0.39,
	'yogurt': 1.10,
	'milk': 3.5,
	'eggs': 0.42,
	'spam': 3.50,
	'cabbage': 0.69,
	'rice': 12.00,
	'bread': 4.50,
	'chips': 4.00,
	'peanut butter': 4.00,
	'negi': 2.50,
	'ham': 4.00,
	'chocolate': 2.00
};

# Display the current grocery list before adding the new items.
#print("Display current shopping list:");
displayGroceries(groceries);

print();

# Add the new items to the grocery list
#addGroceries(groceries, new_items);

# Display the updated grocery list.
#print("New shopping list:");
#displayGroceries(groceries);

print();

# Display the total amount.
#total = groceryTotal(groceries, prices);
#print("Total amount is $" + str(total));

print("Program done!");
