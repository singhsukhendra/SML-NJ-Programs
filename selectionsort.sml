fun selectionsort [] = []
|   selectionsort (first::last) =
    let
      fun select_r small ([], output) = small::(selectionsort output)
      |   select_r small (x::xs, output) =
            if (x< small) then
              select_r x (xs, small::output)
            else
              select_r small (xs, x::output)
    in
      select_r first (last, [])
    end;
    
selectionsort[10,1,9,2,8,3,8,4,8,5]