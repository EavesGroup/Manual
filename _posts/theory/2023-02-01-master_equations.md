---
layout: page-fullwidth
title:  "Master Equations"
categories:
    - theory
    - QM
    - QM_Dynamics
tags:
    - theory
    - quantum-dynamics
    - page
header: no
breadcrumb: true
---
{% include toc.html %}

{% include mathjax.html %}

## Introduction

For an open quantum system, the most general Hamiltonian can be written as

$$
\begin{equation}\label{eq:openQuantumH}
    \mathcal{H} = H_S + H_B + H_{SB},
\end{equation}
$$

where $$H_S$$ is the system Hamiltonian, $$H_B$$ is the Hamiltonian for the bath or environment of the system, and $$H_{SB}$$ is the coupling between the system and bath. The time evolution of the total density matrix is given by the quantum Liouville equation ($$\hbar = 1$$)

$$
\begin{equation}\label{eq:quantumLiouville}
    \frac{d\rho(t)}{dt} = -i[\mathcal{H},\rho(t)].
\end{equation}
$$

For convenience, we commonly define the Liouville operator $$\mathcal{L}$$. Its behaviour is defined by how it acts on an operator $$A$$

$$
\begin{equation}
    \mathcal{L}A = -i[\mathcal{H},A].
\end{equation}
$$

The total density matrix $$\rho(t)$$ contains information about the bath dynamics that are typically not of interest. Eq. \eqref{eq:quantumLiouville} is also difficult to solve. This chapter outlines various quantum master equations that take different approaches in approximating Eq. \eqref{eq:quantumLiouville} to learn about the dynamics of the system.


## Redfield Equation

The Redfield equation is one of the most common examples referenced when discussing quantum master equations. It is an approximate solution to Eq. \eqref{eq:quantumLiouville} that depends on weak coupling to the environment--small $$H_{SB}$$. The Redfield equation is also Markovian, meaning we assume that the probability of an event--population transfer for example--depends only on the current state of the system, not the history of the system. This section will derive the Redfield equation and outline where these approximations are important.

### The Interaction Picture

We assume from the beginning that the system-bath coupling is weak. We can then write Eq.\eqref{eq:openQuantumH} as

$$
\begin{align}
\mathcal{H} &= H_0 + \lambda V,\\
H_0 &= H_S + H_B,\\
V &= H_{SB}/\lambda.
\end{align}
$$

The derivation is simplified in the interaction picture. The total time evolution operator is

$$
\begin{align}
    U(t) &= e^{-i\mathcal{H}t} = U_{SB}(t)U_0(t),\\
    U_{SB}(t) &= e_+^{-i\lambda\int_0^t d\tau V(\tau)},\\
    U_0(t) &= e^{-i(H_S + H_B)t},
\end{align}
$$

where we have broken the operator into two parts using a time ordered exponential to ensure time-dependent operators are ordered from right to left with increasing time arguments. An operator $$A$$ in the interaction picture is defined as

$$
\begin{equation}
    A^I(t) = U_0^\dagger(t)A(t)U_0(t).
\end{equation}
$$

From this definition we rewrite the Liouville equation in the interaction picture as

$$
\begin{equation}\label{eq:liouvilleInteraction}
    \frac{d}{dt}\rho^I(t) = -i\lambda[H_{SB}^I,\rho^I(t)]
\end{equation}
$$

{% include accordian.html title='Exercise' contents='Confirm for yourself that this is the correct expression for the Liouville equation in the interaction picture.' %}

### Projection Operator

This density matrix $$\rho^I(t)$$ is still the full density matrix for the system and bath. We would like to break the density matrix into a relevant system part and an irrelevant bath part. This can be accomplished using projection operators. We define our projection operator as

$$
\begin{align}
P \cdot &= \rho_B \text{Tr}_B\{\cdot\},\\
Q &= 1-P
\end{align}
$$

where $$\text{Tr}_B$$ denotes a trace over bath states and $$\rho_B = e^{-\beta H_B}/\mathcal{Z}_B$$ is the equilibrium bath operator--$$\mathcal{Z}_B = \text{Tr}_B\{e^{-\beta H_B}\}$$. This definition of the projection operator ensures that $$P^2 = P$$. 

{% capture c %}
{% raw %}
<ol>
<li> Confirm that this projection operator returns a reduced density matrix \(\sigma = \text{Tr}_B\{\rho(t)\}\) where the bath degrees of freedom have been traced out. <i>Hint:</i> Define a basis set \(|a,\alpha\rangle\) where \(a\) denotes bath states and \(alpha\) denotes system states. </li>
<li> Confirm that \(P^2 = P\). </li>
</ol>
{% endraw %}
{% endcapture %}

{% include accordian.html title='Exercises' contents=c%}

With these definitions we obtain the following system of equations

