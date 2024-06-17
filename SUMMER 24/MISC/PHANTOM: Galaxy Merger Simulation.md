## Simulating a Galaxy Merger using PHANTOM & Splash

In order to acquaint myself with PHANTOM I elected to run an example simulation using the [given setups from the PHANTOM User Guide.](https://phantomsph.readthedocs.io/en/latest/user-guide/setups.html)

I created a new directory for this simulation in addition to a local Makefile:

    $mkdir -p ~/examplesims/galaxies
    $cd ~/examplesims/galaxies

I compiled phantom and phantomsetup:

    $~/phantom/scripts/writemake.sh galaxies > Makefile
    $make
    $make setup

I determined the preliminary parameters for the galaxy, electing for the default options and checking the setup file with vim:

    $./phantomsetup galaxies
    $vi galaxy.setup # redundant step, in this case

To set up the simulation, I ran:

    $./phantomsetup galaxies

To begin the calculations, I ran:

    $./phantom galaxies.in

To produce a video from each dump file, I used 

    $splash -r 5 ~/examplesims/galaxies/galaxies_* /mp4

https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/e614a811-4c25-41f8-aaab-bf59eb24f11c



