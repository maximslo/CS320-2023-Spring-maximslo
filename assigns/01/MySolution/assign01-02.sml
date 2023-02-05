(*
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the Subscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)
use "./../assign01.sml";
use "./assign01-01.sml"

fun xlist_sub(xs: 'a xlist, i0: int): 'a xlist = 
if i0 >= xlist_size(xs) orelse i0 < 0 then raise XlistSubscript
else
    case xs of xlist_nil => raise XlistSubscript
    | xlist_cons(x1, xs) => if i0 = 0 then x1 else (xlist_sub(xs, i0-1))
    | xlist_snoc(xs, x1) => if i0 = xlist_size(xs) then x1 else (xlist_sub(xs, i0))
    | xlist_append(xs, ys) => if i0 < xlist_size(xs) then xlist_sub(xs, i0) else xlist(ys, i0 - xlist_size(xs, xlist_size(xs)-i0-1))
    | xlist_reverse(xs) => xlist_sub(xs, xlist_size(xs)-i0-1);

fun xlist_size(xs: 'a xlist): int = 
(
case xs of xlist_nil => 0
| xlist_cons(x1, xs) => 1 + xlist_size(xs) (**)
| xlist_snoc(xs, x1) => 1 + xlist_size(xs)
| xlist_append(xs, ys) => xlist_size(xs) + xlist_size(ys)
| xlist_reverse(xs) => xlist_size(xs)
);