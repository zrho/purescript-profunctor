module Data.Profunctor.Costar where

import Prelude

import Data.Tuple
import Data.Either
import Data.Profunctor
import Data.Traversable
import Data.Profunctor.Choice
import Data.Profunctor.Closed

-- | `Costar` turns a `Functor` into a `Profunctor`, backwards.
newtype Costar f a b = Costar (f a -> b)

-- | Unwrap a value of type `Costar f a b`.
runCostar :: forall f a b. Costar f a b -> f a -> b
runCostar (Costar f) = f

instance profunctorCostar :: (Functor f) => Profunctor (Costar f) where
  dimap f g (Costar r) = Costar (map f >>> r >>> g)

instance choiceCostar :: (Traversable f) => Choice (Costar f) where
  left (Costar r) = Costar $ either Right Left <<< map r <<< traverse (either Right Left)
  right (Costar r) = Costar $ map r <<< sequence

instance closedCostar :: (Functor f) => Closed (Costar f) where
  closed (Costar r) = Costar \fa x -> r $ map ($ x) fa
