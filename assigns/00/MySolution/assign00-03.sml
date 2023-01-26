(* Please implement a function that converts a given
integer to a string that represents the integer:
fun int2str(i0: int): string *)

fun int2str(i0: int): string =
    if i0 < 10
        then String.str(Char.chr(i0+48))
    else
        int2str(i0 div 10) ^ String.str(Char.chr(((i0 mod 10) + 48)));
