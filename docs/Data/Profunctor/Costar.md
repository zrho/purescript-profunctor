## Module Data.Profunctor.Costar

#### `Costar`

``` purescript
newtype Costar f a b
  = Costar (f a -> b)
```

`Costar` turns a `Functor` into a `Profunctor`, backwards.

##### Instances
``` purescript
instance profunctorCostar :: (Functor f) => Profunctor (Costar f)
instance choiceCostar :: (Traversable f) => Choice (Costar f)
instance closedCostar :: (Functor f) => Closed (Costar f)
```

#### `runCostar`

``` purescript
runCostar :: forall f a b. Costar f a b -> f a -> b
```

Unwrap a value of type `Costar f a b`.


