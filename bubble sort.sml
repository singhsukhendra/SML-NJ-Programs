fun bsort [] = []
|   bsort [x] = [x]
|   bsort (x::y::xs) =   
                    if(y<x) then
                        y::bsort(x::xs)
                    else
                        x::bsort(y::xs);

fun bubblesort [] = []
|   bubblesort (x::xs) = bsort(x::(bubblesort(xs)));


bubblesort[4,1,9,2,0,5]
