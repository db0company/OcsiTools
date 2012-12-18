(* ************************************************************************** *)
(* Project: Otools                                                            *)
(* Description: Some OCaml tools                                              *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/OcsiTools       *)
(* ************************************************************************** *)

type ('a, 'b) result = Success of 'a | Failure of 'b

(* Check if the string is a positive number                                   *)
val is_numeric : string -> bool

(* Generate a random string with the given lenght                             *)
val random_string : int -> string

(* Return a list with only available datas (ignore "None")                    *)
val option_filter : ('a option) list -> 'a list
