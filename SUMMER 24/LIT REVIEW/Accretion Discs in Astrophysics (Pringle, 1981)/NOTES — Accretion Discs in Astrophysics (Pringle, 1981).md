These notes are based on my understanding of the paper. Though they may be considered a general summary, they neglect a lot of the proofs and prerequisite equations explaining more specific topics and thus should not be taken as a complete summary addressing all key ideas critical to the topic.

## 1. Introduction
Accretion discs are formed around central gravitating bodies.

Energy and angular momentum extraction from particles or the accretion of gas in orbit can cause them to spiral inward.

The accretion process converts rest mass into radiation efficiently, with varying efficiency (typically more) around different celestial objects such as x-ray stars, quasars, and black holes.

## 2. Initial Developments
Gas in a potential well forms a thin disc with circular orbits due to viscosity, the opposition to flow, which redistributes angular momentum.

$$V_{\phi} = R \Omega (R) = - \dfrac{d \Phi}{d R}$$

  - $V_{\Phi} = \text{circular velocity}$
  - $\Phi(R) = \text{potential}$

Viscosity causes the gas to lose energy and sink deeper into the potential well, converting gravitational potential energy into radiation.
- The central core contains most of the mass.
- The infinite disc contains most of the angular momentum. 

## 3. Steady Discs
Steady discs have a constant inward mass flux and angular momentum distribution.

$$\nu \Sigma = \dfrac{M}{3 \pi} (1 - (\dfrac{R_*}{R})^{\dfrac{1}{2}})$$
  - $\nu = \text{kinematic velocity}$
  - $\Sigma = \text{surface density of disc}$
  - $M = \text{steady mass accretion rate}$
  - $R = \text{radial distance from central object}$
  - $R_{*} = \text{radius of the central star or the inner boundary of the disc}$

$\nu \Sigma$
  - The viscosity in the disc acts to redistribute angular momentum, allowing gas to move inward and accrete onto the central object while transferring angular momentum outward.

$\dfrac{M}{3 \pi}$
  - The mass accretion rate drives the dynamics of the accretion disc: higher values of $M$ mean more mass is flowing through the disc per unit time, leading to higher viscous interactions and thus higher angular momentum transport.

$1 - (\dfrac{R}{R_*})^{\dfrac{1}{2}}$
  - The central term describes how angular momentum transport changes with the radial distance *R*.
  - This term approaches 0 as $R$ approaches $R_{*}$, meaning that, very close to the central star, the viscous transport of angular momentum is minimal.
  - This term approaches 1 for $R \gg R_{*}$, meaning that, far from the central star. the viscous transport of angular momentum is maximal.
    - This implies that, near the inner edge of the disc, close to $R_{*}$, the material's angular momentum is almost fully transferred outward, leading to slower inward motion.
    - Further out in the disc, angular momentum transfer is more effective, allowing for faster inward motion.
- This helps predict how different regions of the disc contribute to the overall accretion process.

The luminosity of the disc is given by:
$$L_{disc} = \dfrac{GM \dot M}{2R_{*}}$$
  - $\dot M = \text{mass accretion rate}$

The steady-state viscosity is modelled using Shakura and Suunyaev's $\alpha$-parameter:
$$\nu = \alpha c_{s}H$$
  - $c_s = \text{speed of sound} = \sqrt{\dfrac{\kappa_{B}T}{\mu m_{H}}}$
