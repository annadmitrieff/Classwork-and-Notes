## Abstract
This paper suggests analytical models for self-regulated and self-gravitating discs.

Self-regulated discs keep themselves stable by balancing heating and cooling.
- Self-regulated discs adjust their heating and cooling so that they maintain a stable state: this entails regulating the heating of gas in the disc caused by different processes such as friction between gas particles or the central star's gravitational pull, as well as cooling caused by heat radiating away into space.

Self-gravitating discs are discs where the gravity of the disc itself majorly affects the disc's behavior.
- The internal gravity of self-gravitating discs is strong enough to significantly influence the disc's motion and structure, leading to effects such as [the creation of spiral patterns](https://www.youtube.com/watch?v=hD3JqXjVd3E), or causing parts of the disc to clump and form stars and planets.

Self-regulated and self-gravitating discs naturally maintain their stability while their own gravity influences their shape and evolution.

These analytical models predict the long-term, gradual evolution of self-gravitating discs, suggesting that fragmentation occurs at radii >70AU, proposing a mechanism for producing low mass ratio binaries.

Fragmentation occurs when a disc breaks up into smaller pieces due to its own gravity. This can occur due to instability, when parts of the disc become dense and cool enough to collapse under their own gravity.
- This may cause the disc to break into clumps, eventually forming new stars or planets.

A low mass ratio binary system describes a binary system of two stars in orbit around each other, in which one star is much more massive.

