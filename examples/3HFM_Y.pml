from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 3HFM.pdb, model
create antigen_chain, chain Y
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

select interface, resi 20+21+62+63+73+75+77+96+97+98+99+100+101+102+103+107+13+14+15+16+18+19+20+21+89+93+96+97+100 and chain Y
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 15+73+98+89 and chain Y
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 100+63+93+21+75 and chain Y
color yelloworange, yelloworange_residues
select red_residues, resi 101+20+97+96 and chain Y
color red, red_residues


set_view (\
     0.967939734,    0.188829497,    0.165637299,\
     0.078333773,   -0.853473842,    0.515214443,\
     0.238654822,   -0.485721439,   -0.840903342,\
    -0.000009019,    0.000019968, -127.785476685,\
    17.306947708,   25.964794159,   47.527145386,\
    83.996192932,  171.574752808,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/3HFM_Y.png