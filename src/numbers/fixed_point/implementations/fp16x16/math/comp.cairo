use orion::numbers::fixed_point::implementations::fp16x16::core::{
    FP16x16, FixedTrait, FP16x16Impl, FP16x16PartialOrd, FP16x16PartialEq
};

fn max(a: FP16x16, b: FP16x16) -> FP16x16 {
    if (a >= b) {
        return a;
    } else {
        return b;
    }
}

fn min(a: FP16x16, b: FP16x16) -> FP16x16 {
    if (a <= b) {
        return a;
    } else {
        return b;
    }
}

fn xor(a: FP16x16, b: FP16x16) -> bool {
    if (a == FixedTrait::new(0, false) || b == FixedTrait::new(0, false)) && (a != b) {
        return true;
    } else {
        return false;
    }
}

fn or(a: FP16x16, b: FP16x16) -> bool {
    let zero = FixedTrait::new(0, false);
    if a == zero && b == zero {
        return false;
    } else {
        return true;
    }
}

// Tests --------------------------------------------------------------------------------------------------------------

#[test]
fn test_max() {
    let a = FixedTrait::new_unscaled(1, false);
    let b = FixedTrait::new_unscaled(0, false);
    let c = FixedTrait::new_unscaled(1, true);

    assert(max(a, a) == a, 'max(a, a)');
    assert(max(a, b) == a, 'max(a, b)');
    assert(max(a, c) == a, 'max(a, c)');

    assert(max(b, a) == a, 'max(b, a)');
    assert(max(b, b) == b, 'max(b, b)');
    assert(max(b, c) == b, 'max(b, c)');

    assert(max(c, a) == a, 'max(c, a)');
    assert(max(c, b) == b, 'max(c, b)');
    assert(max(c, c) == c, 'max(c, c)');
}

#[test]
fn test_min() {
    let a = FixedTrait::new_unscaled(1, false);
    let b = FixedTrait::new_unscaled(0, false);
    let c = FixedTrait::new_unscaled(1, true);

    assert(min(a, a) == a, 'min(a, a)');
    assert(min(a, b) == b, 'min(a, b)');
    assert(min(a, c) == c, 'min(a, c)');

    assert(min(b, a) == b, 'min(b, a)');
    assert(min(b, b) == b, 'min(b, b)');
    assert(min(b, c) == c, 'min(b, c)');

    assert(min(c, a) == c, 'min(c, a)');
    assert(min(c, b) == c, 'min(c, b)');
    assert(min(c, c) == c, 'min(c, c)');
}
