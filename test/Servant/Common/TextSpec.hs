module Servant.Common.TextSpec where

import Servant.Common.Text
import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Instances ()
import Data.Int ( Int8, Int16, Int32, Int64 )
import Data.Text ( Text )
import Data.Word ( Word, Word8, Word16, Word32, Word64 )

spec :: Spec
spec = describe "Servant.Common.Text" $ do

    context "FromText and ToText laws" $ do

        it "holds for Text" $
            property $ \x -> textLaw (x :: Text)

        it "holds for String" $
            property $ \x -> textLaw (x :: String)

        it "holds for Bool" $
            property $ \x -> textLaw (x :: Bool)

        it "holds for Int" $
            property $ \x -> textLaw (x :: Int)

        it "holds for Int8" $
            property $ \x -> textLaw (x :: Int8)

        it "holds for Int16" $
            property $ \x -> textLaw (x :: Int16)

        it "holds for Int32" $
            property $ \x -> textLaw (x :: Int32)

        it "holds for Int64" $
            property $ \x -> textLaw (x :: Int64)

        it "holds for Word" $
            property $ \x -> textLaw (x :: Word)

        it "holds for Word8" $
            property $ \x -> textLaw (x :: Word8)

        it "holds for Word16" $
            property $ \x -> textLaw (x :: Word16)

        it "holds for Word32" $
            property $ \x -> textLaw (x :: Word32)

        it "holds for Word64" $
            property $ \x -> textLaw (x :: Word64)

        it "holds for Integer" $
            property $ \x -> textLaw (x :: Integer)

        it "holds for Double" $
            property $ \x -> textLaw (x :: Double)

        it "holds for Float" $
            property $ \x -> textLaw (x :: Float)

textLaw :: (FromText a, ToText a, Eq a) => a -> Bool
textLaw a = fromText (toText a) == Just a
