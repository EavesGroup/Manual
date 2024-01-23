---
layout: page-fullwidth
title:  "Structure Library"
categories:
    - appendix
tags:
    - appendix
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

### Silicon Slab Systems
#### [Silicon slab]({{ site.urlfile }}structure_library/silicon_slab)
{% include accordian.html title="Details" contents="VASP Parameters: plane wave energy cutoff 540 eV, energy convergence 1e-8, force convergence 10 meV."%}

#### [Si:1Anth]({{ site.urlfile }}structure_library/silicon_1Anth)
Silicon slab with (111) faces and anthracene covalently attachedalong its long edge. The <a class="" href="{{ site.urlfile }}structure_library/silicon_1Anth_initial">starting structure</a>.
{% include accordian.html title="Details" contents="VASP Parameters: plane wave energy cutoff 540 eV, energy convergence 1e-5, force convergence 10 meV. The anthracene can be placed along the symmetry axis of the silicon slab so that it dodges the surface psuedo-hydrogens and does not develop a bend, however, this structure with a bend is 0.25 eV (9.67 kT or 5.76 kcal/mol) lower in energy than the stiff molecule."%}

#### [Si:1Tet]({{ site.urlfile }}structure_library/silicon_1Tet)
Silicon slab with (111) faces and tetracene covalently attached along its long edge. The <a class="" href="{{ site.urlfile }}structure_library/silicon_1Tet_initial">starting structure</a>.
{% include accordian.html title="Details" contents="VASP Parameters: plane wave energy cutoff 540 eV, energy convergence 1e-5, force convergence 10 meV."%}