- $H = \text{scale height = vertical distance over which the disc's density drops significantly}$
  
## 4. Viscosity
The nature and magnitude of viscosity in discs are uncertain. Several mechanisms are suggested:

**Turbulent viscosity** arises from chaotic eddy-like motions within the disc which act to transport angular momentum outward and allow material to move inward.
  - Despite the high Reynolds number indicating turbulent flow, there is no definitive proof that discs are turbulent.

**Magnetic viscosity** involves the transfer of angular momentum via magnetic stresses within the disc.
- A small tangled magnetic field embedded in the disc is amplified by the shear into an azimuthal component.
- Once the magnetic pressure becomes comparable to the gass pressure, the field lines bow out of the disc and reconnect in less dense regions, contributing to angular momentum transport.
- Magnetic viscosity is enhanced by magnetic reconnection in the disc's corona.

**Electron viscosity** refers to the viscosity arising from the motion of electrons in material supported by electron degeneracy pressure.
- This becomes a significant and influential form of viscosity in environments where electron degeneracy pressure is dominant, e.g. in white dwarfs' or neutron stars' degenerate matter.


**Convective motions** occur when the disc is unstable, leading to convection.
- This is liable to occur if the surface temperature is sufficiently low that there is a hydrogen or helium ionization zone within the disc.
- For discs occuring in close binary systems or quasars, convection is unlikely to be a major source of viscosity.
- In cooler accretion discs, such as those in the early solar nebula where other opacities such as dust are dominant, convection may be able to provide a major source of viscosity.

## 5. Radiation Mechanisms
Optically thick discs emit blackbody radiation, while optically thin regions emit through processes like Compton Scattering and symnotron radiation.
  - **Compton Scattering** is a process in which a photon collides with a charged particle, typically an electron, resulting in a transfer of energy and momentum between the photon and electron.

When considering saucer-shaped discs, it may be necessary to account for radiation emitted from the central region that is reabsorbed by the outer parts.

The **Two-Temperature Disc Model:**
- Inner disc regions are hot and optically-thin.
- The predominant cooler mechanism is via Compton Scattering of an abundant flux of soft photons incident from elsewhere, e.g. the outer cooler parts of the disc.

If the predominant disc viscosity is magnetic, then most dissipation takes place in less-dense regions out of the plane where field reconnection occurs more rapidly.

## 6. Time Dependence
Time-dependent accretion discs can show variability due to changes in viscosity and accretion rates.

For discs in an arbitrary potential well, the viscous time scale for a given viscosity depends on the local rate of shearing on $\Omega '$, the derivative of the angular velocity with respect to the radial distnace $r$.
- Consequently, that gas can accumulate at radii where $\Omega '$ is sufficiently small.

## 7. Instability
There are different kinds of instability present in discs.

**Thermal instability** arises when the heating rate exceeds the cooling rate.
- The Thermal Instability Condition is as follows:

$$\dfrac{d \log{Q_{+}}}{d \log{T_{c}}} > \dfrac{d \log{Q_{-}}}{d \log{T_{c}}}$$
- $Q_{+} = \text{local disc heating rate}$
- $Q_{-} = \text{local disc cooling rate}$
- $T_{c} = \text{central temperature of the disc at a given radius}$

**Viscous instability** occurs when surface density preturbations grow.
- The Viscous Instability Condition is as follows:

$$\dfrac{d{\nu \Sigma}}{d \Sigma} < 0$$

While it may always be possible to invent stable viscosity laws for any given situation, it is also possible, though unproven, that in some circumstances, a steady disc does not form.

## 8. Variability
Discs can exhibit variability on timescales ranging from the orbital period to the viscous timescale.

The shortest timescale present in the disc at a given radius is the time taken for a particle in the disc to orbit a central body.
- Although a disc can vary on the viscous timescale due to a change in boundary conditions, e.g. a variation in the accretion rate, if the disc is unsteady, we might expect the emitted radiation to vary on all timescales.

Periodic variations are challenging due to rapid shearing in the disc.
- Strong, long-lasting periodic variations in luminosity are consequently not typically obtained in discs.

## 9. Inner Boundary
The nature of the inner boundary of the disc affects the emission spectrum.

In the computation of the radiation spectrum of an accretion flow via a disc onto a star, the answer is incomplete unless some consideration is given to the spectrum of radiation from the boundary layer.

If the central star has a strong enough magnetic field, the disc flow can be disrupted at some distance from the star itself.
- Most accretion luminosity here comes from matter striking the stellar surface.

If the accretion disc is around a black hole, the motion near the inner region deviates from the simple Keplerian law.
- The disc extends to the innermost stable circular orbit.
- The angular momenta of the disc and black hole are aligned: the rotation of inertial frames close to the hole causes precession of the disc and eventual alignment.
- Significant energy release depends on the black hole's spin.

## 10. Summary
The major uncertainties in accretion disc theory are the dissipation process (viscosity) and the emission process.

Steady discs can be constructed for almost any combination of viscosity and radiation process.
