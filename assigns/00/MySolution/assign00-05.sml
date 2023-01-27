(* Please implement a function that returns the reverse of
a given string:
fun stringrev(cs: string): string *)

fun getCh(cs: string, i: int): string = 
    if i = String.size(cs) then ""
    else getCh(cs, i+1) ^ String.str(String.sub(cs, i))

fun stringrev(cs: string): string = 
    if String.size(cs) = 1 then cs
    else let
      val len = String.size(cs)
    in
      getCh(cs, 0)
    end