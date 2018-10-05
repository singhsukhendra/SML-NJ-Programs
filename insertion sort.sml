fun insert x [] = [x]
  | insert x (y::ys) = 
    if x < y 
    then x :: y :: ys
    else y :: (insert x ys)

fun isort [] = []
  | isort (x::xs) = 
    insert x (isort xs);


isort[4,1,9,2,0,5]
