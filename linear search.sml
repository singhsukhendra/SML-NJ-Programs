local
    (* INV: 0<=i<= l = len(L) /\ forall j: 0<=j<i: a =/= L[j] *)
    fun linsearch (a, [], i) = i
      | linsearch (a, h::T, i) = if a=h then i else linsearch (a, T, i+1)

in fun search (a, L) = 
       let val l = length L 
	   val i = linsearch (a, L, 0)
       in  if i >= l then print ("not found\n")
	   else print ("found at index "^Int.toString(i)^"\n")
       end
end

val L=[34,5,67,23,67,12,89];


search(5,L)