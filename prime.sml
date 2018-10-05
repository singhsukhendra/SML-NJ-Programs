exception StopError

fun error msg =
   ( print msg ; print "\n" ; raise StopError )


fun divisors n low up =
         low > up
   orelse
         (n mod low) <> 0  andalso  divisors n (low+1) up

fun prime n =
   if n <= 0 then
       error "prime: non-positive argument"
   else
       if n = 1 then
           false
       else
           divisors n 2 (floor (Math.sqrt (real n)));
           
prime(17)