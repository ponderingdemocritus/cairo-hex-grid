#[derive(Drop, Copy, Serde)]
struct HexTile {
    col: u64,
    row: u64,
}

#[derive(Drop, Copy, Serde)]
enum Direction {
    East: (),
    NorthEast: (),
    NorthWest: (),
    West: (),
    SouthWest: (),
    SouthEast: (),
}
