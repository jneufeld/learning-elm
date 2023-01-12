module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )


type alias Complex =
    { a : Float
    , b : Float
    }


fromPair : ( Float, Float ) -> Complex
fromPair ( r, i ) =
    { a = r, b = i }


fromReal : Float -> Complex
fromReal r =
    { a = r, b = 0.0 }


real : Complex -> Float
real z =
    z.a


imaginary : Complex -> Float
imaginary z =
    z.b


conjugate : Complex -> Complex
conjugate z =
    { a = z.a, b = -1.0 * z.b }


abs : Complex -> Float
abs z =
    sqrt ((z.a * z.a) + (z.b * z.b))


add : Complex -> Complex -> Complex
add z1 z2 =
    { a = z1.a + z2.a, b = z1.b + z2.b }


sub : Complex -> Complex -> Complex
sub z1 z2 =
    { a = z1.a - z2.a, b = z1.b - z2.b }


mul : Complex -> Complex -> Complex
mul z1 z2 =
    let
        a_mul =
            (z1.a * z2.a) - (z1.b * z2.b)

        b_mul =
            (z1.b * z2.a) + (z1.a * z2.b)
    in
    { a = a_mul, b = b_mul }


div : Complex -> Complex -> Complex
div z1 z2 =
    let
        divisor =
            (z2.a ^ 2) + (z2.b ^ 2)

        a_div =
            ((z1.a * z2.a) + (z1.b * z2.b)) / divisor

        b_div =
            ((z1.b * z2.a) - (z1.a * z2.b)) / divisor
    in
    { a = a_div, b = b_div }


exp : Complex -> Complex
exp z =
    let
        a_exp =
            e ^ z.a * cos z.b

        b_exp =
            e ^ z.a * sin z.b
    in
    { a = a_exp, b = b_exp }
