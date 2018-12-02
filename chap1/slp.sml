type id = string

type binop = Plus | Minus | Times | Div

type stm = CompoundStm of stm * stm
	     | AssignStm of id * exp
	     | PrintStm of exp list

     and exp = IdExp of id
	     | NumExp of int
             | OpExp of exp * binop * exp
             | EseqExp of stm * exp
let prog = 
  CompoundStm(AssignStm("a",OpExp(NumExp 5, Plus, NumExp 3)),
  CompoundStm(AssignStm("b",
      EseqExp(PrintStm[IdExp"a"; OpExp(IdExp"a", Minus,NumExp 1)],
           OpExp(NumExp 10, Times, IdExp"a"))),
   PrintStm[IdExp "b"]))


type key = string
type 'a tree = Leaf | Tree of 'a tree * key * 'a * 'a tree

let empty = Leaf

let rec insert t k v =
  match t with
  | Leaf -> Tree (Leaf, k, v, Leaf)
  | Tree (l, k, _, r) -> Tree (l, k, v, r)
  | Tree (l, k', v', r) ->
     if k < k'
     then
       Tree(insert l k v, k', v', r)
     else
       Tree(l, k', v', insert r k v)

let rec lookup t k =
  match t with
  | Leaf -> None
  | Tree (l, k', v, r) ->
     if k = k' then
       Some v
     else if k < k' then
       lookup l k
     else
       lookup r k

