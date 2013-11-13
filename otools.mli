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

(* Take an optional string and return a None if it's empty ("") or None       *)
val empty_string_to_option : string option -> string option
  | None   -> None
  | Some s -> if String.length s = 0 then None else Some s

(* Return an empty string when given a None, the string otherwise             *)
val option_string_to_option : string option -> string
