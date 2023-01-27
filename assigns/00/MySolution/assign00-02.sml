use "../assign00-lib.sml";

(* Please implement a function that tests whether a
given natural number is a prime:
fun isPrime(n0: int): bool *)
fun divisible(n0: int, n1: int): bool =
    if n1 < 2 then true
    else if n0 mod n1 = 0 then false
    else divisible(n0, n1-1)

fun isPrime(n0: int): bool =
    (* Returns true if n has no divisors
    between m and sqrt(n) inclusive *)
    if n0 < 2 then false
    else if n0 = 2 then true
    else let 
        val half = n0 div 2
    in
        divisible(n0, half)
    end