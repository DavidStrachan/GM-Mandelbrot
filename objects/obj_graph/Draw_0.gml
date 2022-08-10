
if (!surface_exists(the_surface)) {
	the_surface = surface_create(draw_width,draw_height)
}


if (processed == false) 
{
	
	// reset
	new_draw_left = 0 
	new_draw_right = 0 
	new_draw_top = 0 
	new_draw_bottom = 0 
	left_picked = false
	

	surface_set_target(the_surface)

		draw_clear_alpha(c_black,1)
		
		#region THE CALCULATION 
		
			for (var w = 0; w < draw_width; ++w) {
				for (var h = 0; h < draw_height; ++h) {
				    var xx = map(w,0,draw_width,val_left,val_right)
				    var yy = map(h,0,draw_height,val_top,val_bottom)
		
					var original_x = xx
					var original_y = yy
		
					#region MANDELBROT
					
					    var iteration = 0
					    var max_iteration = 255
						var xtemp = 0 
						
						var aa = 0 
						var bb = 0
						
						while (abs(aa+bb) < 10 and iteration < max_iteration) {
						    
							aa = xx*xx - yy*yy
							bb = 2 * xx * yy
							
							xx = aa + original_x
							yy = bb + original_y
							
					        //xtemp = xx*xx - yy*yy //+ w/draw_width
					        //yy = 2*xx*yy + h/draw_height
					        //xx = xtemp							
							
							iteration ++
						}

					
					#endregion
					
					#region THE DAVE SET?
					/*
					    var iteration = 0
					    var max_iteration = 255
						var xtemp = 0 
						
						var aa = 0 
						var bb = 0
						
						while (abs(aa+bb) < 16 and iteration < max_iteration) {
						    
							aa = xx*xx - yy*yy
							bb = 2 * xx * yy
							
							xx = xx + original_x
							yy = yy + original_y
							
					        //xtemp = xx*xx - yy*yy //+ w/draw_width
					        // yy = 2*xx*yy + h/draw_height
					        //xx = xtemp							
							
							iteration ++
						}

					*/
					#endregion
		

					// Turn it into a colour
					//iteration = clamp(iteration,0,255)
					iteration = clamp(iteration*iteration,0,255) // Used for better distinction of colours 
					//draw_set_colour(make_colour_hsv(iteration,250,100))
					draw_set_colour(make_colour_hsv(100,100,iteration))
					
					// Draw this value
					draw_point(w,h)
		
				}
			}
		
		#endregion

	surface_reset_target()
	
	processed = true
}

draw_surface(the_surface,draw_left,draw_top)


#region -- Used for zooming -- 

	if (mouse_check_button_pressed(mb_left)) 
	{
		new_draw_left = mouse_x
		new_draw_top = mouse_y
		new_val_left = map(mouse_x,draw_left,draw_right,val_left,val_right)
		new_val_top = map(mouse_y,draw_top,draw_bottom,val_top,val_bottom)
		left_picked = true
	}

	if (mouse_check_button_pressed(mb_right)) 
	{
		new_draw_right = mouse_x
		new_draw_bottom = mouse_y
		new_val_right = map(mouse_x,draw_left,draw_right,val_left,val_right)
		new_val_bottom = map(mouse_y,draw_top,draw_bottom,val_top,val_bottom)
		processed = false
		val_left = new_val_left
		val_right = new_val_right
		val_top = new_val_top
		val_bottom = new_val_bottom
	}

	

	draw_set_colour(c_white)
	if (left_picked) { 
		draw_rectangle(mouse_x,mouse_y,new_draw_left,new_draw_top,true)
	}
	else 
	{
		draw_rectangle(new_draw_left,new_draw_top,new_draw_right,new_draw_bottom,true)
	}
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(draw_debug_x,draw_debug_y-20,new_val_top)
	draw_text(draw_debug_x,draw_debug_y+20,new_val_bottom)
	draw_text(draw_debug_x+100,draw_debug_y,new_val_right)
	draw_text(draw_debug_x-100,draw_debug_y,new_val_left)

#endregion