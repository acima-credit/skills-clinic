## What is Arel?

https://github.com/rails/arel (now part of ActiveRecord)

"A relational algebra" was created by Aaron Patterson (Tenderlove) to fix the weird stuff Activerecord was doing (string concatenation and manipulation)

Arel takes a different approach. It builds a tree of SQL nodes and then visits them when it needs to generate a query.


## What does Arel look like?

https://gist.github.com/ProGM/c6df08da14708dcc28b5ca325df37ceb

`Arel::Predications.instance_methods`

With Arel you can _probably_ create any SQL statement you need.

## Why use Arel?

1. Database indifferent
2. Composability
3. Reusability
