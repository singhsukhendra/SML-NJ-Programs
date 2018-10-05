fun merge([], ys) = ys
|	merge(xs, []) = xs
|	merge(x::xs, y::ys) =
	if x < y then
		x::merge(xs, y::ys)
	else
		y::merge(x::xs, ys);
		
fun split [] = ([],[])
|	split [a] = ([a],[])
|	split (a::b::cs) = 
		let val (M,N) =
			split cs in (a::M, b::N)
		end

fun mergesort [] = []
|	mergesort [a] = [a]
|   mergesort [a,b] =	if a <= b then
							[a,b]
						else [b,a]
|   mergesort L =
        let val (M,N) = split L
        in
          merge (mergesort M, mergesort N)
        end


val ls=[12,56,67,13,43,90,21,23,99];

mergesort(ls)