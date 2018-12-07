module Items where

data Item = Item {index::Int, name::String, price::Double, reduction::Double, bogof::Bool} deriving Show

apple = Item {index=0, name="Apple", price=0.50, reduction=0, bogof = True}
bananas = Item {index=0, name="Bananas", price=0.80, reduction=0, bogof = False}
cheese = Item {index=0, name="Cheese", price=3.00, reduction=0, bogof = True}
chicken = Item {index=0, name="Chicken", price=4.00, reduction=0, bogof = False}
creamCheesewBlackPepper = Item {index=0, name="Cream Cheese w. Black Pepper", price=2.50, reduction=0, bogof=False}
jaffaOranges = Item {index=0, name="Jaffa Oranges", price=3.00, reduction=0, bogof=False}
lovage = Item {index=0, name="Lovage", price=2.59, reduction=0, bogof=False}
mozzarellaCheese = Item {index=0, name="Mozzarella Cheese", price=0.99, reduction=0, bogof=False}
pork = Item {index=0, name="Pork", price=4.00, reduction=0, bogof=False}
sumatranCoffeeBeans = Item {index=0, name="Sumatran Coffee Beans", price=6.00, reduction=0, bogof=False}
watermelon = Item {index=0, name="Watermelon", price=3.00, reduction=0, bogof=False}
--reduced price Items
rCreamCheesewBlackPepper = Item {index=0, name="Cream Cheese w. Black Pepper", price=2.50, reduction=1.00, bogof=False}
rPork = Item {index=0, name="Pork", price=4.00, reduction=2.00, bogof=False}
rCheese = Item {index=0, name="Cheese", price=3.00, reduction=1.00, bogof=False}

fullItemsList = [apple, 
                bananas, 
                cheese, 
                chicken, 
                creamCheesewBlackPepper, 
                jaffaOranges, 
                lovage, 
                mozzarellaCheese, 
                pork, 
                sumatranCoffeeBeans, 
                watermelon,
                rCreamCheesewBlackPepper,
                rPork,
                rCheese]


