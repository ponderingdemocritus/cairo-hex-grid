## Hexagonal Grid Library

This library provides an efficient and simple implementation for working with hexagonal grids using doubled coordinates for flat-topped hexagons, commonly used in games and simulations.

## Features

- Creation of hexagonal grids
- Finding neighbors of a particular hex tile
- Determining whether two hex tiles are neighbors
- Supports flat-topped hexagons with a "doubled" coordinate system

## Hexagonal Grid Explanation

In a hexagonal grid, each hexagonal tile is associated with a coordinate (`col`, `row`). This library uses a "flat-topped" version of the hex grid with "doubled" coordinates. 

This coordinate system is helpful for hexagonal grids as it allows the use of integer coordinates, and makes it easy to compute distances and find neighboring tiles. 

In this coordinate system, an "East" movement increases the `col` by 2 and keeps the `row` the same. This is why `{ col: 7, row: 5 }` is to the east of `{ col: 5, row: 5 }`.

Here's a visualization to help understand:

```
   (4,4)  (6,4)  (8,4)
 (3,5)  (5,5)  (7,5)
   (4,6)  (6,6)  (8,6)
```

The `(5,5)` tile is surrounded by six neighboring tiles. For example, its 'East' neighbor is `(7,5)`, and its 'West' neighbor is `(3,5)`.
