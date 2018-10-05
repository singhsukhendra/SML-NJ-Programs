fun split [] = ([],[])
|	split [a] = ([a],[])
|	split (a::b::cs) = 
		let val (M,N) =
			split cs in (a::M, b::N)
		end

fun quicksort nil = nil
|	quicksort (pivot :: rest) =
		let
			fun split(nil) = (nil,nil)
			|	split(x :: xs) =
			let
				val (below, above) = split(xs)
			in
				if x < pivot then
					(x :: below, above) 
                else
					(below, x :: above)
			end;
			val (below, above) = split(rest)
		in
			quicksort below @ [pivot] @ quicksort above
		end
		
val ls=[12,56,67,13,43,90,21,23,99];

quicksort(ls)