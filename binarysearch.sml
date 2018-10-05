(* Given a sorted array to implement binary search *)

open Array;

(* A[!lo..!hi] is the slice of the array A that needs to be searched 
   !mid is the value returned -- !mid = n if x is not in the array.

   Assume R is an irreflexive total order on the domain of A and 
   A is sorted according to R
*)
fun binsearch (A, x) = 
    let val n = length A;
	  val lo = ref 0 and hi = ref n;
	  val mid = ref ((!lo + !hi) div 2);
	      
    in  (* INV: ordered A /\ (forall i: 0<= i < lo: x <> A[i]) /\
	          (forall j: hi < j < n: x <> A[j]) /\ 
                0<=!lo <= !mid <= !hi <= n /\
                2*!mid <= lo+hi <= 2*!mid +1
          
           Notice that mid = lo if hi = lo or hi = lo+1  and
	   !lo <  !mid <  !hi only if !hi - !lo > 1
        *)
	  while ((!hi - !lo > 1) andalso (x <> sub (A, !mid))) do
	  (
	    if x < sub (A, !mid) then hi := !mid - 1
	    else (* sub (A, !mid) < x *) lo := !mid + 1;
	    mid := (!lo + !hi) div 2
	   );
	  (* INV /\ ((!hi - !lo <= 1) \/ (x = sub (A, !mid)) *)
          if x = sub (A, !mid) then SOME (!mid)
	  else NONE
    end;
(* try it *)

open Array;
val A = fromList [~24, ~24, ~12, ~12, 0, 0, 1, 20, 45, 123];
binsearch (A, 0);
binsearch (A, ~24);
binsearch (A, 123);
binsearch (A, 100);
binsearch (A, ~25);
binsearch (A, 124);