use inquire::Text;
use ureq::get;

fn main() {
    let banner = "
 ____  _                _
/ ___|| |__   ___  _ __| |_ ___ _ __   ___ _ __
\\___ \\| '_ \\ / _ \\| '__| __/ _ \\ '_ \\ / _ \\ '__|
 ___) | | | | (_) | |  | ||  __/ | | |  __/ |
|____/|_| |_|\\___/|_|   \\__\\___|_| |_|\\___|_|

   A simple url shortener using Rust\n";

    println!("{}", banner);

    loop {
        println!("[1] Use is.gd\n[2] Use TinyUrl\n[3] Exit");
        let choice = Text::new("Choose:").prompt().unwrap();

        match choice.as_str() {
            "1" | "2" => {
                let url = Text::new("Enter URL:").prompt().unwrap();
                let api = if choice == "1" {
                    format!("https://is.gd/create.php?format=simple&url={}", url)
                } else {
                    format!("https://tinyurl.com/api-create.php?url={}", url)
                };

                let mut res = get(&api).call().unwrap();
                let short = res.body_mut().read_to_string().unwrap();

                println!("Shortened URL: {}", short);
                break;
            }
            "3" => break,
            _ => println!("Invalid option.\n"),
        }
    }
}

