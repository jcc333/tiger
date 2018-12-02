module Parse = struct
  let parse filename =
    let file = open_in filename in
    let get _ = input file in
    let lexer = Mlex.makeLexer get in
    let rec do_it () =
      let t = lexer ()
      in print t; print "\n";
	 if String.sub t 0 3 = "EOF"
         then ()
         else do_it()
    in do_it();
       Pervasives.close_in file
end
