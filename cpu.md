# General reference
* [Introduction - Read this first!](cpu/introduction.pdf)
* [ISA subset](cpu/isa_subset.pdf)

# Part 1: Writing ARM assembly
* Download the [VisUAL2 ARM emulator](https://github.com/tomcl/V2releases) and play around with it to get familiar with its features.
* Complete the [short problems described here](cpu/writingasm.pdf)

# Part 2: Data-instruction processing
Build, simulate, and test the following components with VHDL:

* [ALU](cpu/alu.pdf)
* [Program counter](cpu/programcounter.pdf)
* [Register file](cpu/registerfile.pdf)
* [Program ROM](cpu/programrom.pdf)
* [Immediate extension module](cpu/immextend1.pdf)
* [PC+8](cpu/add8.pdf)
* [Decoder](cpu/decoder1.pdf)

Connect these modules together within a single `top` module, using the textbook design as a reference.
You should be able to execute code which performs any of the ALU operations.

# Compiling ARM code to bits
Writing instructions in hex gets tedious real fast (although it will make a good story when you're telling your grandkids what computers were like in the old days).
A much better way is to use an assembler to convert assembly code into binary.

The official assembler is [ARM's Keil](https://www.keil.com/), but unless you already have experince with Keil you'll want to use the GNU assembler.  You can install the ARM7 version of GNU `as` on the lab virtual machine with the terminal command

    sudo apt install binutils-arm-none-eabi

Then you can run the assembler with `arm-none-eabi-as` to turn an assembly file into an executable.  The executable file is hard to use directly, but a more useful output is the "disassembly listing": a plain text file with the binary code listed along the assembly mnemonics that generated it.  To create the disassembly listing, simply run `arm-non-eabi-objdump -d`.
These commands are nicely wrapped up in [this Makefile](cpu/Makefile).

# Part 3: Adding RAM
* [Overview of adding RAM](cpu/addingmemory.pdf)
* [RAM module](cpu/ram.pdf)

# Part 4: Branches and conditional execution
* [Branches and conditional execution](cpu/branches.pdf)

# Part 5: FPGA implementation
* [Building a GPIO module](cpu/gpio.pdf) (optional, coming someday...)
* [Running on the UPduino](cpu/fpga.pdf)

# What to turn in
You should submit a single zip file containing the VHDL code for your processor, all of your testbenches, any assembly programs you've run on your processor, and a descriptive text file named `README.md`.

The README should be a [Markdown](https://commonmark.org/help/) or plain text file containing the following sections:

* **How to run your code**  Describe the steps we should take to run your code, assuming we've got a fresh copy of the lab virtual machine.  We expect to be able to simulate your complete design, so make sure to include any Makefiles, Modelsim projects, etc., that are necessary to run the simulation.

* **Description of the current status**  It is quite possible that there will be some small bugs that you aren't sure how to fix, or that you've implemented extra features we should know about.  Describe exactly what does work, any known issues, and any extra features you implemented (or tried to implement).

* **Description of your design decisions**  The second half of the project offers some flexibility as to how memory, branches, and I/O are implemented.  Explain briefly why you chose the particular implementation strategies you did.

* **FPGA test results** Some test results to demonstrate that your processor is functional on the FPGA and correctly runs the software you wrote.  A Waveforms workspace is a great option; unlike a screenshot it makes it possible to browse the captured data later.

* **Team contributions** Explain in detail what each team member contributed to the project.

Submit the zip file on `provide` as `project` (`provide es4 project YOURFILE.zip`).

If you've been using Git, you're welcome to just send me a link or add me to the repository instead of zipping everything up.

