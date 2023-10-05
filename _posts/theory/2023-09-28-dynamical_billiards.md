---
layout: page-fullwidth
title:  "Dynamical Billiards"
categories:
    - theory
    - CM
    - CM_Misc
tags:
    - theory
    - misc
    - page
header: no
breadcrumb: true
---

{% include mathjax.html %}

[Our classical particle in a container]({{site.url}}{{site.baseurl}}/sop/new-students#monte-carlo-with-a-single-particle) is a dynamical system that mathematicians call a "dynamical billiard". Billiards can incorporate a wide variety of geometric, dissipative, and quantum effects which make them suitable models for optics, lasers, particle traps, and nanodevices. The onboarding example discusses the utility of these billiards toward understanding fundamental statistical mechanics and the physical chemistry of particle escape.

If our system has holes in the interior or on the boundary, we have defined an "open dynamical billiard" where once the orbit, or trajectory, terminates on the opening, we no longer consider its dynamics. [One fairly recent application](https://doi.org/10.1103/PhysRevLett.104.163902) of this formalism to laser design studies how curvature of a mirrored cavity wall can maximize time spent by photons in the gain medium before passing through the beamsplitter.

To determine how long a particle stays in the defined region, we need to propagate the [microcanonical ensemble]({{site.url}}{{site.baseurl}}/theory/sm/sm_ensembles/microcanonical) of this system in timesteps $$dt$$ and count how many trajectories cross the open boundary. The survival function of the particle is then the fraction of trajectories that have still not crossed the opening at $$t = ndt$$. An important related quantity to $$S(t)$$ is the rate at which the number of surviving trajectories changes, called the escape rate. Rephrase the problem as a dense gas of $$N$$ equal-energy particles, $$\rho = N/V$$, instead of a state density. We see in our [example]({{site.url}}{{site.baseurl}}/sop/new-students#monte-carlo-with-a-single-particle) that the escape rate shares many similarities with the kinetic theory of effusion. However, this condition that every particle is constrained to the same energy has interesting repercussions for the long-time dynamics of the system. 

Billiards on hyperrectangles like our [cube]({{site.url}}{{site.baseurl}}/sop/new-students#monte-carlo-with-a-single-particle) are one of two well known geometries in which the dynamics are solved for all times, also known as an integrable system. The other one is the hyperellipsoids. The following steps will guide you through finding the solution for a particle trajectory given that you start at a specific point $$\Gamma$$ in our six dimensional phase space.

(1) Write down the trajectory, $$\vec r(t)$$, ignoring the container walls for a particle starting at $$\vec r_0$$ with momentum $$\vec p$$.

(2) Specular reflection requires that the angle of incidence to the surface normal, $$\hat n$$, equals the opposing angle of reflection. Show that this condition is captured by the Householder transformation matrix (the difference of the unit dyadic and surface normal dyadic), $${\bf R}_n = \mathbb{1} - \hat n \otimes \hat n $$, and that reflecting off the walls of a cube will keep this trajectory confined to six specific momenta in phase space.

(3) Explain why the functional form of the coordinate trajectory should be $$2l$$-periodic along the cube axes. Then, instead of reflecting the particle, imagine that the particle continues through the wall to a reflected copy of the cube instead. The trajectory remains a straight line where now the particle coordinate is decreasing from $$l$$ along the reflected axis. Using this construction, write the final solution for the position of the particle after a time, $$t$$, starting from anywhere in phase space, $$\vec r(t; \Gamma)$$. As the function will be periodic, you will likely find the floor function or mod operation useful.

Note that because any particle trajectory will be restricted to only six momenta, this means that our cubic billiard is nonergodic and therefore numerical simulation of a single trajectory over long times will not be equivalent to ensemble averages. In position, or configuration, space however, nearly all trajectories will visit every position inside the cube due to ratios of the component momenta nearly always being irrational. On the computer, this is tricky to justify as every number storable in memory must be rational, but in a measure theoretic sense on real numbers, this is true. Consider a two-dimensional region and the slope from $$p_y/p_x$$ required to characterize the trajectory. Using the same unfolding construction in step 3 of integrating the dynamics, it is easy to show that an irrational slope makes the trajectory ergodic. This nonergodicity in momentum space suggests that mimicking ensemble averages in our cubic billiard requires direct sampling of momenta. 

All of that being said, we are interested in an open cubic billiard, and so taking a static ensemble average is of no interest to us here anyway. But we see at the end of the [example]({{site.url}}{{site.baseurl}}/sop/new-students#monte-carlo-with-a-single-particle) why this discussion was so useful.