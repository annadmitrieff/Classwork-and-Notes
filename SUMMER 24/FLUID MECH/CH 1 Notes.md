#### Parameters of Flow
- $\ell$: length, or the physical size of the flow.
- $\nu$: velocity of the flow
- $\mathcal{p}$: pressure of the flow

Fluids are easily deformed:
- Molecules are spaced further than in solids, intermolecular forces are weaker, molecules have freedom of movement.
- "A substance that deforms continuously when acted on by a shearing stress (tangential force) of any magnitude."

#### Common Quantities & Units
We define *primary quantities* to be:
- $\mathcal{L}$: length
- $\mathcal{T}$: time
- $\mathcal{M}$: mass
- $\vartheta$: temperature

Consequently, we consider our *secondary quantities*:
- $\mathcal{L}^2$: area
- $\dfrac{\mathcal{T}}{\mathcal{T}}$: velocity
- $\dfrac{\mathcal{M}}{\mathcal{L}^3}$: density

${\color{skyblue}\text{Volume Rate of Flow Through an Orfice:}}$

${\color{skyblue}Q = 0.61A \sqrt{2gh}}$

${\color{skyblue}\text{A = area, h = height of liquid above orfice, g=}9.81\dfrac{m}{s^2}}$

#### Measures of Fluid Mass & Weight
- **density ($\rho$):** mass per unit volume ($\dfrac{kg}{m^3}$)
- **specific volume ($\mathcal{v}$):** volume per unit mass ($\dfrac{m^3}{kg} = \dfrac{1}{\rho}$)
- **specific weight ($\gamma$):** weight per unit volume ($\dfrac{N}{m^3}= = \rho \mathcal{g} = \gamma$)
- **specific gravity (SG):** the ratio of the density of a fluid to the density of water at some specified temperature, typically $4 ^{\circ}C$

${\color{skyblue}SG = \dfrac{\text{fluid's density}}{\text{water's density at } 4^{\circ}C} = \dfrac{\rho}{\rho_{H_{2}O@4^{\circ}C}}}$

In comparison to fluids, gases are much more compressible. Recall the ${\color{skyblue}\text{Ideal Gas Law}}$:

${\color{skyblue} \rho = \text{density} = \dfrac{\text{abs. pressure}}{\text{gas cnst.} \cdot \text{abs. temperature}} = \dfrac{p}{RT}}$

- **pressure ($\mathcal{p_{fluid}}$):** normal force per unit area exerted on a plane surface immersed in a fluid.
  - created by the bombardment of the surface with the fluid molecules.
  - defined as $\dfrac{N}{m^3} \rightarrow pascals$
- **absolute pressure:** measured relative to absolute zero pressure.
- **gage pressure:** measured with respect to local atmospheric pressure.

- **Weight of Air $(\mathcal{W})$:** $\color{skyblue} \mathcal{W} = \rho \cdot g \cdot V = \text{abs. pressure} \times \text{acc. of grav.} \times \text{volume}$

- **viscosity ($\mu$):** describes the 'fluidity' of a fluid.

![viscosity](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/FLUID%20MECH/MISC/viscosity.png)

$\mathcal{U}$ = continuous velocity of upper plate

$\vec{\mathcal{P}}$: force applied to upper plate

- $\vec{\mathcal{P}}$ (force) also governs $\mathcal{u} \rightarrow \delta \beta$

$\mathcal{u}$: velocity of fluid btwn. plates

- $\mathcal{u} = \mathcal{u}(\mathcal{y})$, where $\mathcal{y}$ describes the fluid's distance from the surface.

