fun fibo n =
    if n <= 2 then
      1
    
    else
      fibo(n-1)+fibo(n-2);

fun aux n =
  if n > 16 then
    ()
  else (
    print ("fibo " ^Int.toString n ^ " = " ^ Int.toString (fibo n) ^ "\n");
    aux (n + 1)
  );
aux 0;