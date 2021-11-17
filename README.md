# 17-bit-processor-with-my-own-ISA

## ISA Configuration
For this ISA, the machine code will be composed of words of 17 bits of length. What 
led to the decision of this word length is the purpose of using the memory efficiently in a 
more compact way while also keeping the controller as simple as possible. Memory 
instructions require the most bits so they decide on the minimum.

Machine code for data processing instructions:
![](docs/1.PNG)


“op” determines whether the instruction is a data processing, memory or branch 
instruction. For data processing instructions op takes the value 00. “Funct” contains the 
details for each op type. Rd , Rn and Rm are destination rtegister, first operand and second 
operand respectively. I bit determines if the addition and subtraction operations are indirect. 
I bit is invalid for other operations.

Funct section for data processing instructions:

![](docs/2.PNG)

Following table shows how the Funct section controls the operations:

![](docs/3.PNG)

