use hex::hex::IHexTile;
use core::array::ArrayTrait;
use integer::{U128IntoFelt252, Felt252TryIntoU64, u64_from_felt252};
use traits::{TryInto, Into};
use option::OptionTrait;
use debug::PrintTrait;

use cubit::procgen::simplex3;
use cubit::types::vec3::{Vec3, Vec3Trait};
use cubit::types::fixed::{Fixed, FixedTrait, FixedPrint, FixedImpl, ONE};

use hex::hex::{ImplHexTile};
use hex::types::{HexTile};

mod TileType {
    const WATER: u8 = 0;
    const LAND: u8 = 1;
    const HILL: u8 = 2;
    const MOUNTAIN: u8 = 3;
}

trait ITile {
    fn terrain_type(self: HexTile) -> u8;
    fn check_moveable(self: HexTile) -> bool;
}

impl ImplTile of ITile {
    fn terrain_type(self: HexTile) -> u8 {
        let simplex = simplex3::noise(
            Vec3Trait::new(
                FixedTrait::new_unscaled(self.col.into(), false),
                FixedTrait::new_unscaled(self.row.into(), false),
                FixedTrait::from_felt(0)
            )
        );

        let mag = simplex.mag;

        if mag > (ONE.try_into().unwrap() * 3 / 4) {
            TileType::MOUNTAIN
        } else if mag > (ONE.try_into().unwrap() * 2 / 4) {
            TileType::HILL
        } else if mag > (ONE.try_into().unwrap() * 1 / 4) {
            TileType::LAND
        } else {
            TileType::WATER
        }
    }
    fn check_moveable(self: HexTile) -> bool {
        self.terrain_type() != TileType::WATER
    }
}

#[test]
#[available_gas(500000000)]
fn test_gradient() {
    let mut i = 5;

    let mut tile = ImplHexTile::new(5, 5);
    tile.terrain_type().print();
    tile.col.print();
    tile.row.print();

    let neighbors = tile.neighbors();

    let mut j = 0;
    loop {
        if (j >= neighbors.len()) {
            break;
        }
        let n = *neighbors.at(j);

        n.terrain_type().print();

        n.col.print();
        n.row.print();

        j += 1;
    };

    i += 1;
}

