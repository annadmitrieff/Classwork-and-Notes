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
