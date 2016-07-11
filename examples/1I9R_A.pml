from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1I9R.pdb, model
create antigen_chain, chain A
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

select interface, resi 128+129+130+131+132+143+178+179+183+217+218+220+245+246+247+248+249+250+251+253+129+141+142+143+144+145+146+148+151+155+249+250+251 and chain A
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 123+126+128+129+140+155+170+227+235+249+254+253+257 and chain A
color paleyellow, paleyellow_residues
select red_residues, resi 133+142+144+203+204+207+211+251 and chain A
color red, red_residues
select yelloworange_residues, resi 143+145 and chain A
color yelloworange, yelloworange_residues


set_view (\
    -0.105956182,   -0.947420061,   -0.301939607,\
     0.067508824,   -0.309802085,    0.948401868,\
    -0.992075622,    0.080105878,    0.096785471,\
     0.000000164,    0.000000000, -197.000030518,\
    56.233421326,    6.623297215,   26.174709320,\
   152.167495728,  241.832595825,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1I9R_A.png