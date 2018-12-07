## CS4021-FP Assessed Exercise 1: Modelling & Recursion ##

Name: Wong Hong Cheng
GUID: 2355398w
Email: 2355398W@student.gla.ac.uk

The submitted project is working according to the specifications.
Printing of: 

* Items purchased
* Reduced Items
* Offer Items
* Full Price
* price of Savings from offers
* price of Savings from Reductions
* Total Price

#### Files ####
    Main.hs 
    Receipts.hs
    Items.hs
    Readme.md

#### Main.hs ####

Contains the main method and prints the final results

#### Receipts.hs ####

Contains all the algorithms, calculations and convertion of the Receipt into a String and passed to the generateReceipt method in Main.hs.

#### Items.hs ####

Contains the mapping of the Data for all the Items that can be purchased

#### Installation ####

Install [haskell environment](https://www.haskell.org/platform/#osxrmiregistry)

#### Running ####
```
    ghci
    :l Main.hs
    main
```
or 

```
    runhaskell Main.hs
```

#### Expected output ####
```
<start>
* Items Purchased

+ 1 Apple 0.50
+ 2 Apple 0.50
+ 3 Apple 0.50
+ 4 Apple 0.50
+ 5 Apple 0.50
+ 6 Watermelon 3.00
+ 7 Sumatran Coffee Beans 6.00
+ 8 Lovage 2.59
+ 9 Cheese 3.00
+ 10 Cheese 3.00
+ 11 Cream Cheese w. Black Pepper 2.50

* Offers Applied

+ 1 2 1.00 0.50
+ 3 4 1.00 0.50
+ 9 10 6.00 3.00

* Reduced Items

+ 11 2.50 1.00

* Totals

+ Full Price :: 22.59
+ Savings From Offers :: 4.00
+ Savings From Reductions :: 1.50
+ Total Price :: 17.09
<end>
<start>
* Items Purchased

+ 1 Pork 4.00
+ 2 Chicken 4.00
+ 3 Cheese 3.00
+ 4 Mozzarella Cheese 0.99
+ 5 Apple 0.50
+ 6 Apple 0.50
+ 7 Jaffa Oranges 3.00
+ 8 Cheese 3.00

* Offers Applied

+ 5 6 1.00 0.50
+ 3 8 6.00 3.00

* Totals

+ Full Price :: 18.99
+ Savings From Offers :: 3.50
+ Savings From Reductions :: 0.00
+ Total Price :: 15.49
<end>
<start>
* Items Purchased

+ 1 Pork 4.00
+ 2 Apple 0.50
+ 3 Bananas 0.80
+ 4 Cheese 3.00
+ 5 Cheese 3.00
+ 6 Cheese 3.00

* Reduced Items

+ 1 4.00 2.00
+ 4 3.00 1.00
+ 5 3.00 1.00
+ 6 3.00 1.00

* Totals

+ Full Price :: 14.30
+ Savings From Offers :: 0.00
+ Savings From Reductions :: 8.00
+ Total Price :: 6.30
<end>
```