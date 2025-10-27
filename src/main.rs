use anyhow::Result;
use clap::{Parser, Subcommand};
mod commands;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
#[command(name = "dotctl")]
struct Dotctl {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand, Debug, Clone)]
enum Commands {
    Init,
    #[command(arg_required_else_help = true)]
    Add {
        path: String,
    },
    List,
    Backup {
        #[arg(short, long)]
        timestamped: bool,
    },
}

fn main() -> Result<()> {
    let args = Dotctl::parse();

    match args.command {
        Commands::Init => commands::init::run()?,
        Commands::Backup { timestamped } => commands::backup::run(timestamped)?,
        Commands::List => commands::list::run()?,
        Commands::Add { path } => commands::add::run(&path)?,
    }

    Ok(())
}
