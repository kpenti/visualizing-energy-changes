from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1NBZ.pdb, model
create antigen_chain, chain C
create antibody_chains, chain A
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

select interface, resi 613+614+615+616+618+619+620+621+622+689+693+696+697+700 and chain C
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 93+62+89+100+100+96+53+75 and chain C
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 21+63+101+62+91+75+31+32+63+97+50+101+21+20 and chain C
color yelloworange, yelloworange_residues
select red_residues, resi 97+21+20+32+98+20+100+33+96+96+97+750 and chain C
color red, red_residues


set_view (\
     0.430622011,    0.088947281,   -0.898138762,\
     0.102012150,    0.983958185,    0.146357030,\
     0.896748245,   -0.154645517,    0.414640248,\
     0.000001729,    0.000002429, -209.557785034,\
   127.365867615,   68.025146484,   56.556983948,\
   165.216949463,  253.898620605,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1NBZ_C.png