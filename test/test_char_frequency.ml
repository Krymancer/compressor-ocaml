open Alcotest

let test_small_string () =
  let s = "Hello, world!" in
  let freq_table = Compressor.Char_frequency.freq_of_string s in
  (* Check that 'l' occurs 3 times in "Hello, world!" *)
  let actual_count_l = Hashtbl.find freq_table 'l' in
  check int "Count of 'l' in 'Hello, world!'" 3 actual_count_l;
  (* Check that 'H' occurs 1 time. *)
  let actual_count_h = Hashtbl.find freq_table 'H' in
  check int "Count of 'H' in 'Hello, world!'" 1 actual_count_h

(* 
   Example of a larger test. In reality, you'd probably
   load from a file and then check the frequencies. For the sake
   of demonstration, we just create a big string artificially.
*)
let test_large_string () =
  let filename = "../data/text.txt" in 
  let input = In_channel.with_open_bin filename In_channel.input_all in
  let freq_table = Compressor.Char_frequency.freq_of_string input in

  let count_x = Hashtbl.find freq_table 'X' in
  check int "Count of 'X' in large string" 333 count_x;

  let count_t = Hashtbl.find freq_table 't' in
  check int "Count of 't' in large string" 223000 count_t

let () =
  run "Char Frequency Tests" [
    ("HardCoded", [test_case "Test harcoded list string" `Quick test_small_string]);
    ("FileTest", [test_case "Test using file" `Quick test_large_string]);
  ]
