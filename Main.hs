module Main (main) where
import Data.List.Split
import Items
import Receipts
    
-- Main Method
main :: IO ()
main = do
    --Alice: Cream Cheese w. Black Pepper 2.5 GBP -> 1 GBP   
    let aliceOrder = [apple, apple, apple, apple, apple, watermelon, sumatranCoffeeBeans, lovage, cheese, cheese, rCreamCheesewBlackPepper]
    let aliceReceipt = toString (checkout aliceOrder)

    let bobOrder = [pork, chicken, cheese, mozzarellaCheese, apple, apple, jaffaOranges, cheese]
    let bobReceipt = toString (checkout bobOrder)
    -- Cheese reduced to 1 GBP
    let charlieOrder =[rPork, apple, bananas, rCheese, rCheese, rCheese]
    let charlieReceipt =  toString (checkout charlieOrder)

    generateReceipt aliceReceipt
    generateReceipt bobReceipt
    generateReceipt charlieReceipt


generateReceipt :: String -> IO ()
generateReceipt r = do
    putStrLn "<start>"
    putStrLn r
    putStrLn "<end>"
    
    
    