$\delta \beta$: angle created by rotating $\bar{AB}$ to $\bar{AB'}$.

${\color{skyblue} \delta \beta = \dfrac{\mathcal{U} \delta t}{b} \text{for a small increment of time }\delta t}$

${\color{skyblue} \text{rate of shearing strain} = \gamma = lim_{\delta t \rightarrow 0} \dfrac{\delta \beta}{\delta t}}$

- note that the shearing *stress* $\tau$ is directly proportional to $\gamma$ as it is proportional to $\mathcal{P}$:

$\color{skyblue} \tau = \dfrac{\mathcal{P}}{\mathcal{A}} \rightarrow \tau \propto \gamma$ and
$\color{skyblue} \mu \dfrac{du}{dy}$
- where $\mu$ is the absolute/dynamic viscosity of the fluid.
- $\mu$ depends on the particular fluid and is largely contingent on temperature.

viscosity is measured in $\dfrac{N \cdot s}{m^2}$
- sensitive to temperature, but only mildly to pressure.
- the effect of temperature on viscosity can be approximated using two empirical formulas:

$\color{skyblue} \text{The Sutherland Equation (for gases):}$

$\color{skyblue} \mu = \dfrac{CT^{3/2}}{T+S}$

$\color{skyblue} \text{C, S are empirical constants, T is absolute temperature}$

$\color{skyblue} \text{Andrade's Equation (for liquids):}$

$\color{skyblue} \mu = De^{\dfrac{B}{T}}$

$\color{skyblue} \text{D, B are empirical constants, T is absolute temperature}$

#### Kinds of Fluids

**Newtonian Fluids:**
- fluids for which shearing stress is linearly related to the rate of shearing stress.

**Non-Newtonian Fluids:**
- fluids for which shearing stress is not linearly related to shearing strain.
  -   shear thickening fluids, such as water-cornstarch slurries, quicksand
  -   bingham plastics, such as toothpaste or mayonnaise.

 $\color{skyblue} \text{Reynolds Number (dimensionless combination of variables):}$
 
 $\color{skyblue} Re = \dfrac{\rho \mathcal{VD}}{\mu}$
 
 $\color{skyblue} \rho \text{= fluid density, }V \text{= mean }\vec{v}, \text{ D = pipe diameter, }\mu = \text{ viscosity}$

 We describe the velocity distribution for the flow of *Newtonian Fluids* between 2 wide, parallel plates as follows:

 $\color{skyblue} u = \dfrac{3V}{2}[1 - \dfrac{y}{h}^2]$ 

  $\color{skyblue} \text{V = mean velocity, y = 1/2 of total pipe height, h = specific y relative to midpoint of height}$

![cross section](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/FLUID%20MECH/MISC/cross%20section.png)

 We describe the kinematic velocity as follows:

 $\color{skyblue} \nu = \dfrac{\mu}{\rho} m^2/s$

 #### Compressibility of Fluids

**Bulk Modulus:**
- describes how compressible a fluid is.

$\color{skyblue} E_{v} = - \dfrac{dp}{d \forall / \forall} = \dfrac{dp}{d \rho / \rho}$

$\color{skyblue} dp \text{ = differential change in pressure needed to make a diff. change in volume, }d\forall, \text{ of a volume, }\forall$.

- usually, liquids can be treated as incompressible fluids.
- note that disturbances introduced at some point in the fluid propagate at a finite velocity.
- the velocity at which small disturbances propagate is called the acoustic velocity, or the speed of sound, C:

$\color{skyblue} \text{Acoustic Velocity:}$
$\color{skyblue} c = \sqrt{\dfrac{dp}{d\rho}} = \sqrt{\dfrac{E_{v}}{\rho}}$

For gases undergoing an isentropic process, $\color{skyblue} E_v kp$ so that:

$\color{skyblue} \sqrt{\dfrac{kp}{\rho}} = \sqrt{kRT}$

- when gases are compressed (or expanded) the relationship between pressure and density depends on the nature of the process.

$\color{skyblue} \text{Isothermal Process (Compression and Expansion under Constant Temperature Conditions):}$

$\color{skyblue} \dfrac{p}{\rho} = \text{constant}$

$\color{skyblue} \text{Isentropic Process (Compression and Expansion is Frictionless, No Heat Exchanged w/ Surroundings):}$

$\color{skyblue} \dfrac{p}{\rho ^k} = \text{constant}$
$\color{skyblue} \text{k = ratio of the specific heat at a constant pressure, }c_p, \text{ to the specific heat at a constant volume, }c_v \rightarrow k = \dfrac{c_p}{c_v}$

The two specific heats are related to the gas constant R:

$\color{skyblue} R = c_p - c_v$

The bulk modulus for gases can thus be determined by obtaining the derivative $\dfrac{dp}{d\rho}$ from one of the prior equations (Isothermal or Isentropic) and substituting those results into the bulk modulus formula given prior.

$\color{skyblue} \therefore \text{for an Isothermal Process:}$

$\color{skyblue} E_v = p$

$\color{skyblue} \therefore \text{for an Isentropic Process:}$

$\color{skyblue} E_v = kp$

Note that in both cases, the bulk modulus varies directly with pressure.

#### Additional Properties

**Vapor Pressure ($P_v$):**
- *boiling* takes place when the absolute pressure is equal to the vapor pressure.
- *cavitation* describes the formation and subsequent collapse of vapor bubbles in a flowing fluid.

![vapor pressure](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/FLUID%20MECH/MISC/Screen%20Shot%202024-05-03%20at%2011.30.45%20AM.png)

**Surface Tension:**
- intensity of the molecular attraction per unit length along any line in the surface.
- designated by $\sigma$.
- depends on temperature and the other fluid it is in contact with at the interface.

![surface tension](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/FLUID%20MECH/MISC/surface%20tension.png)
*figure: pressure inside a drop of fluid*

$\color{skyblue} \text{Force Developed Around the Edge Due to Surface Tension:}$

$\color{skyblue} 2 \pi R \sigma$

$\color{skyblue} \therefore 2 \pi R \sigma = \delta p \pi R^2$ and $\color{skyblue} \delta p = p_i - p_e = \dfrac{2 \sigma}{R}$

$\color{skyblue} \text{where }\delta p \text{ is the pressure difference, }p_i \text{ is the internal pressure, and }p_e \text{ is the external pressure.}$

$\color{skyblue} \text{Vertical Force due to Surface Tension in a Tube:}$

$\color{skyblue} 2 \pi R \sigma cos(\theta)$

$\color{skyblue} \theta = \text{angle of contact, }R = \text{tube radius}$

$\color{skyblue} text{Weight } (\gamma):$

$\color{skyblue} \gamma \pi R^2 h$

These forces must balance:

$\color{skyblue} 2 \pi R \sigma cos(\theta) = \gamma \pi R^2 h$

$\color{skyblue} \therefore \text{capillary size in a tube} = h = \dfrac{2 \sigma cos(\theta)}{\gamma R}$

- note that the angle of contact $\theta$ is both a function of the liquid and the surface.

![capillary action](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/FLUID%20MECH/MISC/capillary%20action.png)
