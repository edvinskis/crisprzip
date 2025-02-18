# CRISPRzip
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Test Status](https://github.com/hiddeoff/crisprzip/actions/workflows/test_pipeline.yml/badge.svg)

Welcome to the codebase of CRISPRzip from the [Depken Lab](https://depkenlab.tudelft.nl/) at TU
Delft.

## About the project
![Activity prediction with CRISPRzip](https://raw.githubusercontent.com/hiddeoff/crisprzip/main/img/activity_prediction.png)

CRISPRzip is a physics-based model to study the target 
recognition dynamics of CRISPR-associated nucleases like Cas9
([Eslami-Mossalam, 2022](#references)). Their interactions with target DNA is represented 
as an energy landscape, with which you can simulate binding and cleavage
kinetics. The parameters have been obtained by machine learning on 
high-throughput data. CRISPRzip makes quantitative predictions of on-target 
efficiency and off-target risks of different guide RNAs.

With CRISPRzip, we hope to contribute to assessing
the risks that come with particular choices in CRISPR application, and as such
contribute to the development of safe gene editing technology.

### References
Eslami-Mossallam B et al. (2022) *A kinetic model predicts SpCas9 activity,
improves off-target classification, and reveals the physical basis of
targeting fidelity.* Nature Communications.
[10.1038/s41467-022-28994-2](https://doi.org/10.1038/s41467-022-28994-2)

## Installation
CRISPRzip is on [PyPi](https://pypi.org/) and can be installed 
with [pip](https://pip.pypa.io/en/stable/).

```shell
pip install crisprzip
```

## Usage
CRISPRzip makes predictions about cleavage and binding activity on on- and
off-targets. First, you define the protospacer and target sequence, and then,
you can predict the fraction cleaved or bound.

```python
# 1. load parameter set
from crisprzip.kinetics import load_landscape
searcher = load_landscape("sequence_params")

# 2. define Cas9, gRNA and DNA target
searchertargetcomplex = searcher.probe_sequence(
    protospacer = "AGACGCATAAAGATGAGACGCTGG",
    target_seq  = "AGACCCATTAAGATGAGACGCGGG",  # A13T G17C
)

# 3. predict activity
f_clv = searchertargetcomplex.get_cleaved_fraction(
    time=600,  # 10 minutes
    on_rate=1E-1
)
f_bnd = searchertargetcomplex.get_bound_fraction(
    time=600,  # 10 minutes
    on_rate=1E-1
)

# 4. format output
print(f"After 10 minutes, the target (A13T G17C) is ...")
print(f"- cleaved for {100 * f_clv:.1f}% by Cas9")
print(f"    or  ")
print(f"- bound for {100 * f_bnd:.1f}% by dCas9")
```
Output:
```
After 10 minutes, the target (A13T G17C) is ...
- cleaved for 10.5% by Cas9
    or  
- bound for 94.2% by dCas9
```

See the [tutorial](examples/tutorial.ipynb) or the
[docs](https://hiddeoff.github.io/crisprzip/) for more examples how to explore 
sequence, time and concentration dependency.

## Contributing
We encourage contributions in any form - reporting bugs, suggesting features,
drafting code changes. Read our [Contributing guidelines](./CONTRIBUTING.md) and 
our [Code of Conduct](./CODE_OF_CONDUCT.md).

## Acknowledgements
Many thanks to [Elviss Dvinskis](https://github.com/edvinskis),
[Raúl Ortiz](https://github.com/rortizmerino) and [Aysun Urhan](https://github.com/aysunrhn)
from the [DCC team at TU Delft](https://www.tudelft.nl/en/library/support/library-for-researchers/setting-up-research/dcc)
for their support to get this package released!

## Waiver
Technische Universiteit Delft hereby disclaims all copyright interest in the
program “CRISPRzip” (a physics-based CRISPR activity predictor)
written by the Author(s).
Paulien Herder, Dean of Applied Sciences

(c) 2024, Hidde Offerhaus, Delft, The Netherlands.
