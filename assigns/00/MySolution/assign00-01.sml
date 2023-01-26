fun fact(x: int): int = if x > 0 then x * fact(x-1) else 1;
fun find(x: int) : int = fact(x) handle Overflow => 79; 
fun inc(x: int) : int = if find(x) = 79 then x else inc(x+1);
val N = inc(0);
