module SemVer where

import           Control.Applicative
import           Test.Hspec
import           Text.Parser.Combinators
import           Text.Trifecta
import           Data.Char

parserNaturalNoLeadZero :: Parser Integer
parserNaturalNoLeadZero = do
  digits <- some digit
  if length digits > 1 && head digits == '0'
    then unexpected "Leading Zeros"
    else return $ read digits
