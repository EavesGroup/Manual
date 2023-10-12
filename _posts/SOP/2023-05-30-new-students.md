---
layout: page-fullwidth
title:  "New Students Start Here"
categories:
    - sop
tags:
    - sop
    - new-student
header: no
breadcrumb: true
---
<div class="row">
<div class="medium-4 medium-push-8 columns" markdown="1">
<div class="panel radius" markdown="1">
**Table of Contents**
{: #toc }
*  TOC
{:toc}
</div>
</div><!-- /.medium-4.columns -->

<div class="medium-8 medium-pull-4 columns" markdown="1">

{% include mathjax.html %}

### Set Up Your IDE

If you do any coding during your time in the Eaves Research Group--and chances are high that you will--you need an IDE (integrated development environment). The preferred IDE is Visual Studio Code developed by Microsoft. Installation of VS Code is straightforward, just [download](https://code.visualstudio.com/download) the correct file for your system and follow the instructions. In addition to supporting most programming languages straight out of the box, VS Code is currently (2023) the official editor for Julia. See [this installation guide](https://www.julia-vscode.org/docs/dev/gettingstarted/) to prepare to use Julia in VS Code.

#### Extensions

VS Code works primarily by starting with a lightweight frame that allows you to build on the functionality that you need through extensions. While this feature makes it less specialized in any particular language, it makes it a fairly decent localized place to do all of your coding. Some useful extensions are

- GitLens -- Git supercharged: Adds useful version control information in your GitHub panel (source control CTRL-SHIFT-G)
- Julia: Support for the Julia language. Includes formatting, syntax, and color coding.
- Julia Color Themes: Color themes for Julia (and Python!)

### Git/GitHub

GitHub is an online platform that hosts Git repositories, perfect for version control and sharing your work. Version control is the most important part of why you should use GitHub and some of the lingo and best practices surrounding that will be explained below. Our group does not often work on a code project synchronously, but being able to easily share your work with Joel or other inheritors of your work can be useful.

#### Push/Pull/Commit/Fork/Clone

These words form the core of the lingo that you will frequently use when working with GitHub. To build familiarity with the usage of these words, we will work through a useful example using the LAMMPS code repository.

Begin by creating/logging into your account on GitHub and navigating to the [LAMMPS code repository](https://github.com/lammps/lammps). We wish to use LAMMPS in a slightly edited form for our own research, so we will **[fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo)** the repository to our own account. During this process, you can give the forked repo a different name and you should change the description to something that is more reflective of your version.

Now that we have our own version of LAMMPS on GitHub, we need to copy the files to our local machine to install and run the program. It is also easier to make edits to any files on our local machine. This process of copying files is called **[cloning](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)**. If you have installed VS Code as your IDE, you can clone a repo through the following steps: open a new VS Code window, start a new project by clicking "Clone Git Repository..." then "Clone from GitHub", VS Code will likely prompt you to sign in, and then you will find within the dropdown the project you wish to clone, in this case your version of LAMMPS. At this point, VS Code asks where you would like to save the files. This is fully up to you, but we recommend grouping it with similar folders possibly in your Documents folder. After confirming the location, VS Code will open the project workspace for you. **[Pulling](https://github.com/git-guides/git-pull)** a repository is essentially cloning the repository after it has already been cloned to your machine. It ensures that your local files match what exists on GitHub.

In your LAMMPS project workspace, make some edits to any files you wish. In order to make the local changes accessible on GitHub we need to **[commit](https://github.com/git-guides/git-commit)** the changes and **[push](https://github.com/git-guides/git-push)** them to GitHub. Commits are how you will track the changes you have made to your code and should be made frequently. Pushes can be made less often as a way to backup your work. Your VS Code window should have some symbols on the left side, find the one labeled "Source Control" (CTRL-SHIFT-G on a Mac). Before commiting your changes, you need to **stage** them. This is done by clicking the "+" symbol that appears next to a changed file when you hover over it. If you don't stage any changes before hitting commit, VS Code will ask if you want to stage all changes. After staging all or a subset of your changes, type a commit message and hit commit. The commit message should briefly describe the changes you made in an informative way. If there are no changes to commit, VS Code will prompt you to sync changes, performing a simultaneous push/pull that will try to make sure your local files and GitHub files match. If you want more options, or to only push your changes, you can do so in a '...' menu that appears when you hover over the source control bar immediately above the commit message space.

#### More Reading

Congratulations! You have learned the basics of interacting with a Git repository on GitHub. Aside from the occasional conflict that you'll need to solve with Google, this should be all you really need. If you want to do any more reading on the topic here are guides on [Git](https://github.com/git-guides) and [GitHub](https://docs.github.com/en/get-started/quickstart/hello-world).

### Getting Started with CURC

In a statistical mechanics group, you will likely need to generate statistics at a much higher computational cost than your laptop can handle. CU Boulder's new high-performance computing, or HPC, cluster is called Alpine and is maintained by the CU Research Computing department **[(CURC)](https://www.colorado.edu/rc/)**. General accounts, or **[allocations](https://www.colorado.edu/rc/userservices/allocations)**, are available to all students using the detailed CURC **[documentation](https://curc.readthedocs.io/en/latest/index.html)**. Jobs submitted to Alpine are placed in a queue and completed based on the ranked priority of all users. Priority is determined based on how efficiently you use your allocated resources. You will also have access to our special group allocation if you need expensive calculations right out of the gate.

Take some time to look through CURC's documentation about "The Compute Environment." We will revisit some of these details soon.

### Interacting with Teams

You might be reading this on our CHEM-Eaves Teams channel right now. This channel is the heart of our group management, and we use it to discuss scheduling, paperwork, notes, code, and data. Click **[here]({{site.baseurl}}/SOP/data)** for procedures on how to format your work accessibly.

### All Together Now!

We recommend that you now take some time practicing these procedures with an example. Completing this section will require you to use Julia, VSCode, Github, Alpine, and Teams. Each step is discussed in the context of a Monte Carlo sampling project, but we provide a list of other topics that might be more interesting immediately below. If you are comfortable with programming and the software our group uses, you should pick the topic that interests you most. If you are feeling unsure, consider sticking closely to the provided example. Additional advice about coding and best practices with your code can be found on **[this page]({{site.baseurl}}/coding/coding_best_practices)** as well.

While you perform analytical work, write code, and interact with the literature, we recommend keeping detailed notes of the progress you make and the resources you use in an Overleaf document. These notes should also contain your thoughts on how to make this "New Student" document more helpful or successful for future group members. In the beginning, this would be a good document to upload to the Teams for meetings.
#### Coding Exercise Topics
- Monte Carlo
    - "Particle in a Box" (Provided Example)
        - Survival Probability
    - The Ising Model
        - Magnetization
        - Susceptibility
    - Markov Chain Monte Carlo for Random Walks
        - Probability Distribution in Position
        - Biased Walks in a Potential (Importance Sampling)
- Classical Molecular Dynamics
    - Simple Liquids (LJ Fluid or Water Model)
        - Radial Distribution Function
        - Velocity Autocorrelation Function
        - Mean Squared Displacement

#### Monte Carlo with a Single Particle

This series of exercises and tangents is designed to introduce you to one of the most popular tools in numerical statistical physics: Monte Carlo sampling. At the time of writing, this is a technique that every person in the group has used for research, which is a rare find considering the large spread of topics we tackle.

This example will consider the following question:

Consider one point particle with constant total energy $$E$$ somewhere in a cubic container of side length $$l$$, experiencing elastic collisions with the container walls. If a circular hole of radius $$R < l/2$$ is suddenly removed from the center of one of the cube faces, what is the probability that the particle is still inside the cube at time $$t$$? In other words, what is the survival probability, $$S(t)$$ for our particle?

To solve this problem requires a combination of pen and paper work and simulation. The following steps provide a possible workflow:

1. Read and complete the example on the [dynamical billiards]({{site.baseurl}}/theory/cm/cm_misc/dynamical_billiards) page.

2. Settle on some variables without physical dimensions in order to perform this simulation on a computer (i.e. characteristic units).

3. Create a project in Julia named `Ergodicity.jl` and the companion repo using **[this manual page]({{site.baseurl}}/coding/julia/julia_setup/#starting-a-new-project)**.

4. Simulating the average behavior of our particle in a box motivates us to [sample trajectories]({{site.baseurl}}/theory/sm/sm_monte_carlo/markov_chain_montecarlo) uniformly in phase space.
    1. The position coordinates can be handled by drawing three uniform random numbers in an interval defined by our characteristic length.
    2. The momenta must lie on the surface of a sphere. Justify why. We recommend for this problem that you draw three uniform random numbers on a different interval, check if this point lies inside the sphere, and then scale it to the appropriate radius. There will be some attempts that you throw away outright (about half), but the cost incurred by this inefficiency is manageable.


5. With a microstate selected, calculate when the trajectory crosses the opening.

6. Repeat this sampling $$10^6$$ times, and make a histogram of the first-passage-time distribution and survival probability. Plot the survival probability on a log-log scale. What do you observe?

The rest of these questions before syncing the Julia package are optional. But there is a lot of good insight here about why the exercise you just completed has the behavior it does.

7. Read and complete the example on the microcanonical ensemble page. Implement the new
sampling scheme and recalculate the escape rate. Now what do you observe on a log-log plot? As
a hint, the rate will have a noticeably different time dependence.

8. What has changed between our two examples which causes the escape rate to vary so signif-
icantly? As a final task, we should model the numerical results analytically.
    1. In our ideal gas (constant total energy), the number of particles impacting the punch-out
    should be proportional to the number of particles impacting the unit area on any of the walls. Do
    you know why? Estimate how many collisions occur with one side of the cube in a short time
    interval ∆t and use this expression to predict the escape rate. How does this depend on average
    speed? This is exactly the same derivation that is used to predict the effusion of a gas with kinetic
    theory. One of the assumptions of the effusion derivation is that the escape rate result only holds
    for short times, whereas in our case, it holds for all times. Explain this.
    2. The Maxwell-Boltzmann estimate of particle motion will not hold for the all-equal-energy case (or for finding the escape rate of a single particle). Return to the single particle way of thinking. If the average momentum orthogonal to the punch-out  results in an exponential escape rate, how does the orientational distribution of momenta influence the total escape rate? Write the corresponding integral and analyze the behavior of the escape rate in the long time limit.


8. Sync your local Julia package to your remote repository.

9. Run the same code on Alpine. Note, Monte Carlo is embarrassingly parallel. Take advantage of the computing resources on Alpine to increase the number of trajectories and compare run times.

10. Generate something you can show in your weekly notes and at research roundtable. Place these documents in the appropriate place on Teams.
