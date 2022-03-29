require 'cairo'
--[[gauges with circlewriting by mrpeachy 05/2011
based on the conky by olgmen @ forum.ubuntu.ru
call in conkyrc similar to this
lua_load /home/mcdowall/lua/gauge.lua
lua_draw_hook_pre draw_fig
]]

function conky_draw_fig()
	if conky_window == nil then return end
	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)
	
	local updates=tonumber(conky_parse('${updates}'))
	
	if updates>5 then
		--#########################################################################################################
		--#########################################################################################################
		setup={
		center_point_x=112,
		center_point_y=90,
		gauge_radius=40,
		number_of_dots=20,
		dot_radius=2,
		start_angle=270,
		end_angle=450,--make end angle greater than start angle
		conky_variable=tonumber(conky_parse("${cpu cpu0}")),
		max_value=100, -- max value of above variable
		bg_color={0x000000,0.7},--background color (color and alpha seperately)
		--for gradient and set colors below, set colors the same for no gradient
		st_color={0xC7C7FF,1},--start color for gradient, green
		mid_color={0xf44336,1},--middle color for gradient, yellow
		end_color={0xf44336,1},--end color for gradient, red
		point_color={0xf44336,1},--pointer color
		pointer_length=40-5,
		pointer_middle_radius=5,
		want_text=0,--1 for text label, 0 for no text label.  if 0 then delete following entries
		text="CPU: 0",
		text_font="Mono",
		text_size=11,
		text_start_angle=270,
		text_end_angle=318,
		text_radius=40+5,
		text_color={0xFFFFFF,1},--text color
		add_zero=1,--adds zeros to the variable so that text does not move
		};gauge(setup)
		
		setup={
		center_point_x=275,
		center_point_y=90,
		gauge_radius=40,
		number_of_dots=20,
		dot_radius=2,
		start_angle=270,
		end_angle=450,--make end angle greater than start angle
		conky_variable=tonumber(conky_parse("${cpu cpu1}")),
		max_value=100, -- max value of above variable
		bg_color={0x000000,0.7},--background color (color and alpha seperately)
		--for gradient and set colors below, set colors the same for no gradient
		st_color={0xC7C7FF,1},--start color for gradient, green
		mid_color={0xf44336,1},--middle color for gradient, yellow
		end_color={0xf44336,1},--end color for gradient, red
		point_color={0xf44336,1},--pointer color
		pointer_length=40-5,
		pointer_middle_radius=5,
		want_text=0,--1 for text label, 0 for no text label.  if 0 then delete following entries
		text="CPU: 0",
		text_font="Mono",
		text_size=11,
		text_start_angle=270,
		text_end_angle=318,
		text_radius=40+5,
		text_color={0xFFFFFF,1},--text color
		add_zero=1,--adds zeros to the variable so that text does not move
		};gauge(setup)
		
		setup={
		center_point_x=112,
		center_point_y=208,
		gauge_radius=40,
		number_of_dots=20,
		dot_radius=2,
		start_angle=270,
		end_angle=450,--make end angle greater than start angle
		conky_variable=tonumber(conky_parse("${cpu cpu2}")),
		max_value=100, -- max value of above variable
		bg_color={0x000000,0.7},--background color (color and alpha seperately)
		--for gradient and set colors below, set colors the same for no gradient
		st_color={0xC7C7FF,1},--start color for gradient, green
		mid_color={0xf44336,1},--middle color for gradient, yellow
		end_color={0xf44336,1},--end color for gradient, red
		point_color={0xf44336,1},--pointer color
		pointer_length=40-5,
		pointer_middle_radius=5,
		want_text=0,--1 for text label, 0 for no text label.  if 0 then delete following entries
		text="CPU: 0",
		text_font="Mono",
		text_size=11,
		text_start_angle=270,
		text_end_angle=318,
		text_radius=40+5,
		text_color={0xFFFFFF,1},--text color
		add_zero=1,--adds zeros to the variable so that text does not move
		};gauge(setup)
		
		setup={
		center_point_x=275,
		center_point_y=208,
		gauge_radius=40,
		number_of_dots=20,
		dot_radius=2,
		start_angle=270,
		end_angle=450,--make end angle greater than start angle
		conky_variable=tonumber(conky_parse("${cpu cpu3}")),
		max_value=100, -- max value of above variable
		bg_color={0x000000,0.7},--background color (color and alpha seperately)
		--for gradient and set colors below, set colors the same for no gradient
		st_color={0xC7C7FF,1},--start color for gradient, green
		mid_color={0xf44336,1},--middle color for gradient, yellow
		end_color={0xf44336,1},--end color for gradient, red
		point_color={0xf44336,1},--pointer color
		pointer_length=40-5,
		pointer_middle_radius=5,
		want_text=0,--1 for text label, 0 for no text label.  if 0 then delete following entries
		text="CPU: 0",
		text_font="Mono",
		text_size=11,
		text_start_angle=270,
		text_end_angle=318,
		text_radius=40+5,
		text_color={0xFFFFFF,1},--text color
		add_zero=1,--adds zeros to the variable so that text does not move
		};gauge(setup)		
		--copy and paste above for additional gauge
		--#########################################################################################################
		--#########################################################################################################
	end-- if updates>5
	
	cairo_destroy(cr)
	cairo_surface_destroy(cs)
	cr=nil
