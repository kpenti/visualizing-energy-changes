from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 4HPY.pdb, model
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

select interface, resi 168+169+170+171+172+173+175+176+171+172+173+175+176+177+178 and chain P
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
    -0.914957881,   -0.092600890,   -0.392777950,\
     0.038765069,   -0.988983750,    0.142858297,\
    -0.401680082,    0.115483619,    0.908468723,\
     0.000001237,   -0.000000075, -115.549667358,\
    52.131645203,   47.627601624,   80.814620972,\
    71.654098511,  159.445220947,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/4HPY_P.png