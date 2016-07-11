from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 4HPO.pdb, model
create antigen_chain, chain P
create antibody_chains, chain H+L
delete model

set ray_trace_mode,  1
#set ambient, 1
#set reflect, 0
#set two_sided_lighting, on
unset specular

remove solvent
hide nonbonded

color white, *
show spheres, *

select interface, resi 169+170+172+173+174+175+176+177+178+179+180+181+167+168+169+171+172+175+176 and chain P
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 169+173+176+177+180+168+171 and chain P
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 170+166+178+167+182+183+174 and chain P
color yelloworange, yelloworange_residues
select red_residues, resi 186+172+181+185+165+179+184+175 and chain P
color red, red_residues


set_view (\
    -0.518543959,    0.590942740,    0.617979705,\
    -0.437436759,   -0.804341018,    0.402099639,\
     0.734684944,   -0.061820716,    0.675586820,\
    -0.000012659,    0.000000289, -143.043960571,\
     5.378053665,    0.908266127,  -13.186658859,\
    91.614700317,  194.472839355,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/4HPO_P.png