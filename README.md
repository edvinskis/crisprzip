# CRISPRzip
Welcome to the codebase of CRISPRzip from the [Depken Lab](https://depkenlab.tudelft.nl/) at TU
Delft.

## Project
<div align=center>
  <figure>
        <p><img src="img/activity_prediction.png" width="800"/>
  </figure>
</div>

CRISPRzip is a physics-based model to study the target 
recognition dynamics of CRISPR-associated nucleases like Cas9
[\[1\]](#references). Their interactions with target DNA is represented 
as an energy landscape, with which you can simulate binding and cleavage
kinetics. The parameters have been obtained by machine learning on 
high-throughput data (see [\[1-2\]](#references)).  CRISPRzip makes 
quantitative predictions of on-target efficiency and off-target risks of 
different guide RNAs.

With CRISPRzip, we hope to contribute to assessing
the risks that come with particular choices in CRISPR application, and as such
contribute to the development of safe gene editing technology.

## Installation
CRISPRzip is on [PyPi](https://pypi.org/) and can be installed 
with [pip](https://pip.pypa.io/en/stable/).

```bash
pip install crisprzip-model
```

## Usage
Text

## References
1. Eslami-Mossallam B et al. (2022) *A kinetic model predicts SpCas9 activity,
improves off-target classification, and reveals the physical basis of
targeting fidelity.* Nature Communications.
[10.1038/s41467-022-28994-2](https://doi.org/10.1038/s41467-022-28994-2)
2. Jones Jr et al. (2021) *Massively parallel kinetic profiling of natural and 
engineered CRISPR nucleases.* Nature Biotechnology.
[10.1038/s41587-020-0646-5](https://doi.org/10.1038/s41587-020-0646-5)