$$
\begin{align}
\frac{d}{dt}P\rho^I(t) = \lambda P\mathcal{L}^I_{SB}(t)(P+Q)\rho^I(t),\label{eq:PonLiouville}\\
\frac{d}{dt}Q\rho^I(t) = \lambda Q\mathcal{L}^I_{SB}(t)(P+Q)\rho^I(t),\label{eq:QonLiouville}
\end{align}
$$

where we have used the most important trick of inserting one in the form of $$P+Q$$ and $$P$$ and $$Q$$ are time-independent. We start by solving Eq. \eqref{eq:QonLiouville} exactly

$$
\begin{equation}
Q\rho^I(t) = e^{\lambda Q \mathcal{L}_{SB}^I\,t}Q\rho^I(t) + \lambda\int_0^t dt' e^{\lambda Q \mathcal{L}_{SB}^I\,t'}Q\mathcal{L}_{SB}^IP\rho^I(t-t').
\end{equation}
$$

{% include accordian.html title="Exercise" contents="Verify that this is the solution to Eq. \eqref{eq:QonLiouville}"%}

This equation can be used to eliminate $$Q$$ from Eq. \eqref{eq:PonLiouville} and obtain the [Nakajima-Zwanzig equation](https://en.wikipedia.org/wiki/Nakajima%E2%80%93Zwanzig_equation). We can then make a series of simplifications and approximations to obtain a nice and compact expression for the reduced density matrix. These simplifications and approximations are

1. $$P\mathcal{L}P = 0$$ as can be shown using the cyclic invariance of the trace
2. Assume the initial density matrix is separable into a bath and system part $$\rho(0) = \rho_B\sigma(0)$$. This approximation is sometimes known as the Born Approximation.
3. Assume that the system-bath interaction is small and keep only up to 2nd order in $$\lambda$$. This allows us to expand any exponentials in a Taylor series and keep only terms that are $$\mathcal{O}(\lambda^2)$$ or less. Because $$\lambda$$ is only used to keep track of perturbation order, we now set $$\lambda=1$$.

The resulting equation is

$$
\begin{equation}
\frac{d}{dt}P\rho^I(t) = P \mathcal{L}_{SB}^I(t) \int_0^t dt' P \mathcal{L}_{SB}^I(t)\mathcal{L}_{SB}^I(t') P \rho(t-t'),
\end{equation}
$$

or rewriting in terms of the reduced density matrix $$\sigma^I(t) = \text{Tr}_B\{\rho^I(t)\}$$

$$
\begin{equation}
\frac{d\sigma^I(t)}{dt} = \int_0^t dt' \text{Tr}_B\{\mathcal{L}^I_{SB}(t)\mathcal{L}^I_{SB}(t')\rho_B\sigma^I(t-t')\}.
\end{equation}
$$

### Assume $$H_{SB}$$ is Seperable

To proceed and make further approximations, it is useful to assume that $$H_{SB}$$ can be written as a sum of terms that are separable into bath and system operators

$$
\begin{equation}
H_{SB}^I(t) = \sum_k S_k(t) \otimes B_k(t),
\end{equation}
$$

where we are employing a shorthand of explicit time-dependence to denote that $$S_k$$ and $$B_k$$ are in the interaction picture. Utilizing the following facts

1. System and bath operators commute,
2. Cyclic invariance of the trace,
3. $$B_k(t) = U_B^\dagger(t)B_k(0)U_B(t)$$,
4. $$[\rho_B,U_0] = 0$$,

and defining the time correlation function $$C_{k,l}(t) = \text{Tr}_B\{\rho_B B_k(t)B_l(0)\}$$, we obtain

$$
\begin{equation}
\frac{d}{dt}\sigma^I(t) = -\int_0^t d\tau \sum_{k,l}\left(C_{k,l}(\tau)\left[S_k(t),S_l(t-\tau)\sigma^I(\tau)\right] - C_{k,l}^*(\tau)\left[S_l(t),\sigma^I(\tau)S_k(t-\tau)\right]\right)
\end{equation}\label{eq:timeNonLocalRedfield}
$$

### Markov Approximation

A factor that makes Eq. \eqref{eq:timeNonLocalRedfield} difficult to solve is the non-local time dependence--$$\sigma(t)$$ depends on $$\sigma(t' < t)$$ through the factor of $$\sigma(\tau)$$ in the integrand. However, $$C_{k,l}(\tau)$$ tends to have a typical correlation time $$\tau_B$$. For $$\tau \ll \tau_B$$ the bath has largely 'forgotten' its interactions with the system and the correlation is approximately zero. If $$\tau_B$$ is much smaller than the timescale of changes that we are interested, we can make the replacement $$\sigma^I(\tau) \rightarrow \sigma^(t)$$ and change our upper integration bound to infinity.

### Return of the Schrödinger Picture and the Secular Approximation