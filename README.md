# reflow
A simple script to copy command output to the clipboard on macOS and Linux.

## Features

- **Cross-Platform Compatibility**: Works seamlessly on both macOS and Linux systems.
- **Simple Usage**: Easily copy command outputs to your clipboard.
- **Lightweight**: Minimal dependencies for quick setup and execution.

## Installation

1. **Download the project.**
   ```bash
   git clone https://github.com/jamestcorley/reflow.git
   ```

2. **Make the install script executable.**
   ```bash
   chmod +x install.sh
   ```

3. **Run the install script.**
   ```bash
   ./install.sh
   ```

## Usage

```bash
<command> | reflow
```

## Examples

```bash
ls -l | reflow
```

```bash
cat /etc/hosts | reflow
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please fork the repository, create a new branch, and submit a pull request with your proposed changes.
