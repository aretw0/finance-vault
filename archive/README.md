# Fiscus Archive

This directory contains legacy scripts, tools, and experiments from the `finance-vault` era (pre-2026). These files are preserved for historical reference and technical knowledge but are no longer part of the active, paved road for Fiscus project development.

## Contents

- **`src/`**: Contains legacy adapter logic (mostly PowerShell/Python or early Go experiments) that has been superseded by the new Hexagonal Architecture in the root `pkg/` and `cmd/` structure.
- **`demo1.ps1` / `demo2.ps1`**: Early demonstration scripts for the vault concepts.
- **`verify_vault/`**: Legacy verification tools and scripts used to validate the vault state before the introduction of the official CLI `check` commands.
- **`verify_pipeline.ps1`**: PowerShell pipeline verification script.

## Usage

**DO NOT USE THESE FILES IN PRODUCTION.**

Reference them only if you need to understand:

1. How a specific feature was prototyped.
2. The logic behind certain validation checks that might need to be ported to the new CLI.
