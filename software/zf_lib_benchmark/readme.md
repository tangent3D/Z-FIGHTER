### Z-Fighter GFX Benchmark Program
Turns screen black to indicate being in progress.  
Calls each functions many times between beeps.  
Turns screen white to indicate completion.  
| Function | 2021-09-02<br>all c | 2021-09-16<br>block() now asm | 2023-04-08 | 2023-04-09<br>cls() now asm |
| -------- | ------------------- | ----------------------------- | ---------- | --------------------------- |
| cls | 4.1s | " | 6.1s | 2.8s |
| point | 4.2s | " | 4.7s | " |
| lineFrom lineTo | 4.8s | " | 5.0s | " |
| rect | 3.8s | " | 5.6s | " |
| sprite | 4.3s | " | 6.2s | " |
| spriteTransparent | 4.5s | " | 6.7s | " |
| block | 3.7s | 1.5s | 1.8s | " |
