mod cli;

use cli::*;

fn main() {
    let choices = print_choices();
    match make_choice(&choices) {
        Ok(program) => println!("Installing {program}..."),
        Err(e) => eprintln!("{e}"),
    };
}
