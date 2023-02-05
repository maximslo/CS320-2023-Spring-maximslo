(*Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)
use "./../assign01.sml";
use "./../assign01-01.sml";
use "./../assign01-lib.sml";


fun str2int_opt(cs:string): int option = 
    if isvalid(cs,xlist_size(cs)-1) then SOME(helper(cs,xlist_size(cs)-1,xlist_size(cs))) else NONE;

fun power(x: int): int =
    if x > 1 then 10 * power(x-1) else 1;

fun convert(c: char, x: int): int =
    (ord(c)-48) * power(x);

fun helper(cs:string,count:int, size:int): int =
    if count+1 > 0 then helper(cs, count-1, size) + convert(String.sub(cs, count), size-count) else 0;

fun isvalid(cs:string,count:int): bool = 
    if (count-1)<0 then false else
    if (ord(String.sub(cs, count))-48)<0 then false else
    if (ord(String.sub(cs, count))-48)>10 then false else
    (if count<0 then true else if isvalid(cs,count-1) then true else false);