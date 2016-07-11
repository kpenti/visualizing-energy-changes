from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 2NY7.pdb, model
create antigen_chain, chain G
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

select interface, resi 257+280+281+282+364+365+366+367+368+369+370+371+372+373+375+384+386+417+418+419+430+431+432+455+456+457+458+471+472+473+474+475 and chain G
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 197+123+127+210+125+113 and chain G
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 166+369+337+459+180 and chain G
color yelloworange, yelloworange_residues
select red_residues, resi 471+474+97+283+256+252+276+365 and chain G
color red, red_residues


set_view (\
     0.860257804,   -0.274280727,   -0.429797441,\
    -0.480395257,   -0.718446851,   -0.503045559,\
    -0.170810997,    0.639221847,   -0.749812722,\
    -0.000088736,    0.000014664, -175.392532349,\
    94.048561096,  136.617828369,  250.742889404,\
    21.298448563,  329.490356445,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/2NY7_G.png