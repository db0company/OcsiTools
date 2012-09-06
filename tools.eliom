(* ************************************************************************** *)
(* Project: OcsiTools                                                         *)
(* Description: Various tools to make your Ocsigen code shorter               *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/OcsiTools       *)
(* ************************************************************************** *)

{shared{
open Eliom_content
open Html5
open D
}}

open Eliom_parameter

(* ************************************************************************** *)
(* Static Dir tools                                                           *)
(* ************************************************************************** *)

(* string list -> uri                                                         *)
(* Return the uri corresponding to the file using the static directory        *)
let sturi file = 
  make_uri ~service:(Eliom_service.static_dir ()) file

(* string list -> css elt                                                     *)
(* Return an element of type css (using the static dir) to put in the header  *)
let css file =
  css_link ~uri:(sturi ("css"::file)) ()

(* string list -> script                                                      *)
(* Return an element of type script (using the static dir) to put on your page*)
let script_url file =
  script
    ~a:[a_src (sturi ("js"::file))] (pcdata "")

(* ************************************************************************** *)
(* Useful services                                                            *)
(* ************************************************************************** *)

(* unit -> service                                                            *)
(* Return a service for an empty link                                         *)
let no_link () =
  Eliom_service.external_service
    ~prefix:"#"
    ~path:[]
    ~get_params:unit
    ()

(* ?(path : string list) -> ?(get_params : Eliom_parameter.params_type) ->    *)
(* ?(params : Eliom_parameter) -> string -> Eliom_content.Html5 elt -> a      *)
(* Return an external link using the url, the elt to be displayed and stuff   *)
let external_link ?(path = []) ?(get_params = unit) ?(params = ()) url elt =
  let service =
    Eliom_service.external_service
      ~prefix:url
      ~path:path
      ~get_params:get_params
      () in
  a ~service:service elt params

(* ************************************************************************** *)
(* Js Tools                                                                   *)
(* ************************************************************************** *)

{client{

(* string -> Js elt                                                           *)
(* Return the Js form of the element corresponding to the unique identifier   *)
(* The usage of this function is due to a bad design                          *)
  let get_element_by_id id =
    let of_opt e = Js.Opt.get e (fun _ -> assert false) in
    of_opt (Dom_html.document##getElementById (Js.string id))

(* string -> unit                                                             *)
(* Print a message on Javascript console (shift+ctrl+j on Google Chrome)      *)
  let debug str =
    Firebug.console##log (Js.string str)

}}

