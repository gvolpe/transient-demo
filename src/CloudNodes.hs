module CloudNodes where

import Control.Monad.IO.Class (liftIO)
import Control.Applicative
import Transient.Base
import Transient.Move
import Transient.Move.Utils

start = do
     let numNodes = 2
     keep . runCloud $ do
        runTestNodes [2000 .. 2000 + numNodes - 1]
        nodes  <- local getNodes
        result <- (,) <$> (runAt (nodes !! 0) $ local getMyNode) <*>  (runAt (nodes !! 1) $ local getMyNode) 
        localIO $ print result
