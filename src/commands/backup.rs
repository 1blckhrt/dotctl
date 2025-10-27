use anyhow::Result;

pub fn run(timestamped: bool) -> Result<()> {
    if timestamped {
        println!("Backup with timestamp");
        // Your timestamped backup logic
    } else {
        println!("Backup without timestamp");
        // Your regular backup logic
    }
    Ok(())
}
