from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 2B4C.pdb, model
create antigen_chain, chain G
create antibody_chains, chain L+H
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

select interface, resi 119+120+122+200+202+203+205+316+319+320+322+326+327+369+419+421+422+423+432+433+434+435+436+437+322+323 and chain G
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 207+427+430+423+473+119+367+432+434+422+426+435+199+298+472+368+392+366 and chain G
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 435+437+122+420+370+365+470+469+123+386+419+471+475+421+120+363+121+256+339 and chain G
color yelloworange, yelloworange_residues
select red_residues, resi 202+424+476+200+479+431+477+257+429+203+201+198+125+425+474+127+369+428+417 and chain G
color red, red_residues


set_view (\
     0.009946176,    0.934105933,   -0.356856614,\
    -0.421962947,    0.327463448,    0.845407307,\
     0.906556785,    0.142171860,    0.397415757,\
    -0.000312382,    0.000167012, -212.891479492,\
    93.962387085, -135.196609497,  140.990234375,\
   142.283187866,  283.508453369,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/2B4C_G.png