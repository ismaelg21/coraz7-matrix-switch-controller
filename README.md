# coraz7-matrix-switch-controller

Run the .tcl file in Vivado to access the project files of the matrix switch controller for the CoraZ7 board.

The block design contains the ZYNQ7 Processing System and 16 AXI Quad SPI IP blocks. 
The SPI pins are constrained to the inner/outer io pins of the board, additional header pins, and Pmod headers.


Once you've run .tcl script in Vivado, generate bitstream and export .xsa file to build the platform in Vitis.

The main.c contains a user interface (via SSH) to write commands to the ADGS1409 (SW_DATA register).
The user will be able to select both master and channel for the ADGS1409 four at a time. 