end-- end main function

function rgb_to_r_g_b(col_a)
	return ((col_a[1] / 0x10000) % 0x100) / 255., ((col_a[1] / 0x100) % 0x100) / 255., (col_a[1] % 0x100) / 255., col_a[2]
end

function addzero100(num)
	if tonumber(num) < 10 then
		return "00" .. num
	elseif tonumber(num) <100 then
		return "0" .. num
	else
		return num
	end
end

function string:split(delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( self, delimiter, from  )
	
	while delim_from do
		table.insert( result, string.sub( self, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( self, delimiter, from  )
	end
	
	table.insert( result, string.sub( self, from  ) )
	return result
end

function gauge(t)
	local cx=t.center_point_x
	local cy=t.center_point_y
	local gr=t.gauge_radius
	local dr=t.dot_radius
	local sa=t.start_angle
	local ea=t.end_angle
	local nd=t.number_of_dots
	
	if t.conky_variable==nil then cv=0 else cv=t.conky_variable end
	
	local br,bg,bb,ba=rgb_to_r_g_b(t.bg_color)
	local str,stg,stb,sta=rgb_to_r_g_b(t.st_color)
	local mr,mg,mb,ma=rgb_to_r_g_b(t.mid_color)
	local fr,fg,fb,fa=rgb_to_r_g_b(t.end_color)
	local pr,pg,pb,pa=rgb_to_r_g_b(t.point_color)
	local pl=t.pointer_length
	local pm=t.pointer_middle_radius
	local mv=t.max_value
	local dotnum=(cv/mv)*nd
	
	for i=0,nd do
		if i<(nd/2) and i<=dotnum then
			colr=((mr-str)*(i/(nd/2)))+str
			colg=((mg-stg)*(i/(nd/2)))+stg
			colb=((mb-stb)*(i/(nd/2)))+stb
			cola=((ma-sta)*(i/(nd/2)))+sta
		elseif i>=(nd/2) and i<=dotnum then
			colr=((fr-mr)*((i-(nd/2))/(nd/2)))+mr
			colg=((fg-mg)*((i-(nd/2))/(nd/2)))+mg
			colb=((fb-mb)*((i-(nd/2))/(nd/2)))+mb
			cola=((fa-ma)*((i-(nd/2))/(nd/2)))+ma
		else
			colr=br
			colg=bg
			colb=bb
			cola=ba
		end
		garc=((2*math.pi)/(360))*((((ea-sa)/nd)*(i))+sa)
		gx=0+gr*(math.sin(garc))
		gy=0-gr*(math.cos(garc))
		cairo_arc (cr,cx+gx,cy+gy,dr,0,2*math.pi)
		cairo_set_source_rgba (cr,colr,colg,colb,cola)
		cairo_fill (cr)
	end
	--draw pointer
	parc=((2*math.pi)/(360))*((((ea-sa)/mv)*(cv))+sa)
	px=0+pl*(math.sin(parc))
	py=0-pl*(math.cos(parc))
	cairo_move_to (cr,cx+px,cy+py)
	marc=((2*math.pi)/(360))*(((((ea-sa)/mv)*(cv))+sa)-90)
	mx=0+pm*(math.sin(marc))
	my=0-pm*(math.cos(marc))
	cairo_line_to (cr,cx+mx,cy+my)
	cairo_arc_negative (cr,cx,cy,pm,marc+math.pi+((math.pi/180)*90),marc+((math.pi/180)*90))
	cairo_line_to (cr,cx+px,cy+py)
	cairo_set_line_width (cr,0)
	cairo_set_source_rgba (cr,pr,pg,pb,pa)
	cairo_fill (cr)
	if t.want_text==1 then
		if t.add_zero==1 then
			text=t.text .. " " .. addzero100(cv) .. "%"
		else
			text=t.text .. " " .. (cv) .. "%"
		end
		local tf=t.text_font
		local ts=t.text_size
		local tsa=t.text_start_angle
		local tea=t.text_end_angle
		local tra=t.text_radius
		local tr,tg,tb,ta=rgb_to_r_g_b(t.text_color)
		local inum=string.len(text)
		deg=(tea-tsa)/(inum-1)
		degrads=1*(math.pi/180)
		local textcut=string.gsub(text, ".", "%1|")
		local texttable=string.split(textcut, "|")
		for i = 1,inum do
			interval=(degrads*(tsa+(deg*(i-1))))
    			txs=0+tra*(math.sin(interval))
    			tys=0-tra*(math.cos(interval))
    			cairo_select_font_face (cr, tf, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    			cairo_set_font_size (cr, ts);
    			cairo_set_source_rgba (cr,tr,tg,tb,ta);
    			cairo_move_to (cr, txs+cx, tys+cy);
    			cairo_rotate (cr, interval)
    			cairo_show_text (cr, (texttable[i]))
    			cairo_rotate (cr, -interval)
		end--for
	end--if want text
end
