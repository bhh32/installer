use std::collections::BTreeMap;
use std::io::{Error, ErrorKind, stdin};
use std::str::FromStr;
use std::fmt::{self, Display, Formatter};

pub enum Programs {
    VsCode,
    Steam,
    Blender,
    Krita,
    Vlc,
    VirtManager,
    Zoom,
}

impl FromStr for Programs {
    type Err = ();
    
    fn from_str(s: &str) -> Result<Programs, ()> {
        match s {
            "VS Code" => Ok(Programs::VsCode),
            "Steam" => Ok(Programs::Steam),
            "Blender" => Ok(Programs::Blender),
            "Krita" => Ok(Programs::Krita),
            "VLC" => Ok(Programs::Vlc),
            "Virt Manager" => Ok(Programs::VirtManager),
            "Zoom" => Ok(Programs::Zoom),
            _ => Err(()),
        }
    }
}

impl Display for Programs {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        match self {
            Programs::VsCode => write!(f, "VS Code"),
            Programs::Steam => write!(f, "Steam"),
            Programs::Blender => write!(f, "Blender"),
            Programs::Krita => write!(f, "Krita"),
            Programs::Vlc => write!(f, "VLC"),
            Programs::VirtManager => write!(f, "Virt Manager"),
            Programs::Zoom => write!(f, "Zoom"),
        }
    }
}

pub fn print_choices() -> BTreeMap<i32, &'static str> {
    let mut choices: BTreeMap<i32, &str> = BTreeMap::new();
    choices.insert(1, "VS Code");
    choices.insert(2, "Steam");
    choices.insert(3, "Blender");
    choices.insert(4, "Krita");
    choices.insert(5, "VLC");
    choices.insert(6, "Virt Manager");
    choices.insert(7, "Zoom");
    
    choices.iter().for_each(|(num, choice)| {
        println!("{}.) {}", num, choice);
    });
    
    println!("Enter 'a' to install all programs");
    println!("Enter q to quit");
    
    choices
}

pub fn make_choice(choices: &BTreeMap<i32, &str>) -> Result<Programs, Error> {
    let mut user_choice = String::new();
    let mut choice: i32 = 0;
    
    loop {
        // Get the user's input
        stdin().read_line(&mut user_choice)
        .expect("error: invalid user input");
           
        // Check if the user wants to quit
        if user_choice == "q".to_string() {
            break;
        }
        
        // Check if the user chooses all
        if user_choice == "a".to_string() {
            install_all();
            break;
        }
        
        // Convert the user's choice into an
        // i32 so it can be used as the choices
        // HashMap's key
        choice = user_choice.trim()
            .parse::<i32>()
            .expect("error: user input was not a valid choice number");
        
        // Handle the instance in which a user chooses a numerical
        // choice that doesn't exist in the choice list.
        if !choices.contains_key(&choice) {
            eprintln!("error: not a valid choice\ntry again!");
        } else {
            break;
        }        
    }
    
    user_choice = String::from(choices[&choice]);
    
     match user_choice.parse::<Programs>() {
        Ok(program) => Ok(program),
        Err(_) => Err(Error::new(ErrorKind::InvalidData, "There was an issue getting your program choice."))
    }
}

fn install_all() {
    println!("You would have installed all the programs!");
}
