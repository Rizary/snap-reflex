{-# LANGUAGE OverloadedStrings, RecursiveDo, ScopedTypeVariables, FlexibleContexts, TypeFamilies, ConstraintKinds #-}

import Prelude hiding (mapM, mapM_, all, sequence)

import Control.Monad hiding (mapM, mapM_, forM, forM_, sequence)
import Control.Monad.Fix
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Foldable
import Data.Monoid ((<>))
import Data.Text (Text)
import qualified Data.Text as T

import GHCJS.DOM.Types (JSM)

import Reflex
import Reflex.Dom.Core
import Data.Text.Encoding (encodeUtf8)
import Debug.Trace (trace)
import Language.Javascript.JSaddle.WKWebView (run)

--------------------------------------------------------------------------------
-- View
--------------------------------------------------------------------------------

main :: IO()
main = run mainWk

mainWk :: JSM ()
mainWk = mainWidget $ el "div" $ text "Welcome to Reflex"

{-| todoMVC :: ( DomBuilder t m
           , DomBuilderSpace m ~ GhcjsDomSpace
           , MonadFix m
           , MonadHold t m
           , PostBuild t m
           )
        => m ()
todoMVC = do
  el "div" $ do -}


