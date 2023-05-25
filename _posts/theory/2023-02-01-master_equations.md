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
<div class="row">
<div class="medium-4 medium-push-8 columns" style="float:left" markdown="1">
<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
* TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

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


### The Interaction Picture

Analysis of this equation is commonly easier in the interaction picture. For convenience, we begin by writing Eq.\eqref{eq:openQuantumH} as a dominant piece $$H_0$$ and a perturbation $$V$$

$$
\begin{equation}
\mathcal{H} = H_0 + \lambda V,
\end{equation}
$$

The total time evolution operator that evolves our system from time zero to time $$t$$ is

$$
\begin{align}
    U(t) &= e^{-i\mathcal{H}t} = U_{V}(t)U_0(t),\\
    U_{V}(t) &= e_\leftarrow^{-i\lambda\int_0^t d\tau V(\tau)},\\
    U_0(t) &= e^{-iH_0t},
\end{align}
$$

where we have broken the operator into two parts using a time ordered exponential to ensure time-dependent operators are ordered from right to left with increasing time arguments. An operator $$A$$ in the interaction picture is defined as

$$
\begin{equation}
    \hat{A}(t) = U_0^\dagger(t)A(t)U_0(t).
\end{equation}
$$

From this definition we rewrite the Liouville equation in the interaction picture as

$$
\begin{equation}\label{eq:liouvilleInteraction}
    \frac{d}{dt}\hat{\rho}(t) = -i\lambda[\hat{H}_{V},\hat{\rho}(t)] = \hat{\mathcal{L}}_V\hat{\rho}(t)
\end{equation}
$$

{% include accordian.html title='Exercise' contents='Confirm for yourself that this is the correct expression for the Liouville equation in the interaction picture.' %}

### Projection Operators

Frequently we do not care about the dynamics of the entire density matrix. For example, we may only want to know about how the population of the system evolves. We can narrow our focus to the part we care about by tracing out the rest of the system/bath. This effect is usually achieved through projection operators. As an example, if we wish to focus on solely the system dynamics we define our projection operator as

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
<li> Confirm that this projection operator returns a reduced density matrix \(\sigma = \text{Tr}_B\{\rho(t)\}\) where the bath degrees of freedom have been traced out. <i>Hint:</i> Define a basis set \(|a,\alpha\rangle\) where \(a\) denotes bath states and \(\alpha\) denotes system states. </li>
<li> Confirm that \(P^2 = P\). </li>
</ol>
{% endraw %}
{% endcapture %}

{% include accordian.html title='Exercises' contents=c%}

With these definitions we obtain the following system of equations

$$
\begin{align}
\frac{d}{dt}P\hat{\rho}(t) = \lambda P\hat{\mathcal{L}}_V(t)(P+Q)\hat{\rho}(t),\label{eq:PonLiouville}\\
\frac{d}{dt}Q\hat{\rho}(t) = \lambda Q\hat{\mathcal{L}}_V(t)(P+Q)\hat{\rho}(t),\label{eq:QonLiouville}
\end{align}
$$

where we have used the most important trick of inserting one in the form of $$P+Q$$ and $$P$$ and $$Q$$ are time-independent. We start by solving Eq. \eqref{eq:QonLiouville} exactly

