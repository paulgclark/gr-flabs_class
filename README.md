# gr-flabs_class

This is a GNU Radio out-of-tree (OOT) module initially intended
for use in SDR classes hosted by [Factoria Labs](https://www.factorialabs.com/).
It contains two blocks that may be of interest for implementing
simple projects or working on reverse engineering.

Although these functionality provided by these blocks is more powerfully 
implemented using external Python scripts, I sometimes find it helpful to have 
quick access to these features in GNU Radio Companion.

## Table of Contents

1. [Installation](#installation)
    1. [CMake Process](#cmake-install)
    2. [Conda](#conda-install)
2. [Usage](#usage)
    1. [Message Print Block](#message-print)
    2. [PDU Decoder Block](#pdu-decoder)
3. [Contributing](#contributing)
4. [License](#license)

## Installation
This code supports installation via cmake or through Conda.

### Cmake Install
Use the [cmake install process](https://wiki.gnuradio.org/index.php/OutOfTreeModules)
that is standard for OOT blocks in GNU Radio:
```
cd gr-flabs_class
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
```

### Conda Install
This module also supports installation into [Conda] (https://wiki.gnuradio.org/index.php/CondaInstall)
environments. Activate your environment, then run the following (replacing "base"
with your environment name if different):
```
conda install -n base conda-build conda-forge-pinning
conda upgrade -n base conda-build conda-forge-pinning
cd gr-flabs_class
conda build .conda/recipe/ -m ${CONDA_PREFIX}/conda_build_config.yaml
conda install --use-local --force-reinstall -n base gnuradio-flabs_class
```
NOTE: Windows user must first have Visual Studio 2019 (or later) installed.

## Usage
### Message Print
This block is a minor variation on the standard 
[Message Debug](https://wiki.gnuradio.org/index.php/Message_Debug) block. It 
prints incoming PDUs containing uint8 vector data in one of three user-selectable
ways:
- as ASCII
- as hex
- as both ASCII and hex

### PDU Decoder
Performs line decoding of PDU data. The block assumes an uint8 vector of packed
bytes (each 8-bit value ranges from 0x00-0xff). It will then:
- unpack the bytes into 0s and 1s
- use the provided zero and one sequences to decode the bits
- repack the bits into bytes
- output the resulting PDU as a GNU Radio message

#### Example Decoding Properties
This block can perform Manchester decoding with:
```
zero_seq = (1, 0) 
one_seq = (0, 1) 
```
For PWM encoding with 33% duty cycle, low followed by high, use:
```
zero_seq = (0, 0, 1) 
one_seq = (0, 1, 1) 
```

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Create a new Pull Request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) 
file for details.
