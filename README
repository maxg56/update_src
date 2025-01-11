# Update `Sources.mk` Script

This script automates the process of updating the `Sources.mk` file by scanning a source directory for `.c` files (and `.m` files on macOS) and appending their paths under a specified variable.

## Features
- Supports both Linux and macOS.
- Scans the specified source directory for `.c` (and `.m` files on macOS).
- Automatically updates or creates the variable `SRC_FILES :=` in the `Sources.mk` file.
- Uses color-coded output for better readability of errors and success messages.

## Prerequisites
Make sure the following tools are installed and accessible in your environment:
- `bash` (this script uses Bash syntax)
- `find` (to locate source files)
- `sed` (to edit the `Sources.mk` file)

## Usage
### 1. Configure Variables
The script uses the following default variables:
- `SRC_DIR` : The directory containing the source files (default: `./src`)
- `SRC_MK` : The target `Sources.mk` file (default: `Sources.mk`)
- `VAR_NAME` : The variable to update in the `Sources.mk` file (default: `SRC_FILES :=`)

### 2. Run the Script
To run the script, execute:
```bash
./update_sources.sh
```

### 3. Expected Behavior
- If the `SRC_DIR` does not exist, the script will display an error and exit.
- If no `.c` files are found in the `SRC_DIR`, the script will display an error and exit.
- If `Sources.mk` exists, the script will replace the `SRC_FILES :=` section with the updated list of source files.
- If `Sources.mk` does not exist, the script will display an error and exit.

## Example Output
- **Success Message:**
  ```
  The file 'Sources.mk' has been successfully updated.
  ```

- **Error Message:**
  ```
  Error: The source directory './src' does not exist.
  ```

## Compatibility
This script is compatible with:
- macOS
- Linux

Note: On macOS, the `sed` command uses the `-i ""` flag for in-place editing.

## Customization
You can modify the script to:
- Change the source directory (`SRC_DIR`)
- Target a different makefile (`SRC_MK`)
- Use a different variable name (`VAR_NAME`)

For example, to update a different source directory, set `SRC_DIR`:
```bash
SRC_DIR="./custom_source" ./update_sources.sh
```

## Troubleshooting
- **Issue:** `Sources.mk` is not updated.
  - Ensure the `SRC_MK` file exists in the current working directory.
  - Verify that there are `.c` files in the specified `SRC_DIR`.
- **Issue:** Error messages about missing tools.
  - Check that `find` and `sed` are installed and accessible in your shell environment.

## License
Feel free to use and adapt this script for your projects.

