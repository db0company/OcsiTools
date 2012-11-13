(* ************************************************************************** *)
(* Project: Otools                                                            *)
(* Description: Some OCaml tools                                              *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/OcsiTools       *)
(* ************************************************************************** *)

type 'a result = Success of 'a | Failure of string

(* string -> bool                                                             *)
(* Check if the string is a positive number                                   *)
let is_numeric s =
  try let n = int_of_string s in
      if n >= 0 then true else false
  with _ -> false

(* int -> string                                                              *)
(* Generate a random string with the given lenght                             *)
let random_string length =
  let gen () =
    match Random.int (26 + 26 + 10) with
      | n when n < 26      -> int_of_char 'a' + n
      | n when n < 26 + 26 -> int_of_char 'A' + n - 26
      | n                  -> int_of_char '0' + n - 26 - 26 in
  let gen _ = String.make 1 (char_of_int (gen ())) in
    String.concat "" (Array.to_list (Array.init length gen))

