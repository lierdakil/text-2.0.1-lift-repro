{-# LANGUAGE TemplateHaskell, RebindableSyntax #-}
{-# OPTIONS_GHC -ddump-splices #-}

module Main (main) where

import Prelude hiding (fromInteger)
import qualified Prelude
import Lib

fromInteger :: Num a => Integer -> () -> a
fromInteger x _ = Prelude.fromInteger x

main :: IO ()
main = do
  print ($broken :: Int) -- Couldn't match expected type ‘Int’ with actual type ‘() -> a0’
  print ($working :: Int) -- works fine
