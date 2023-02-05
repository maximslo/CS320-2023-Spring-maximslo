(*
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'mylist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'mylist_reverse'
3. 'xs' and 'ys' use the same number of 'mylist_append'
//
*)
use "./../assign01.sml";
use "./../assign01-lib.sml";

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist = 
    let fun helper1(xs: 'a xlist): 'a xlist = 
    (
        case xs of xlist_nil => xlist_nil
        | xlist_cons(x1, xs) => xlist_cons(x1, helper1(xs))
        | xlist_snoc(xs, x1) => xlist_snoc(helper1(xs), x1)
        | xlist_append(xs, ys) => xlist_append(helper1(xs), helper1(ys))
        | xlist_reverse(xs) => helper2(xs)    
    )
    and
    helper2(xs: 'a xlist): 'a xlist =
    (
        case xs of xlist_nil => xlist_nil
        | xlist_cons(x1, xs) => xlist_snoc(helper2(xs), x1)
        | xlist_snoc(xs, x1) => xlist_cons(x1, helper1(xs))
        | xlist_append(xs, ys) => xlist_append(helper2(ys), helper2(xs))
        | xlist_reverse(xs) => helper1(xs)
    )
    in
        helper1(xs)
    end;