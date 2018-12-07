module Receipts where
import Numeric
import Items
import Data.List
import Data.Ord

-- Defining the Receipt data object
data Receipt = Receipt { receiptItems::String,
                         offerItems:: String, 
                         reduceItems:: String, 
                         fullPrice:: Double, 
                         reducePrice:: Double , 
                         offerPrice:: Double, 
                         totalPrice:: Double} deriving Show

-- Convert to String with 2 decimal points
to2DC:: Double -> String
to2DC price = showFFloat (Just 2) price ""

getReceiptList:: Int -> [Item] -> String
getReceiptList _ [] = ""
getReceiptList index (x:xs) = 
    let name' = name x
        price' = (price x)
    in "+ " ++ show index ++ " " ++ name' ++ " " ++  to2DC price' ++ "\n" ++ (getReceiptList (index+1) xs)

-- Get offer Items to print
getOffers :: [Item] -> String
getOffers [] = ""
getOffers (x:xs) = 
    if length xs > 1 then
            let index' = show (index x)
                name' = name x 
                price' = to2DC (price x)
                bogof' = bogof x
                
                oriPrice = to2DC ((price x) + (price $ xs!!0))
                index'' = show (index $ xs!!0)
                name'' = name $ xs!!0
                price'' = to2DC (price $ xs!!0)
                
            in if name' == name'' && bogof' == True then "\n+ " ++ index' ++ " " ++ index'' ++" "++ oriPrice ++" " ++ price'' ++  getOffers (tail xs)
               else ""  ++  getOffers xs
    else ""

-- Get reduction items to print
getReduce :: Int -> [Item] -> String
getReduce _ [] = ""  
getReduce index (x:xs) = 
            let name' = name x
                price' = to2DC (price x)
                reduction' = to2DC (reduction x)
            in  if (reduction x) /= 0 then "+ " ++ show index ++ " " ++ price' ++ " " ++ reduction' ++"\n" ++ (getReduce (index+1) xs)
                else "" ++ (getReduce (index+1) xs)

-- Calculate full price
getFullprice :: Double -> [Item] -> Double
getFullprice fPrice [] = fPrice
getFullprice fPrice (x:xs) = 
                        let price' = price x
                        in getFullprice (fPrice + price') xs

-- Calculate offer price
getOfferPrice :: Double -> [Item] -> Double
getOfferPrice oPrice [] = oPrice
getOfferPrice oPrice (x:xs) = 
    if length xs > 1 then
        let name' = name x 
            price' = price x
            bogof' = bogof x
            name'' = name $ xs!!0
        in if name' == name'' && bogof' == True then (oPrice + price') + getOfferPrice oPrice (tail xs)
           else  getOfferPrice oPrice xs
    else oPrice

-- Calculate savings from reduction
getReducePrice :: Double -> [Item] -> Double
getReducePrice rPrice [] = rPrice
getReducePrice rPrice (x:xs) = 
                    let price' = price x
                        reduction' = reduction x
                        totalRprice = rPrice + (price' - reduction')
                    in if reduction' /= 0 then  getReducePrice totalRprice xs
                       else getReducePrice rPrice xs

-- Converting the Receipt object into String to print    
toString :: Receipt -> String
toString receipt =  
                let reduceString = if reduceItems receipt /= "" then "\n* Reduced Items\n\n" ++ reduceItems receipt
                                   else ""
                    offerString = if offerItems receipt /= "" then "\n* Offers Applied\n" ++ offerItems receipt ++ "\n"
                                  else ""
                in  "* Items Purchased\n\n" 
                    ++ receiptItems receipt
                    ++ offerString
                    ++ reduceString
                    ++"\n* Totals\n" 
                    ++"\n+ Full Price :: " ++ to2DC (fullPrice receipt)
                    ++"\n+ Savings From Offers :: " ++ to2DC (offerPrice receipt)
                    ++ "\n+ Savings From Reductions :: " ++ to2DC (reducePrice receipt)
                    ++ "\n+ Total Price :: " ++  to2DC (totalPrice receipt)

-- Indexing list of Items
indexItems :: Int -> [Item] -> [Item]
indexItems _ [] = []
indexItems i (x:xs) = [x{index= i}] ++ (indexItems (i+1) xs)

checkout :: [Item] -> Receipt
checkout itemList = 
                let receiptItem = getReceiptList 1 itemList -- List of receipt items
                    idexedItems = indexItems 1 itemList     -- list of indexed receipt items
                    sorted = sortOn name(idexedItems)       -- list of sorted and indexed receipt items
                    oItem = getOffers sorted                -- Offer items to print, String
                    rItem = getReduce 1 itemList            -- Reduction items to print , String
                    fPrice = getFullprice 0 itemList        -- Full price, Double
                    oPrice = getOfferPrice 0 sorted         -- Savings from offer, Double
                    rPrice = getReducePrice 0 itemList      -- Savings from reduction, Double
                    tPrice = fPrice - (oPrice + rPrice)     -- Total price, Double
                in Receipt {receiptItems = receiptItem,     -- Initializing new Receipt item
                            offerItems = oItem, 
                            reduceItems = rItem, 
                            fullPrice = fPrice, 
                            reducePrice = rPrice, 
                            offerPrice = oPrice, 
                            totalPrice = tPrice}
