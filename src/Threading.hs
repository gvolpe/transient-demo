module Threading where

import Control.Monad.IO.Class (liftIO)
import Transient.Base
import Transient.Indeterminism

start = keep $ do
    name <- input (const True) "What is your name? " :: TransIO String
    n    <- threads 2 $ choose' [1..10 ::Int] 
    liftIO $ do
        print name
        print n
