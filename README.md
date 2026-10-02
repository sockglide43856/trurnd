# trurnd

**trurnd** is a lightweight random number generator written in Python and compiled into a native executable using [Cython](https://cython.org/).

It uses a Linear Congruential Generator (LCG) with a system clock seed to generate a number within a specified range.

> **Note:** trurnd is intended for general-purpose/random-number use, not cryptographic security.

## Features

- Simple CLI
- Configurable minimum and maximum values
- JSON output
- Uses system time for the seed
- Uses an LCG for number generation
- Can be compiled into a native executable
- Minimal dependencies, doesn't use secrets, system files (other then the time), or math
- Defaults to generating a random number from 0-10

## Usage
### Basic Usage
```bash
make
./bin/build
```
### Advanced usage with args
```bash
make
./bin/build [-h] [-f FROM_VAL] [-t TO]
```
