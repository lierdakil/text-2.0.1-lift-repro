{-# LANGUAGE TemplateHaskell, MagicHash, BangPatterns #-}

module Lib
    ( broken
    , working
    ) where

import Language.Haskell.TH
import GHC.Exts (Int(..))

broken :: ExpQ
broken = let i = 42 :: Int in [|i|]

working :: ExpQ
working = let !(I# i) = 42 :: Int in [|I# i|]
