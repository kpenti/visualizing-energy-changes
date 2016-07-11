from pymol.cgo import *
from pymol import cmd

#BEGIN PYMOL SCRIPT
set antialias = 2
set stick_radius = 0.3
set mesh_radius = 0.02
bg_color white

load 1JRH.pdb, model
create antigen_chain, chain I
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

select interface, resi 49+50+51+52+53+54+55+76+78+80+47+49+53+54+55+56+82+84+98+99 and chain I
color gray40, interface
show spheres, interface
color green, antibody_chains
delete antibody_chains

select paleyellow_residues, resi 216+160+138+191+138+186+110+198+198 and chain I
color paleyellow, paleyellow_residues
select yelloworange_residues, resi 132+25+83+95+14+19+152+59 and chain I
color yelloworange, yelloworange_residues
select red_residues, resi 45+167+35+103+122+173+71+116+48 and chain I
color red, red_residues


set_view (\
     0.777396619,   -0.169293314,   -0.605800331,\
    -0.172739282,    0.868613660,   -0.464405835,\
     0.604826510,    0.465673149,    0.646013796,\
    -0.000007045,    0.000082448, -177.453720093,\
    -1.730380654,   54.985984802,   21.657409668,\
   133.336547852,  221.572525024,  -20.000000000 )


set label_position,(0,2,15)
unset depth_cue
unset ray_label_specular
set label_color, white
set label_outline_color, white
set label_shadow_mode, 0
set label_font_id, 5
set label_size, 12

ray
png ../pngs/1JRH_I.png