## 1. Introduction
[Paczynski (1978)](https://adsabs.harvard.edu/full/1978AcA....28...91P) and [Lin & Pringle (1987)](https://github.com/annadmitrieff/Classwork-and-Notes/blob/main/SUMMER%2024/LIT%20REVIEW/Accretion%20Discs%20in%20Astrophysics%20(Pringle%2C%201981)/Accretion%20Disks%20in%20Astrophysics.pdf) were among the first to attempt describing the effects of self-gravity in accretion discs, adopting standard viscous disc theory to include self-gravity.

The idea is that self-gravity in a disc can act as a form of viscosity, aiding to transport angular momentum, allowing material to move inward and accrete onto the central object; self-gravity can create spiral patterns and other structures that effectively do the same thing.

**Self-Gravity vs. Magneto-Rotational Instability (MRI):**
- Magneto-Rotational Instability is another mechanism that can cause viscosity in discs. It involves magnetic fields and is effective in ionized, turbulent regions.
- MRI may not work well in the dense, cool, and weakly-ionized regions of early protostellar discs. In these areas, self-gravity becomes a more likely source of viscosity.

**Benefits of a Pseudo-Viscous Approach:**
- By treating self-gravity as a form of viscosity, we are able to use the established $\alpha$ accretion disc theory to model self-gravitating discs.
- Developed by [Shakura and Sunyaev (1973)](https://ui.adsabs.harvard.edu/abs/1973A%26A....24..337S/abstract), this theory uses the $\alpha$-parameter to describe the efficiency of angular momentum transport due to viscosity.
- This allows us to calculate the steady-state structure of a disc and predict how it evolves over time.
- This is particularly useful for comparing with hydrodynamical simulations and understanding different physical regimes in the disc.

**Similarities & Differences:**
- Viscous torques and self-gravitating torques both redistribute angular momentum and convert mechanical energy into heat, driving accretion flows.
- Unlike conventional viscosity, the magnitude of gravitational pseudo-viscosity is not fixed and self-adjusts to keep the disc in a state of marginal gravitational stability (where the Toomre Q parameter is around unity).

**Toomre Q Parameter:**
When the Toomre Q parameter is around unity ($Q \approx 1$), it indicates a state of marginal stability:
1. Stable (Q > 1):
   - The disc is stable against gravitational collapse. The forces due to pressure and rotation are strong enough to resist the gravitational pull trying to collapse the disc. The disc is not prone to forming dense clumps or fragments.

2. Unstable (Q < 1):
   - The disc is gravitationally unstable. The gravitational forces overcome the stabilizing effects of pressure and rotation, leading to the collapse of regions within the disc. Such instability can lead to fragmentation.

3. Marginal Stability ($Q \approx 1$):
   - The disc is in a state of marginal stability. It is on the verge of instability, meaning it can self-regulate to maintain a delicate balance. The disc may develop spiral density waves and other structures that help transport angular momentum and heat, keeping it from collapsing entirely or becoming too stable.

- In the context of self-regulating, self-gravitating discs, the disc maintains a Q parameter close to 1 through a balance of heating and cooling processes. If parts of the disc start to cool and Q drops below 1, these parts may begin to collapse and heat up, raising Q back toward 1. Conversely, if the disc heats too much and Q rises above 1, cooling processes become more effective, lowering Q.
- This self-regulation ensures the disc remains marginally stable, preventing it from either fragmenting too easily or becoming too stable and inefficient at transporting material inward.

**Need for Precise Conditions:**
- [Balbus and Papaloizou (1999)](https://adsabs.harvard.edu/pdf/2003MNRAS.339..993N) sought confirmation that the local work done by gravitational torques translates directly into local heating. They identified that energy may be transported as waves to other parts of the disc, complicating this relationship.
- Numerical simulations are key to understand the spectrum of modes excited in the disc and their pattern speeds. They help determine if energy dissipation is local or global.
- Numerical simulations can test the pseudo-viscous hypothesis by comparing the relationship between torques and energy dissipation rates in the disc.

**Historical Context & Advances:**
- [Gammie (2001)](https://ui.adsabs.harvard.edu/abs/2001ApJ...553..174G/abstract) was the first to test the relationship between torques and energy dissipation, showing that local energy dissipation often holds true.
- Both SPH and grid-based simulations have shown that the behavior of self-gravitating discs is similar to viscous discs.
- In more massive discs, higher temperatures allow waves to propagate further, leading to non-local effects. For discs with masses up to a few tenths of the central object's mass, local dissipation is usually a good approximation. 

**Advantages of the Pseudo-Viscous Approach:**
- Hydrodynamic simulations are limited by their computational expense and can only model disc evolution for a limited parameter range and timescale.
- The pseudo-viscous approach can cover a broader range of these parameters, making it more versatile for studying realistic discs.

## 2. Self-Regulated Self-Gravitating Discs
### 2.1 General Description
**Toomre Q Parameter:**
The Toomre Q parameter is a measure of the stability of a disc against gravitational collapse, given by:

$$Q = \dfrac{ c_{s} \Omega }{ \pi G \Sigma }$$

- $c_{s} = \text{sound speed}$
- $\Omega = \text{angular frequency}$
- $G = \text{gravitational constant}$
- $\Sigma = \text{surface density of disc}$

Recall that discs with $Q \approx 1$ can self-regulate their stability.
- If a region of the disc becomes too cool and dense, lowering Q, it heats up and spreads out, increasing Q.
- If a region becomes too hot, raising Q, it cools and becomes denser, decreasing Q.
- This balance is maintained by the interaction between gravitational heating (from internal torques and spiral density waves) and radiative cooling.

The disc will fragment if the cooling time is shorter than the time it takes for gravitational instabilities to grow.
- This is described by the cooling time criterion $t_{cool} < 3 \Omega^{-1}$.

### 2.2 Calculation of Disc Structure
**Self-Gravitating Disc Model**
- The model assumes that the disc is self-regulated with $Q \approx 1$ and is in local thermal equilibrium. This means the heating from gravitational dissipation is balanced by radiative cooling.
- The effects of self-gravity are modeled as a pseudo-viscous process. The gravitational torques are treated similarly to viscous stresses in a traditional accretion disc model.
- The efficiency of angular momentum transport by gravitational torques is characterized by the $\alpha$ parameter, defined as:

$$\alpha = \dfrac{ W_{R \phi}}{ P }$$
- $W_{R \phi} = \text{stress tensor component due to gravitational torques}$
- $P = \text{thermal pressure}$

- This parameter is not assumed to be constant and can vary spatially and temporally.

**Equations & Solutions:**
- The balance between heating and cooling (thermal equilibrium) is given by:
$$Q \approx 1 \implies c_{s} \propto \Sigma$$
- This helps determine the sound speed and surface density profile of the disc.

- The transport of angular momentum is governed by the viscous diffusion equation, modified to include gravitational torques:
$$\dfrac{\partial \Sigma}{\partial t} = \dfrac{1}{R} \dfrac{\partial}{\partial R} (R^{3} \nu \Sigma \dfrac{\partial \Omega}{\partial R})$$
- $\nu = \text{effective viscosity due to gravitational torques}$

### 2.3 Self-Consistency Checks
**Effective $\alpha$ Value:**
- The model checks that the effective $\alpha$ value does not exceed a critical threshold, typically $\alpha_{max} \approx 0.06$. Exceeding this value indicates that the disc might be fragmenting.
- The effective $\alpha$ value is calculated based on the balance between heating and cooling and the observed stress tensor.

**Thermal Equilibrium:**
- The model ensures that the disc is in thermal equilibrium, meaning the heating from gravitational dissipation matches the radiative cooling rate.
- If thermal equilibrium is not maintained, the model's assumptions about self-regulation are invalid.

**Dominance of Self-Gravity:**
- The model checks that self-gravity is the dominant force affecting the disc's structure and evolution, rather than external factors like external irradiation or magnetic fields.
- If external factors dominate, the model's predictions may not be accurate. 

### 2.5 Caveats
- Simplifying assumptions, such as the locality of energy dissipation and the exclusion of external influences like irradiation and magnetic fields, cause limitations and potential issues with the models.
- Analytical models need to be validated against numerical simulations.

## 3. Thermal Equilibrium Solutions
The properties of self-gravitating discs can be described under thermal equilibrium, where heating and cooling processes are balanced.

**Steady State Assumptions:**
- A steady state disc is one where the properties such as surface density ($\Sigma$), temperature (T), and accretion rate (M) do not change with time.
- In such a disc, the energy generated by accretion and gravitational processes is balanced by radiative cooling. 

**Steady State Equations:**
The profiles of $\Sigma$ and T can be derived from the balance of heating and cooling:

$$\Sigma (R) \propto \dot M^{\dfrac{2}{3}}R^{-\dfrac{3}{4}}$$
$$T(R) \propto \dot M^{\dfrac{1}{3}} R^{-\dfrac{3}{4}}
- $R = \text{radius from central star}$
- $\dot M = \text{steady state accretion rate}$

**Role of Gravitational Instabilities:**
- Gravitational instabilities such as spiral arms generate heat by redistributing angular momentum.
- The effective viscosity ($\nu$) due to gravitational torques is a crucial factor in determining the temperature profile of the disc.

**Importance of Outer Regions:**
- The outer regions of a disc are important because they can extend to large radii where self-gravity and cooling processes become dominant.
- At large radii, radiative cooling can dominate, affecting the temperature and stability of the disc.

**Fragmentation Potential:**
- The cooling timescale in the outer regions determines whether the disc will fragment. If cooling is too efficient, parts of the disc can collapse and form new stars or planets.
- There is a critical radius beyond which the disc is likely to fragment. This is typically around 70 AU for a solar-mass star.

**Analytical Models for Outer Regions:**
- The properties of the outer regions can be modeled analytically, considering dependencies on accretion rate and radius:

$$Q \approx 1 \implies c_{s} \propto R^{-\dfrac{1}{2}}$$
$$\Sigma \propto R^{-\dfrac{3}{2}}$$

- These relationships help determine the stability and fragmentation potential of the outer disc.

**Self-Regulated Discs' Paremeter Regime Classifications:**
A self-gravitating disc can exist in different states based on key parameters like surface density, temperature, and the accretion rate. These key parameters include:
- Surface Density ($\Sigma$)
- Temperature (T)
- Accretion Rate ($\dot M$)
- Cooling Timescale ($t_{cool}$)
- The Toomre Q Parameter (Q)

In a stable, self-regulated regime:
- $Q \approx 1$
- The disc maintains a balance between gravitational heating and radiative cooling.
- Spiral density waves and other gravitational instabilities contribute to angular momentum transport without leading to fragmentation.

$$Q \approx 1 \implies c_{s} \propto R^{-\dfrac{1}{2}}, \: \Sigma \propto R^{-\dfrac{3}{2}}$$
- These relationships ensure that the disc remains in thermal equilibrium and avoids fragmentation.

In an unstable, fragmenting regime:
- $Q < 1$
- The disc becomes gravitationally unstable.
- Regions within the disc collapse under their own gravity, leading to fragmentation.
- Fragmentation typically occurs if the cooling timescale is shorter than the dynamical timescale.

$$t_{cool} < 3 \Omega ^{-1}$$
- This criterion indicates that the disc cannot maintain thermal equilibrium and will fragment.

The transition between stable and unstable regimes is defined by critical values of key parameters, particularly the cooling timescale and the Toomre Q parameter.

The Fragmentation Threshold $\alpha_{max}$ is given by:
$$\alpha_{max} \approx 0.06$$
- If the effective $\alpha$ value exceeds this threshold, the disc is likely to fragment.

Recall that cooling efficiencies describe how effectively the disc can radiate away its heat.
- High Cooling Efficiency:
  - If the cooling efficiency is high, the disc radiates away its heat quickly.
  - This rapid cooling can lead to $t_{cool}<3 \Omega^{-1}$, pushing the disc into the unstable, fragmenting regime.
- Low Cooling Efficiency:
  - If the cooling efficiency is low, the disc retains its heat, supporting a stable, self-regulated state with $Q \approx 1$.

Recall that accretion rates refer to the amount of mass being added to the central object.
- High Accretion Rate:
  - A higher accretion rate provides more material and energy, helping to stablize the disc.
  - The heating from increased accretion can prevent the cooling timescale from becoming too short.
- Low Accretion Rate:
  - A lower accretion rate reduces the energy input, making it easier for the disc to cool rapidly and potentially fragment.

**Critical Parameters:**
- The efficiency of radiative cooling is a critical parameter. High cooling efficiency can lead to fragmentation, while lower efficiency supports a stable, self-regulated state.
- The accretion rate ($\dot M$) affects the disc's heating and surface density. Higher accretion rates can stabilize the disc, while lower rates can make it more prone to fragmentation.

**Analytical Solutions & Parameter Limits**
The analytical models provided help predict the behavior of self-regulated discs under different conditions, such as varying accretion rates and radii.

The following relationships implying a dependence on radius and accretion rate help map out the parameter space where the disc remains stable, versus where it becomes unstable and fragments:
$$\Sigma (R) \propto \dot M^{\dfrac{2}{3}}R^{-\dfrac{3}{4}}, \: T(R) \propto \dot M^{\dfrac{1}{3}}R^{\dfrac{3}{4}}$$

## 4. Application to Binary Star Formation
The models described above can be further applied to understand the formation of binary star systems, particularly with low mass ratios.

**Fragmentation & Binary Formation:**
- Delayed fragmentation of the disc, particularly at radii beyond 70AU, can lead to the formation of low mass ratio binaries. This delay allows for the creation of companion stars that do not grow significantly in mass.
- Gravitational instabilities in the outer regions of the disc (beyond 70AU) can lead to the collapse of gas and the formation of a secondary star.

**Mechanism for Low Mass Ratio Binaries:**
- Gravitational torques in the disc cause material to move outward, allowing the disc to expand. When the disc reaches beyond 70AU, fragmentation is more likely due to the cooling timescale being shorter at these larger radii.
- As the disc expands and fragments, it can form secondary stars that are less massive than the primary. This process ensures that these companions avoid substantial further growth, maintaining this low mass ratio.

**Comparison with Observations:**
- This model aligns with observations that show that many binary systems have low mass ratios. Traditional hydrodynamical simulations often underproduce such binaries because they do not fully account for the described delayed fragmentation process.
- Previous models tend to overestimate the mass of the secondary star, leading to higher mass ratios. The self-regulated disc model with delayed fragmentation provides a more accurate representation.

**Secular Evolution & Binary Formation:**
- The secular evolution of the disc, influenced by the balance of heating and cooling and gravitational torques, plays a crucial role in the formation of binaries. This evolution determines the timing and location of fragmentation events.
- The rate at which mass is added to the disc affects its evolution and stability. Higher mass input rates can stabilize the disc, delaying fragmentation and influencing the mass of the formed companions.

## 5. Conclusions
- A pseudo-viscous model in which gravitational torques within the disc are treated as a form of viscosity can describe the behavior of self-regulating, self-gravitating accretion discs.
- Self-regulating discs maintain a Toomre Q parameter close to unity through a balance between gravitational heating and radiative cooling. This state of marginal stability prevents the disc from becoming too unstable and fragmenting immediately.
- The model predicts that fragmentation is inevitable at radii greater than 70AU for discs around solar-mass stars. This delayed fragmentation, influenced by the outward redistribution of material due to gravitational torques, is crucial for understanding the formation of low mass ratio binaries.
- Delayed fragmentation at larger radii (beyond 70AU) ensures the creation of low mass ratio binary companions. These companions can avoid significant further growth, which would otherwise evolve them toward a unit mass ratio.
- The model's predictions align well with observational data, though traditional simulations often fail to produce these binaries in the observed numbers due to not incorporating the delayed fragmentation process.
