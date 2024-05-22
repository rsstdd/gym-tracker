use crux_core::typegen::TypeGen;
use shared::App;
use std::path::PathBuf;

fn main() -> anyhow::Result<()> {
    println!("cargo:rerun-if-changed=../shared");

    let mut gen = TypeGen::new();

    // Provide correct sample values before tracing the type.
    let sample_user = shared::User {
        id: "sample_id".to_string(),
        name: "sample_name".to_string(),
        email: "sample_email".to_string(),
    };

    let mut samples = serde_reflection::Samples::new();
    samples.insert("User", sample_user);

    gen.trace_type::<App>(&samples)?;

    let output_root = PathBuf::from("./generated");

    gen.swift("SharedTypes", output_root.join("swift"))?;
    gen.java("com.example.counter.shared_types", output_root.join("java"))?;
    gen.typescript("shared_types", output_root.join("typescript"))?;

    Ok(())
}
