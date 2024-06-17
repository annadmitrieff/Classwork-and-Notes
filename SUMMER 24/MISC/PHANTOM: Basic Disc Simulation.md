## Simulating a Basic Disc Using PHANTOM and Splash

I created a directory for this simulation as well as a local Makefile:

    mkdir -p ~/runs/mydisc
    cd ~/runs/mydisc

I compiled phantom and phantomsetup:

    ~/phantom/scripts/writemake.sh disc > Makefile
    make
    make setup

I set up the disc with default parameters and edited the setup file with vim:

    ./phantomsetup disc
    vi disc.setup

I re-ran phantomsetup and began the calculation:

    ./phantomsetup disc
    ./phantom disc.in

I rendered my results using splash:

    splash ~/runs/mydisc_*

Rendering with h (AU):

<img width="838" alt="Screen Shot 2024-06-16 at 9 29 02 PM" src="https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/ea4d762a-9949-412f-8701-fefe69c796d0">

Rendering with density:
<img width="838" alt="Screen Shot 2024-06-16 at 9 32 01 PM" src="https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/200f8746-59f9-40fc-bda1-6f4cd9c86aad">

I haven't come across this issue with other simulations I've run (e.g. the galaxy merger), but for some reason, PHANTOM seems to stop after the first timestep and leave me hanging with the message:

    input file disc.in written successfully.

    ---> DELETING temporary dump file disc_00000.tmp <--

  Without proceeding further. I'm unsure what to do here and am currently unable to apply MCFOST to the simulation as I need dump files from further timesteps.

    $top
    PID    COMMAND      %CPU  TIME     #TH   #WQ  #PORT MEM    PURG   CMPRS  PGRP  PPID  STATE
    25345  phantom      605.1 44:44:22 8/8   0    21    377M   0B     297M   25345 23818 running
    
    $ps auwx | grep "phantom"
    USER              PID  %CPU %MEM      VSZ    RSS  TT   STAT STARTED      TIME COMMAND
    anniem           25345 643.8  1.0 413855184  81808 s001  R+    9:27PM 2653:22.61 ./phantom disc.in
    anniem           31859   0.0  0.0 408645776   1776 s002  S+   10:43AM   0:00.01 grep phantom

(PHANTOM appears to be running, and has been for a while--I ran `./phantom disc.in` last night and left it running overnight hoping the simulation would progress, though it doesn't seem to have gotten any further).

***

## Re-Attempt: Simulating a Disk with External Potential using PHANTOM and Splash
Trying disc with different settings--seeing if it'll work this time...

    $mkdir -p ~/runs/mydisc2
    $cd ~/runs/mydisc2
    $~/phantom/scripts/writemake.sh disc > Makefile
    $make
    $make setup   
    $./phantomsetup disc
    
All settings default in disc.setup, except:
    
    # central object(s)/potential
            icentral =           0    ! use sink particles or external potential (0=potential,1=sinks)
          ipotential =           3    ! potential (1=central point mass,2=binary potential,3=spinning black hole)
          einst_prec =           T    ! include Einstein precession
                  m1 =       1.000    ! black hole mass
               accr1 =         30.    ! black hole accretion radius
              bhspin =       1.000    ! black hole spin
         bhspinangle =       0.000    ! black hole spin angle (deg)

    # options for gas accretion disc
    itapergas =           T    ! exponentially taper the outer disc profile

Rendering with Splash:

    splash ~/runs/mydisc2/disc_*

![splash_0000](https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/cc1e54eb-8c90-4899-9656-c5424f269f95)

![splash_0001](https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/ea436878-107b-4b17-bc8c-07edaaf62d8e)

![splash_0002](https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/b15e7335-1db9-4d15-bd99-17e684d8d2ec)

It works! Yay!
