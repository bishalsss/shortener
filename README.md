# Shortener

A minimal, high-performance CLI URL shortener written in Rust.

## Features
- Interactive menu (is.gd & TinyURL).
- Optimized for small binary size.
- Cross-platform: Works on Linux and Termux.

## Installation

```bash
git clone https://github.com/bishalsss/shortener
cd shortener
chmod +x install.sh
./install.sh
```

### Using nix

```
git clone https://github.com/bishalsss/shortener
cd shortener
nix profile install .
```

## using Docker
```bash
git clone https://github.com/bishalsss/shortener
cd Shortener
docker build -t Shortener .
docker run -it Shortener
```

## Usage
Simply type the command in your terminal:
```
shortener
```

## Dependencies
 * rust / cargo
 * inquire (input)
 * ureq (requests)
