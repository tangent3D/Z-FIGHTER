### Z-Fighter GFX Benchmark Program
Turns screen black to indicate being in progress.  
Calls each functions many times between beeps.  
Turns screen white to indicate completion.  

Time Between Beeps
| Function | 2021-09-02<br>all c | 2021-09-16<br>block() now asm |
| -------- | ------------------- | ----------------------------- |
| cls | 4.1s | " |
| point | 4.2s | " |
| lineFrom lineTo | 4.8s | " |
| rect | 3.8s | " |
| sprite | 4.3s | " |
| spriteTransparent | 4.5s | " |
| block | 3.7s | 1.5s |
