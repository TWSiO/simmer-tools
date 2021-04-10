module Test.CLI where

import Prelude
import Test.Spec (it, describe, Spec)
import Effect.Class (liftEffect)
import Data.Either (Either(..))
import Test.Spec.Assertions (shouldEqual)

import Simmer.Interpret as I
import Simmer.CLI (runFile)

suite :: Spec Unit
suite = describe "Tests for Main functionality" do
    simpleTests

lib :: Array I.Library
lib = []

simpleTests :: Spec Unit
simpleTests = describe "Simple Main functionality tests" do
    it "Test runFile smoke" do
       result <- liftEffect $ runFile lib "test/scripts/smoke.smr"
       result `shouldEqual` Right (I.NumberVal 7.0)
