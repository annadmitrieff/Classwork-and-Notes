## Simulating a Planetary Collision using SWIFT and ffmpeg
### Installing SWIFT 
Installation procedures can be found in the [SWIFT Github](https://github.com/SWIFTSIM/SWIFT/blob/master/INSTALL.swift) as well as the [Onboarding Guide](https://swift.strw.leidenuniv.nl/onboarding.pdf).

Installing dependencies:

    $brew install autoconf automake libtool hdf5 open-mpi gsl fftw
    $brew install metis numactl gperftools tbb
    $pip install swiftsimio # needed for plotting output

Downloading SWIFT:

    $git clone https://github.com/SWIFTSIM/SWIFT.git
    $cd SWIFT
    $ls -l
    $./autogen.sh

Configuring the build as per MacOS suggestions:

    $./configure --disable-vec --enable-compiler-warnings --disable-doxygen-doc

Building SWIFT:

    $make

During configuration, I came across the error: "`configure: error: Could not find a working HDF5 library`". To amend this, I set my environment variables in my `~/.zshrc` file:
    
    export PATH="/opt/homebrew/Cellar/hdf5/1.14.3_1/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/Cellar/hdf5/1.14.3_1/lib"
    export CPPFLAGS="-I/opt/homebrew/Cellar/hdf5/1.14.3_1/include"


### Running the Example Simulation (Earth Impact):

Rebuilding SWIFT:

    $cd SWIFT
    $./configure --enable-compiler-warnings --disable-doxygen-doc --disable-hand-vec --disable-vec --with-hydro=planetary --with-equation-of-state=planetary --with-hdf5=/opt/homebrew/Cellar/hdf5/1.14.3_1/bin/h5cc
    $make

Navigating:

    $cd examples/Planetary/EarthImpact

Running the simulation:

    $./get_init_cond.sh
    $~/SWIFT/swift -s ~/SWIFT/examples/Planetary/EarthImpact/earth_impact.yml

Plotting the output:

    $python3 plot_solution.py 
    # This produced a series of .pngs which I compiled into an .mp4 using ffmpeg.

Plotting the output with ffmpeg:

    $cd /Users/anniem/SWIFT/examples/Planetary/EarthImpact 
    ffmpeg -framerate 10 -i earth_impact_%04d.png -c:v libx264 -pix_fmt yuv420p earth_impact.mp4

https://github.com/annadmitrieff/Classwork-and-Notes/assets/142821835/588ca05e-e4f0-4500-ac21-b048bcbad49d


