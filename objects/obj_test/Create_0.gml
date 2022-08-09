
draw_width = 800
draw_height = 800
draw_left = 0 
draw_right = draw_left + draw_width
draw_top = 0 
draw_bottom = draw_top + draw_height

val_left = -2
val_right = 2
val_top = -2
val_bottom = 2

processed = false

the_surface = surface_create(draw_width,draw_height)

new_val_left = 0 
new_val_right = 0 
new_val_top = 0 
new_val_bottom = 0 

new_draw_left = 0 
new_draw_right = 0 
new_draw_top = 0 
new_draw_bottom = 0 

math_set_epsilon(0.000001)