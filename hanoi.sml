exception StopError

fun error msg =
   ( print msg ; print "\n" ; raise StopError )

local
  fun hanoiAux 0 (start,aux,arrival) = ""
    | hanoiAux n (start,aux,arrival) =
         ( hanoiAux (n-1) (start,arrival,aux))
           ^ "MOVE " ^ start ^ " " ^ arrival ^ "\n"
           ^ (hanoiAux (n-1) (aux,start,arrival) )
in
  fun hanoi n (start,aux,arrival) =
     if n < 0 then
         error "hanoi: negative number of disks"
     else
         hanoiAux n (start,aux,arrival)
end

local
  fun hanoiPrintAux 0 (start,aux,arrival) = ()
    | hanoiPrintAux n (start,aux,arrival) =
        ( hanoiPrintAux (n-1) (start,arrival,aux) ;
          print ("MOVE " ^ start ^ " " ^ arrival ^ " \n") ;
          hanoiPrintAux (n-1) (aux,start,arrival) )
in
  fun hanoiPrint n =
     if n < 0 then
         error "hanoi: negative number of disks"
     else
         hanoiPrintAux n ("A","B","C")
end;

hanoiPrint(12)

