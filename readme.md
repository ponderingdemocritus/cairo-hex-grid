## Hexagonal Grid Library

This library provides a simple and efficient implementation for working with hexagonal grids using an "odd-r" horizontal layout for flat-topped hexagons, commonly used in games and simulations.

## Features

- Creation of hexagonal grids
- Finding neighbors of a specific hex tile
- Determining whether two hex tiles are neighbors
- Supports flat-topped hexagons with an "odd-r" horizontal layout

## Hexagonal Grid Explanation

In a hexagonal grid, each hexagonal tile is associated with a coordinate (`row`, `col`). This library uses a "flat-topped" version of the hex grid with an "odd-r" horizontal layout.

This layout is beneficial for hexagonal grids as it allows for the use of integer coordinates and makes it easy to compute distances and find neighboring tiles. 

In this layout, an "East" movement maintains the `row` the same and increases the `col` by 1 if the `row` is odd, or decreases `col` by 1 if the `row` is even. This is why `{ row: 5, col: 6 }` is to the east of `{ row: 5, col: 5 }`.

Here's a visualization to help understand:

```
    (5,4)  (6,4)
 (4,5)  (5,5)  (6,5)
    (5,6)  (6,6)
```

The `(5,5)` tile is surrounded by six neighboring tiles. For example, its 'East' neighbor is `(5,6)`, and its 'West' neighbor is `(5,4)`.

## Examples

- [Simplex example](./src/example/noise.cairo)

---

### TODO:
- Support other types of hex
- More examples