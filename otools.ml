(* ************************************************************************** *)
(* Project: Otools                                                            *)
(* Description: Some OCaml tools                                              *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/OcsiTools       *)
(* ************************************************************************** *)

type result = Success of 'a | Failure of string

(* string -> bool                                                             *)
(* Check if the string is a positive number                                   *)
let is_numeric s =
  try let n = int_of_string s in
      if n >= 0 then true else false
  with _ -> false

