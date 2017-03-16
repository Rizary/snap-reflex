{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}

module Main where

import Reflex
import Reflex.Dom
import qualified Data.Map as Map
import safe     (readMay)
import Data.Text (pack, unpack, Text)
import Control.Applicative ((<*>),(<$>))

main = mainWidget $ el "div" $ do
  nx <- numberInput
  d <- dropdown "*" (constDyn ops) def
  ny <- numberInput
  let values = zipDynWith (,) nx ny
      result = zipDynWith (\o (x,y) -> textToOp o <$> x <*> y) (_dropdown_value d) values
      resultText = fmap (pack . show) result
  test " = "
  dynText resultText

numberInput :: (MonadWidget t m) => m (Dynamic t (Maybe Double))
numberInput = do
  let errorState = "style" =: "border-color: red"
      validState = "style" =: "border-color: green"
  rec n <- textInput $ def & textInputConfig_inputType .~ "number"
                           & textInputConfig_initialValue .~ "0"
			   & textInputConfig_attributes .~ attrs
      let result = fmap (readMay . unpack) $ _textInput_value n
          attrs  = fmap (maybe errorState (const validState)) result
  return result

ops = Map.fromList [("+". "+"), ("-", "-"), ("*", "*"), ("/", "/")]

textToOp :: (Fractional a) => Text -> a -> a -> a
textToOp s = case s of
                    "-" -> (-)
		    "*" -> (*)
		    "/" -> (/)
		    _   -> (+)
