# visualizing-energy-changes

The pymol script to generate the 3D model visualizations. These were generated using PyMol. The template used to generate the images is named 'template.pml'

The variables in tags can be replaced:

| Variable          | Description             | e.g.                                        |  | 
|-------------------|-------------------------|---------------------------------------------|--| 
| <pdb>             | Your PDB file           | 1AHW                                        |  | 
| <antigen_chain>   | your antigen chains     | AB                                          |  | 
| <antibody_chains> | your antibody chains    | HL                                          |  | 
| <interface>       | Your interface residues | resi 22+117+121+24+18+19+124+13+113+125+129 |  | 
| <energy_residues> | Your interface residues | resi 22+117+121+24+18+19+124+13+113+125+129 |  | 
| <view>            | Your interface residues | 1AHW.view.pml                               |  | 
| <moleclue>        | The name of the image   | 1AHW-1                                      |  | 


Examples of generated templates are found in the examples directory.
