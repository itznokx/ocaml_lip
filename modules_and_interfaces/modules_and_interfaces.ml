let (!++) v = !v+1;;

module type StackInterface =
sig

	type 'a stack

	val init_stack : 'a -> 'a stack

	val push : 'a -> 'a stack -> unit

	val pop : 'a stack -> 'a

	val show_first : 'a stack -> 'a

	val is_stack_empty : 'a stack -> bool

end;;

module Stack : StackInterface = 
struct

	type 'a stack = 'a list ref

	let init_stack (_: 'a) : 'a stack  = ref []

	let push (el: 'a) (stack: 'a stack) : unit=
		stack := el :: !stack

	let pop (stack :'a stack) : 'a =
		match !stack with
		| [] -> failwith "Empty stack"
		| h::t -> stack := t; h

	let show_first (stack :'a stack) : 'a =
		match !stack with
		| [] -> failwith "Empty stack"
		| h::t -> h
	
	let is_stack_empty (stack :'a stack) : bool =
		match !stack with
		| [] 	-> true
		| h::t 	-> false
end;;

let programa () =
	let s = Stack.init_stack 0 in
	let rec ler () =
	try
		Stack.push (read_int()) s;
		ler()
	with
	| Failure _ -> () in
	ler ();
	let count = ref 0 in
	while not (Stack.is_stack_empty s) do
		Printf.printf "%d Pop -> %d\n" !count (Stack.pop s);
		count := !++count
	done
;;

programa ();;