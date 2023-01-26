use "../assign00-lib.sml";

(* Please implement a function that tests whether a
given natural number is a prime:
fun isPrime(n0: int): bool *)

fun isPrime(n: int): bool =
    (* Returns true if n has no divisors
    between m and sqrt(n) inclusive *)
    val i = 2;
    if n <= 2 then 
