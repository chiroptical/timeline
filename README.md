timeline
===

This is an incredibly simple library. Conceptually, it is a domain specific
version of the `Ord` typeclass. In fact, every instance of this class is
implemented the same way:

```haskell
ordToTimeRelationship :: Ordering -> TimeRelationship
ordToTimeRelationship = \case
  EQ -> TheSameAs
  LT -> InThePastOf
  GT -> InTheFutureOf

instance Timeline X where
  timeIs = ordToTimeRelationship . compare
```

## Why `timeIs`?

Let's start with `TimeRelationship`,

```haskell
data TimeRelationship
  = TheSameAs
  | InTheFutureOf
  | InThePastOf
```

Next, a typical comparison,

```haskell
expiration `timeIs` now
```

If the result is `TheSameAs`, you read,

> expiration time is the same as now

Or,

> expiration time is in the future of now

Finally,

> expiration time is in the past of now

It requires a bit of reordering, but it is the same pattern each time.

## Instances

I implemented all of the instances for the [time][time] package

[time]: https://hackage.haskell.org/package/time
