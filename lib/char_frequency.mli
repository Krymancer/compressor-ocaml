(** [freq_of_string s] returns a hashtable mapping each character
    in [s] to its frequency of occurrence in [s]. *)
val freq_of_string : string -> (char, int) Hashtbl.t
