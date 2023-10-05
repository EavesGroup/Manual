---
layout: page-fullwidth
title:  "Microcanonical Ensemble"
categories:
    - theory
    - SM
    - SM_Ensemble
tags:
    - theory
    - ensemble
    - page
header: no
breadcrumb: true
---

{% include mathjax.html %}

As seen in the onboarding example, consider one point particle with constant total energy, E, somewhere in a container of constant volume, V. When it reaches a container wall, the particle will elastically collide, also known as specular reflection. We know the kinetic energy of this particle but we are ignorant to where it sits and in which direction it is moving. 

There are many possible states -- sets of position and momentum data -- this particle can be in which agree with our observations. In classical dynamics, we say that these states constrained by our observables constitute a surface in the space of all possible states, called phase space. In statistical mechanics, we call these states microstates and the collection of observables the macroscopic state, or macrostate.

If we then put a probabilistic spin on this problem by assuming that the particle is equally likely to be in any of these accessible (phase space surface) microstates, we can begin to answer probabilistic questions such as "how likely is it that the particle is in the left half of the container?" This is a silly question because the statement includes the answer, but more difficult questions are tackled using this same principle. 

As a brief aside, this assumption is called the ``postulate of a priori equal probabilities''. It defines the probability distribution at a point $$\Gamma$$ in phase space as

$$ p_{NVE}(\Gamma) = \frac{\delta(H(\Gamma) - E)}{\int \delta(H(\Gamma) - E)\ d\Gamma} $$

where the denominator is often called $$\Omega$$. Whether or not this postulate is appropriate in our classical system is discussed in the classical mechanics pages and in the onboarding example. The NVE label on the distribution is a reminder that the phase space surface we are constrained to actually also depends on the number of particles and the volume being held constant. This specific distribution accounts for all realizations of the system consistent with the $$(N,V,E)$$ macrostate, and the collection of all of these realizations is called the microcanonical ensemble.

In Bayesian statistics, we would say this postulate corresponds to the construction of a flat prior distribution, and the specific phrase "a priori" typically means deducible without experience, often from system symmetries. For one possible justification of this prior: The time needed to conduct a macroscopic measurement on an observable, $$f(\cdot)$$, of a system is far longer than typical microscopic timescales. If long-time averages on a specific orbit of the ensemble, $$\gamma(t)$$, is equal to an ensemble average, 

\[ \lim_{T\rightarrow\infty} 
\frac{1}{T}\int_0^T f(\gamma(t)) dt = \int f(\Gamma) p_{NVE}(\Gamma)d\Gamma \]

we can take $$f$$ to be an indicator, or step, function which turns on in a region of interest, R, and off everywhere else. Then, the equality becomes

\[ \tau_R = \int_R p_{NVE}(\Gamma)d\Gamma \]

for $$\tau_R$$ the proportion of time our propagating orbit spent in R. The microcanonical ensemble is valid when the time a system spends in a region of phase space scales with the volume of that region.

\[ p_{NVE}(\Gamma = R) = \operatorname{const.} \implies \tau_R = \operatorname{const.}\int_{\Gamma = R} d\Gamma \]

Dynamical systems theorists define this as an ergodic system and put a great deal of effort into proving when single trajectories can sample all of accessible phase space uniformly. Ergodicity also provides another key insight: Simulation of a single copy of the system over long times will equal the ensemble average.

Finding the escape rate in the onboarding question means determining $$k_{\operatorname{esc}}(t)$$ either analytically or numerically in the expression

\[ \frac{dS(t)}{dt} = - k_{\operatorname{esc}}(t)S(t). \]

The initial value, $$S(0)$$ for this initial value problem is 1, as there is no chance the particle has escaped at the very instant the hole has been punched out. If we are to count trajectories analytically, we must normalize the count by the total volume of phase space,

\[ \Omega = \int \delta(H(\Gamma) - E) d\Gamma = 8\pi ml^3E. \]

Then, our survival probability can be written as

\[ S(t) = 1 - \int \int_0^t \delta(\Gamma(t') - B) p_{NVE}(\Gamma(t')) dt' d\Gamma \]

for B the opening in the container in phase space coordinates. As you would find on the dynamical billiards page, $$\Gamma(t')$$ is the pair $$(\vec r(t'),\vec p(t'))$$ where the trajectories are periodic and piecewise functions while the boundary $$B$$ can be written as

\[ B(x,y,z) = \theta\left(R^2 - \left(y-\frac{l}{2}\right)^2 + \left(z-\frac{l}{2}\right)^2 \right)\delta(x-l)\]

for the circular punch-out centered on the cube wall at $$x = l$$. This integral is formidable, and attempting to integrate our functions by discretizing each of the six phase space variables poses two immediate issues: (1) For an exceedingly poor grid spacing of 10 points along $$x,y,z$$ and $$p_x,p_y,p_z$$, we must evaluate this integral at $$10^6$$ points, and (2) we know from our energy condition that the momentum vector is constrained to lie on the surface of a sphere, which would mean even the "clever" choice to discretize the momentum integrals in spherical coordinates still creates a nonuniform density biased towards the sphere's poles. These numerical hiccups point to the use of Monte Carlo simulation.