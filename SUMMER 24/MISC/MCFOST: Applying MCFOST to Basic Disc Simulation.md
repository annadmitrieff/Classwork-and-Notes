## Applying MCFOST to a PHANTOM Simulation of a Black Hole Accretion Disc
### Installation
I used the [binary installation procedure](https://mcfost.readthedocs.io/en/stable/installation.html) to install MCFOST:

    wget https://github.com/cpinte/mcfost/releases/latest/download/mcfost_macOS-X64.tar.gz

...And followed the additional recommended procedures for installation: 

    mcfost -get_para -rt

## Post-Processing with MCFOST
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

Which I'm still attempting to resolve at the moment. My disc simulation (attempt 2 specified [here](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/MISC/PHANTOM%3A%20Basic%20Disc%20Simulation.md)) is still computing, so if I'm lucky that could be the only issue. 

Minor non-issue error that may seem trivial--
If experiencing the error:

    Directory ././data_th already exists : backing it up in ././data_th_old
    ERROR: Directory ././data_th_old already exists : exiting!

You just have to delete that directory (every time you attempt to re-run the `-phantom` command):

    rm -r data_th

***

### Troubleshooting 
Dr. Hall and I met over Zoom to try and troubleshoot the permissions error. We first attempted to troubleshoot issues regarding parameter files. Upon running:

    $vi disc.para

Dr. Hall identified that my parameter file was empty, and shared documentation from one of her own which I promptly pasted into my `disc.para` file:

```
#Number of photon packages
  1.28e7                  nbr_photons_eq_th  : T computation
  1.28e3          nbr_photons_lambda : SED computation
  1.28e7                  nbr_photons_image  : images computation

#Wavelength
  50  0.1 3000.0          n_lambda, lambda_min, lambda_max [mum] Do not change this line unless you know what you are doing
  T F T  compute temperature?, compute sed?, use default wavelength grid for ouput ?
  IMLup.lambda  wavelength file (if previous parameter is F)
  F T  separation of different contributions?, stokes parameters?

#Grid geometry and size
  1  1 = cylindrical, 2 = spherical, 3 = Voronoi tesselation (this is in beta, please ask Christophe)
  100 70 1 20             n_rad (log distribution), nz (or n_theta), n_az, n_rad_in

#Maps
  600 600 800.            grid (nx,ny), size [AU]
  0.  90.  4  F          RT: imin, imax, n_incl, centered ?
  0    0.   1             RT: az_min, az_max, n_az angles
  140.0  distance (pc)
  0.  disk PA

#Scattering method
  0                  0=auto, 1=grain prop, 2=cell prop
  1                  1=Mie, 2=hg (2 implies the loss of polarizarion)

#Symetries
  F                  image symmetry
  F                  central symmetry
  F                  axial symmetry (important only if N_phi > 1)

#Disk physics
  0     0.50  1.0  dust_settling (0=no settling, 1=parametric, 2=Dubrulle, 3=Fromang), exp_strat, a_strat (for parametric settling)
  F                       dust radial migration
  F    sublimate dust
  F                       hydostatic equilibrium
  F  1e-5  viscous heating, alpha_viscosity

#Number of zones : 1 zone = 1 density structure + corresponding grain properties
  1

#Density structure
  1                       zone type : 1 = disk, 2 = tappered-edge disk, 3 = envelope, 4 = debris disk, 5 = wall
  1.e-3   100.  dust mass,  gas-to-dust mass ratio
  10.  100.0  2           scale height, reference radius (AU), unused for envelope, vertical profile exponent (only for debris disk)
  0.1  0.0    300.  100.  Rin, edge, Rout, Rc (AU) Rc is only used for tappered-edge & debris disks (Rout set to 8*Rc if Rout==0)
  1.125                   flaring exponent, unused for envelope
  -0.5  0.0              surface density exponent (or -gamma for tappered-edge disk or volume density for envelope), usually < 0, -gamma_exp (or alpha_in & alpha_out for debris disk)

#Grain properties
  1  Number of species
  Mie  1 2  0.0  1.0  0.9 Grain type (Mie or DHS), N_components, mixing rule (1 = EMT or 2 = coating),  porosity, mass fraction, Vmax (for DHS)
  Draine_Si_sUV.dat  1.0  Optical indices file, volume fraction
  1                  Heating method : 1 = RE + LTE, 2 = RE + NLTE, 3 = NRE
  0.03  1000.0 3.5 100  amin, amax [mum], aexp, n_grains (log distribution)

#Molecular RT settings
  T T T 15.          lpop, laccurate_pop, LTE, profile width (km.s^-1)
  0.2  v_turb (delta)
  1  nmol
  co@xpol.dat 6           molecular data filename, level_max
  2.0 60        vmax (km.s^-1), n_speed
  T 1.e-6 abundance.fits.gz   cst molecule abundance ?, abundance, abundance file
  T  3                       ray tracing ?,  number of lines in ray-tracing
  1 2 3  transition numbers

#Star properties from Andrews et al 2009
  1 Number of stars
  3850.0 2.3 0.6 0.0 0.0 0.0  T Temp, radius (solar radius),M (solar mass),x,y,z (AU), is a blackbody?
  lte4000-3.5.NextGen.fits.gz
  0.0 2.2  fUV, slope_fUV
```
We attempted to re-run:

    ./mcfost disc.para -phantom ~/runs/phantomsims/mydisc2/disc_00002

But were still encountering the error:

    ERROR: cannot open /Users/anniem/runs/mydisc2/disc_00002

Dr. Hall theorized two causes:
- MCFOST was unable to access the dump file due to an incorrect path and MacOS security permissions
- I was testing the functionality of MCFOST on minidump files (i.e. `disc_00002`) instead of full dump files (`disc_00010`, `disc_00020`, etc.)

We first fixed the path-related issue by copying a dump file from the `~/phantomsims/runs/mydisc2` simulation directory to the directory in which we were running MCFOST:

    $cp ~/phantomsims/runs/mydisc2/disc_00002 ~/mfcost/bin

Before re-running the previous command. This did not fix the error, which identified that the issue couldn't have solely been because of the path, but because of the minidump as well. 

This was resolved by following the same procedure for a full dump file:

    $cp ~/phantomsims/runs/mydisc2/disc_00010 ~/mcfost/bin

And re-running the command (we changed from using the parameter file `disc.para` to the reference file `ref4.1.para` following updating the content of the parameter file):

    ./mcfost ref4.1.para -phantom disc_00010

This initially worked, until it didn't, yielding the error:

     Error: wl #           4  No energy

Dr. Hall checked the source code for her (older) version of MCFOST and was unable to find the error. I later did the same by installing a copy of MCFOST from source:

    $mkdir scratch 
    $cd scratch
    $git clone https://github.com/cpinte/mcfost.git
    $ls
    mcfost
    $cd mcfost
    $find . -type f -print | grep -i -s "Error: wl #"

Which yielded nothing, either. I later fully fixed the path issue:
- I changed permissions for all contents of `~/phantomsims/runs/mydisc2/` to full read/write/execute permissions.
- I made sure I was calling the correct path (`~/phantomsims/runs/mydisc2`.

This led to the following:

    $chmod -R 777 ~/phantomsims/runs/mydisc2
    $ls -lh ~/phantomsims/runs/mydisc2/
    -rwxrwxrwx  1 anniem  staff   2.4K Jun 17 14:47 Makefile
    -rwxrwxrwx  1 anniem  staff   2.4K Jun 22 00:01 disc.discparams
    -rwxrwxrwx  1 anniem  staff   3.3K Jun 22 00:01 disc.in
    -rwxrwxrwx  1 anniem  staff   2.4K Jun 22 00:01 disc.setup
    -rwxrwxrwx  1 anniem  staff   7.2M Jun 19 23:11 disc01.ev
    -rwxrwxrwx  1 anniem  staff    65M Jun 17 14:50 disc_00000
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 14:59 disc_00001
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:06 disc_00002
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:12 disc_00003
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:19 disc_00004
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:24 disc_00005
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:30 disc_00006
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:37 disc_00007
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:43 disc_00008
    -rwxrwxrwx  1 anniem  staff    15M Jun 17 15:49 disc_00009
    -rwxrwxrwx  1 anniem  staff    65M Jun 17 15:55 disc_00010

Again, I re-ran the `-phantom` command, but this time indicating a path to `disc_00010` in `~/phantomsims/runs/mydisc2/`:

    ./mcfost ref4.1.para -phantom ~/phantomsims/runs/mydisc2/disc_00010

This more or less worked in the sense that it took me to the same `wl` (wavelength) error I had been experiencing prior, after we had amended dump file accessibility issues:

    Error: wl #           4  No energy
    Exiting
    Error: wl #           7  No energy
    Exiting

Which is where any attempt at knowing how to fix this more or less went out the window. A few attempts were made:
- Making a copy of `ref4.1.para` and editing/turning off certain parameters ([as per this guide](https://gist.github.com/dmentipl/30c581e580e0dd1682708249d0fddcc6)) to see if *something* would make a difference.

```
$cp ref4.1.para ref4.1ver2.para
$vi ref4.1ver2.para

# change the number of photon packages to 10e6:
#Number of photon packages
  1.28e6                  nbr_photons_eq_th  : T computation
  1.28e3                  nbr_photons_lambda : SED computation
  1.28e6                  nbr_photons_image  : images computation

# turn off SED computation:
T F T                   compute temperature?, compute sed?, use default wavelength grid for output ?

# turn off image symmetries:
#Symetries
  F                       image symmetry
  F                       central symmetry
  F                       axial symmetry (important only if N_phi > 1)
```

- Poking around in `$MCFOST_UTILS/Lambda/IMLup.lambda` (the parameter file sourced wavelength from the wavelength file `IMLup.lambda`
- Changing the wavelength source in `ref4.1ver2.para` from `IMLup.lambda` to the copy `IMLup-2.lambda`
- Messing around with the numbers to see if modifying any would make a difference (it didn't).

```
cd $MCFOST_UTILS/Lambda
   10  ls
   11  cp IMLup.lambda IMLup-2.lambda
   12  vi IMLup-2.lambda

# delete integers that appeared in the error presented when running ~/.mcfost ref4.1ver2.para -phantom ~/phantomsims/runs/mydisc2/disc_00010
```

- Attempting to identify if the error was within `PHANTOM`...

```
$cd phantom
$find . -type f -print | grep -i -s "Error: wl #
# this also yielded no results.
```

- Or if the error could be found within the dump files themselves:

```
$splash to ascii ~/phantomsims/runs/mydisc2/disc_00100
$vi ~/phantomsims/runs/mydisc2/disc_00100.ascii

$/:wl
# yielded no results.

$/:wavelength
# yielded no results.

$/:lambda
# yielded no results
```

Ultimately, I wasn't able to identify what the issue was. As a result, Dr. Hall suggested trying to run PHANTOM and MCFOST on Sapelo2, which we're in the process of getting me access to.
