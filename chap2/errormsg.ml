module type ERRORMSG =
sig
    val anyErrors : bool ref
    val fileName : string ref
    val lineNum : int ref
    val linePos : int list ref
    val source_stream : in_channel ref
    val error : int -> string -> unit
    exception Error
    val impossible : string -> 'a   (* raises Error *)
    val reset : unit -> unit
end

module ErrorMsg : ERRORMSG =
struct
  open Printf
  let anyErrors = ref false
  let fileName = ref ""
  let lineNum = ref 1
  let linePos = ref [1]
  let source_stream = ref Pervasives.stdin

  let reset () = (anyErrors := false;
		 fileName := "";
		 lineNum := 1;
		 linePos := [1];
		 source_stream := Pervasives.stdin)

  exception Error

  let error pos (msg:string) =
    let rec look lst n =
      match lst with
      | a::rest ->
	 if a < pos then
           printf ":%d.%d" n (pos - a)
	 else
           look rest (n - 1)
      | _ -> printf "0.0"
      
       in anyErrors := true;
          printf "%s" !fileName;
	  look !linePos !lineNum;
	  printf ":%S\n" msg

  let impossible msg =
    Printf.printf "Error: Compiler bug: %S\n" msg;
    Pervasives.flush Pervasives.stdout;
    raise Error

end  (* structure ErrorMsg *)
  
