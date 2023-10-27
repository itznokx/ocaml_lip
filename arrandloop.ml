
let (!++) valor = valor.contents + 1;;
(*3 forms of initializin a array*)
let programa () =

	
(*Manual*)
let v1 = [|1;2;3;4;5;6|] in 

(*Initializing with make (size 0 -- n-1) (value 'a) *)
let v2 = Array.make 5 "teste" in

(*Initializing with init (size) (fun ->)*)
print_endline "Digite o tamanho do array: ";
let n = read_int () in
let v3 = Array.init n (fun i -> i*i) in
let v4 = Array.init n (fun i -> Printf.printf "\nDigite o v4[%d]: " i ;read_int ()) in

print_endline "\nFirst array: ";
for x = 0 to (Array.length v1)-1 do 
	begin
	Printf.printf "v1[%d] -> %d\n" x v1.(x) 
	end
done ;

print_endline "\nSecond Array:";
for y = (Array.length v2)-1 downto 0 do
	begin
	Printf.printf "v2[%d] -> %s\n" y v2.(y) ;
	end
done ;

print_endline "\nThird Array:";
Array.iteri (fun i e -> Printf.printf "v3[%d] -> %d\n" i e) v3;

let count = ref 0 in
print_endline "\nFourth Array:";
while (!count < Array.length v4) do
	Printf.printf "v4[%d] -> %d\n" !count v4.(!count); 
	count := !++count
done ;;

programa ();;