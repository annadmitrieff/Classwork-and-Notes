## Applying MCFOST to PHANTOM
I used the [binary installation procedure](https://mcfost.readthedocs.io/en/stable/installation.html) to install MCFOST:

    wget https://github.com/cpinte/mcfost/releases/latest/download/mcfost_macOS-X64.tar.gz

...And followed the additional recommended procedures for installation: 

    mcfost -get_para -rt

Running:
    
    $./mcfost disc.para -phantom ~/runs/mydisc2/disc_00002

Yields the error:

    ERROR: cannot open disc.para

I'm not sure what's incorrect about this procedure seeing as I'm following the instructions cited in the MCFOST documentation (which I double-checked with [here](https://gist.github.com/dmentipl/30c581e580e0dd1682708249d0fddcc6)).

I ran:

    $./mcfost -get_para disc.para
    Getting MCFOST reference files: ref4.1.para  & ref4.1_multi.para  & ref4.1_3D.para 
    Done

To troubleshoot and see if I needed additional parameter files and re-attempted the process using one of the reference parameter files:

    $./mcfost red4.1_3D.para -phantom ~/runs/mydisc2/disc_00002

This appeared to work until the `phantom2mcfost setup` process:

    You are running MCFOST 4.1.04
     Git SHA = f2f7dedac660529b8e7ee1a59b56b65db3c31802
     WARNING: polarization is turned off in ray-traced SEDs
     it can be turned back on with -rt2
     Input file read successfully
     Thermal equilibrium calculation
     Temperature calculation under LTE approximation
     Parallelized code on   8 processors
  
     WARNING: PA different from zero: removing image symetry
     Mon Jun 17 16:12:34 EDT 2024
     Directory ././data_th already exists : backing it up in ././data_th_old
     Creating directory ././data_th
     Forcing 3D mode
     Using ray-tracing method 1
     Reading /Users/anniem/mcfost/utils/Dust/Draine_Si_sUV.dat
     Number of regions detected: 1
     zone 1 --> region= 1 : R=1.00 to 300.00 AU
     Performing phantom2mcfost setup
     Reading phantom density file: /Users/anniem/runs/mydisc2/disc_00002
     ---- Reading header file #           1
     ERROR: cannot open /Users/anniem/runs/mydisc2/disc_00002
     Exiting.

Which I'm still attempting to resolve at the moment. My disc simulation (attempt 2 specified [here](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/MISC/PHANTOM%3A%20Basic%20Disc%20Simulation.md)) is still computing, so if I'm lucky that could be the only issue. WIP.