$$
\begin{equation}\label{eq:Qsolution}
Q\hat{\rho}(t) = e^{\lambda Q \hat{\mathcal{L}}_V\,t}Q\hat{\rho}(t) + \lambda\int_0^t dt' e^{\lambda Q \hat{\mathcal{L}}_V\,t'}Q\hat{\mathcal{L}}_VP\hat{\rho}(t-t').
\end{equation}
$$

{% include accordian.html title="Exercise" contents="Verify that Eq. \eqref{eq:Qsolution} is the solution to Eq. \eqref{eq:QonLiouville}"%}

This equation can be used to eliminate $$Q$$ from Eq. \eqref{eq:PonLiouville} and obtain the [Nakajima-Zwanzig equation](https://en.wikipedia.org/wiki/Nakajima%E2%80%93Zwanzig_equation). Most master equations follow by starting with this equation and making a series of approximations.

## Redfield Equation

The Redfield equation is one of the most common examples referenced when discussing quantum master equations. It is also ill-defined, with everyone using slightly different simplifications and approximations in their definition In this section we will note the common simplifications and approximations.

Beginning with the Nakajima-Zwanzig equation, we make the following simplifications and approximations

1. $$P\mathcal{L}P = 0$$ as can be shown using the cyclic invariance of the trace
2. Assume the initial density matrix is separable into a bath and system part $$\rho(0) = \rho_B\sigma(0)$$. This approximation is sometimes known as the Born Approximation.
3. Assume that the system-bath interaction is small and **keep only up to 2nd order in $$\lambda$$**. This allows us to expand any exponentials in a Taylor series and keep only terms that are $$\mathcal{O}(\lambda^2)$$ or less. Because $$\lambda$$ is only used to keep track of perturbation order, we now set $$\lambda=1$$.

The resulting equation is

$$
\begin{equation}
\frac{d}{dt}P\hat{\rho}(t) = P \hat{\mathcal{L}}_V(t) \int_0^t dt' P \hat{\mathcal{L}}_V(t)\hat{\mathcal{L}}_V(t') P \rho(t-t'),
\end{equation}
$$

or rewriting in terms of the reduced density matrix $$\hat{\sigma}(t) = \text{Tr}_B\{\hat{\rho}(t)\}$$

$$
\begin{equation}
\frac{d\hat{\sigma}(t)}{dt} = \int_0^t dt' \text{Tr}_B\{\hat{\mathcal{L}}_V(t)\hat{\mathcal{L}}_V(t')\rho_B\hat{\sigma}(t-t')\}.
\end{equation}
$$


### Assume $$H_{SB}$$ is Separable

To proceed and make further approximations, it is useful to assume that $$V = H_{SB}$$ can be written as a sum of terms that are separable into bath and system operators

$$
\begin{equation}
\hat{H}_{SB}(t) = \sum_k S_k(t) \otimes B_k(t),
\end{equation}
$$

where we are employing a shorthand of explicit time-dependence to denote that $$S_k$$ and $$B_k$$ are in the interaction picture. Utilizing the following facts

1. System and bath operators commute,
2. Cyclic invariance of the trace,
3. $$B_k(t) = U_B^\dagger(t)B_k(0)U_B(t)$$,
4. $$[\rho_B,U_0] = 0$$,

and defining the time correlation function $$C_{k,l}(t) = \text{Tr}_B\{\rho_B B_k(t)B_l(0)\}$$, we obtain

$$
\begin{equation}\label{eq:timeNonLocalRedfield}
\frac{d}{dt}\hat{\sigma}(t) = -\int_0^t d\tau \sum_{k,l}\left(C_{k,l}(\tau)\left[S_k(t),S_l(t-\tau)\hat{\sigma}(\tau)\right] - C_{k,l}^*(\tau)\left[S_l(t),\hat{\sigma}(\tau)S_k(t-\tau)\right]\right)
\end{equation}
$$

### Markov Approximation

A factor that makes Eq. \eqref{eq:timeNonLocalRedfield} difficult to solve is the non-local time dependence--$$\sigma(t)$$ depends on $$\sigma(t' < t)$$ through the factor of $$\sigma(\tau)$$ in the integrand. However, $$C_{k,l}(\tau)$$ tends to have a typical correlation time $$\tau_B$$. For $$\tau \ll \tau_B$$ the bath has largely 'forgotten' its interactions with the system and the correlation is approximately zero. If $$\tau_B$$ is much smaller than the timescale of changes that we are interested, we can make the replacement $$\hat{\sigma}(\tau) \rightarrow \hat{\sigma}(t)$$ and change our upper integration bound to infinity.

### Return of the Schrödinger Picture and the Secular Approximation

A matrix element of the reduced density matrix in the Schrödinger picture is given by

$$
\begin{align}
\langle \eta | \frac{d}{dt} \sigma(t)| \nu \rangle &= \langle \eta | \frac{d}{dt}\left(U_0(t)\hat{\sigma}(t)U_0^\dagger(t)\right)|\nu\rangle,\\
&= -i\omega_{\eta\nu}\sigma_{\eta\nu}(t) + e^{-i\omega_{\eta\nu}t}\frac{d}{dt}\hat{\sigma}_{nm}(t),
\end{align}
$$

where and $$\omega_{\eta\nu} = \epsilon_\eta -\epsilon_\nu$$. Obtaining the matrix elements $$\frac{d}{dt}\hat{\sigma}_{nm}(t)$$ is a straightforward but tedious process. Along the way it can be useful to define

$$
\begin{align}
\Lambda^+_{abcd} &= \sum_{k,l} S_k^{ab}S_l^{cd} \int_0^\inf d\tau C_{k,l}(\tau) e^{-i\omega_{cd}\tau},\\
\Lambda^-_{abcd} &= \sum_{k,l} S_k^{ab}S_l^{cd} \int_0^\inf d\tau C^*_{k,l}(\tau) e^{-i\omega_{ab}\tau},
\end{align}
$$

and the Redfield tensor like object

$$
\begin{equation}
R_{abcd} = \Lambda^+_{dbac}+\Lambda^-_{dbac} - \sum_{l}(\delta_{bd}\Lambda^+_{allc} + \delta_{ac}\Lambda^-_{dllb}).
\end{equation}
$$

The secular approximation, also sometimes called the rotating wave approximation, allows us to discard terms that oscillate rapidly within the timescale of our time-correlations (i.e. we discard terms where $$|\omega_{\eta\nu} - \omega_{\alpha\beta}|$$ is not much less than $$\tau_B$$). And we end up with a form that most would recognize as Redfield

$$
\begin{equation}
\frac{d}{dt}\hat{\sigma}_{\eta\nu}(t) = \hat{\sigma}_{\eta\nu}(t)R_{\eta\nu\eta\nu} + \delta_{\eta\nu}\sum_{m\ne \eta}\hat{\sigma}_{mm}(t)R_{\eta\eta m m}.
\end{equation}
$$