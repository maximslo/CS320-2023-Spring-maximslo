(* Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x *)

use "../assign00-lib.sml";

fun power(x: int): int =
    if x > 1 then 10 * power(x-1) else 1;

fun convert(c: char, x: int): int =
    (ord(c)-48) * power(x);

fun str2int1(cs: string, x: int): int =
    if x > 0 then convert(String.sub(cs, size(cs)-x), x) + str2int1(cs, x-1) else 0;

fun str2int(cs: string): int = 
    str2int1(cs, size(cs));
