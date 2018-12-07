-- file Sample.hs 
module Sample where

main :: IO ()
main = do
  let classA = [ apple, bananas ]
  let classB = [ apple, bananas, cheese]
  generateClassFund (printClassList classA)
  generateClassFund (printClassList classB)

generateClassFund :: String -> IO ()
generateClassFund r = do
  putStrLn "<start>"
  putStr r
  putStrLn "<end>"

data Item = Item {name::String, price::Double} deriving Show

apple = Item {name="Apple", price=0.5}
bananas = Item {name="Bananas", price=0.8}
cheese = Item {name="Cheese", price=3.0}
chicken = Item {name="Chicken", price=4.0}
creamCheesewBlackPepper = Item {name="Cream Cheese w. Black Pepper", price=2.5}
jaffaOranges = Item {name="JaffaOranges", price=3.0}
lovage = Item {name="Lovage", price=2.59}
mozzarellaCheese = Item {name="Mozzarella Cheese", price=0.99}
pork = Item {name="Pork", price=4.0}
sumatranCoffeeBeans = Item {name="Sumatran Coffee Beans", price=6.0}
watermelon = Item {name="Watermelon", price=3.0}

itemList :: [Item] -> String
itemList [] = ""
itemList (x:xs) = 
    let name' = name x
        price' = show (price x)
    in "Name: " ++ name' ++ "\nBalance: " ++ price' ++ "\n" ++ (itemList xs)

getBalance :: Double -> Item -> Double
getBalance total item = total + (price item)

calculateTotal :: [Item] -> Double
calculateTotal item = foldl getBalance 0 item

printClassList :: [Item] -> String
printClassList item = "Class List:\n\n" ++
                         itemList item ++ "\n" ++
                         "Total Class Funds: $" ++ show (calculateTotal item) ++ "\n"