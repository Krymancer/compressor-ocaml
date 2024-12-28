let freq_of_string (s : string) : (char, int) Hashtbl.t =
  let table = Hashtbl.create 128 in
  String.iter (fun c ->
    let count = match Hashtbl.find_opt table c with
      | Some v -> v
      | None   -> 0
    in
    Hashtbl.replace table c (count + 1)
  ) s;
  table
