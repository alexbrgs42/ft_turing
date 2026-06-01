let run jsonfile input =
    (*
    1. Parsing
    - parse machine file
    - parse input that must match alphabet of given machine
    *)
    if not (Filename.check_suffix jsonfile ".json") then
        Printf.printf "ft_turing: %s: Wrong json format\n" jsonfile
    (*
    2. Implement program lol
    *)
    else
        print_endline "running"

let start =
    let argv = Sys.argv in
    let usage = "usage: ft_turing [-h] jsonfile input" in
    let help_detail = "positional arguments:
  jsonfile      json description of the machine

  input         input of the machine

optional arguments:
  -h, --help    show this help message and exit" in
    if Array.mem "-h" argv || Array.mem "--help" argv then
        print_endline (usage^"\n\n"^help_detail)
    else if Array.length argv != 3 then
        print_endline usage
    else
        run (Array.get argv 1) (Array.get argv 2)

let () = start
