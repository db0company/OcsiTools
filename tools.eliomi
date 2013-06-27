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

(* Return the uri corresponding to the file using the static directory        *)
val sturi : string list -> Eliom_content_core.Xml.uri

(* Return an element of type css (using the static dir) to put in the header  *)
val css : string list -> [> Html5_types.link ] Eliom_content_core.Html5.elt

(* Return an element of type script (using the static dir) to put on your page*)
val script_url : string list -> [> Html5_types.script ] Eliom_content.Html5.F.elt

(* ************************************************************************** *)
(* Useful services                                                            *)
(* ************************************************************************** *)

(* Return a service for an empty link                                         *)
val no_link : unit ->
  (unit, unit,
   [> `Attached of ([> `External ], [> `Get ]) Eliom_service.a_s ],
   [ `WithoutSuffix ], unit, unit,
   [< Eliom_service.registrable > `Unregistrable ], 'a)
    Eliom_service.service

(* Return an external link using the url, the elt to be displayed and stuff   *)
val external_link : ?path:Eliom_lib.Url.path ->
  ?get_params:(unit, [ `WithoutSuffix ], unit) Eliom_parameter.params_type ->
  ?params:unit -> string -> 'a Eliom_content_core.Html5.elt list ->
  [> 'a Html5_types.a ] Eliom_content_core.Html5.elt

(* ************************************************************************** *)
(* Js Tools                                                                   *)
(* ************************************************************************** *)

{client{

(* Return the Js form of the element corresponding to the unique identifier   *)
(* The usage of this function is due to a bad design                          *)
  val get_element_by_id : string -> Dom_html.element Js.t

(* Print a message on Javascript console (shift+ctrl+j on Google Chrome)      *)
  val debug : string -> unit

}}
