//环境
globals
integer myenv_block = 'LTba'
integer myenv_cage = 'LOcg'
integer myenv_bucket1 = 'LTbr'
integer myenv_bucket2 = 'LTbx'
integer myenv_bucket3 = 'LTbs'
integer myenv_box = 'LTcr'
integer myenv_brust_bucket = 'LTex'
integer myenv_support_column = 'BTsc'
integer myenv_stone = 'LTrc'
integer myenv_stone_red = 'DTrc'
integer myenv_stone_ice = 'ITcr'
integer myenv_ice1 = 'ITf1'
integer myenv_ice2 = 'ITf2'
integer myenv_ice3 = 'ITf3'
integer myenv_ice4 = 'ITf4'
integer myenv_spider_eggs = 'DTes'
integer myenv_volcano = 'Volc' // 火山
integer myenv_tree_summer = 'LTlt'
integer myenv_tree_autumn = 'FTtw'
integer myenv_tree_winter = 'WTtw'
integer myenv_tree_winter_show = 'WTst'
integer myenv_tree_dark = 'NTtw' // 枯枝
integer myenv_tree_dark_umbrella = 'NTtc' // 伞
integer myenv_tree_poor = 'BTtw' // 贫瘠
integer myenv_tree_poor_umbrella = 'BTtc' // 伞
integer myenv_tree_ruins = 'ZTtw' // 遗迹
integer myenv_tree_ruins_umbrella = 'ZTtc' // 伞
integer myenv_tree_fire = 'ZTtw' // 炼狱
integer myenv_tree_underground1 = 'DTsh' // 地下城
integer myenv_tree_underground2 = 'GTsh' // 地下城

integer myenv_ground_summer = 'Adrg'
integer myenv_ground_autumn = 'Ydtr'
integer myenv_ground_winter = 'Agrs'
integer myenv_ground_winter_show = 'Agrs'
integer myenv_ground_dark = 'Xblm'
integer myenv_ground_poor = 'Adrd'
integer myenv_ground_ruins = 'Xhdg'
integer myenv_ground_fire = 'Yblm'
integer myenv_ground_underground = 'Yrtl'

group myenv_u_group = CreateGroup()
integer myenv_u_ice1 = 'n00K'
integer myenv_u_ice2 = 'n00J'
integer myenv_u_ice3 = 'n00H'
integer myenv_u_ice4 = 'n00I'
integer myenv_u_fire_hole = 'n00U'
integer myenv_u_break_column1 = 'n00L'
integer myenv_u_break_column2 = 'n00M'
integer myenv_u_burn_build = 'n00T'
integer myenv_u_burn_body = 'n00V'
integer myenv_u_rune1 = 'n00O'
integer myenv_u_rune2 = 'n00P'
integer myenv_u_rune3 = 'n00Q'
integer myenv_u_bone1 = 'n00R'
integer myenv_u_bone2 = 'n00S'
integer myenv_u_fire = 'n00N'
integer myenv_u_stone_show1 = 'n00D'
integer myenv_u_stone_show2 = 'n00E'
integer myenv_u_stone_show3 = 'n00G'
integer myenv_u_mushroom1 = 'n00W'
integer myenv_u_mushroom2 = 'n00X'
integer myenv_u_mushroom3 = 'n00Y'
integer myenv_u_flower1 = 'n005'
integer myenv_u_flower2 = 'n007'
integer myenv_u_flower3 = 'n008'
integer myenv_u_flower4 = 'n009'
integer myenv_u_flower5 = 'n00A'
integer myenv_u_typha1 = 'n00B'
integer myenv_u_typha2 = 'n00C'

integer myenv_randomIndex = 0
integer myenv_weatherIndex = 0

endglobals

type MyEnvUnit extends integer array[20] // 最大支持20种单位
type MyEnvDestructable extends integer array[10] // 最大支持10种可破坏物

struct MyEnv

	private static method removeEnumDestructable takes nothing returns nothing
		call RemoveDestructable( GetEnumDestructable() )
	endmethod

	private static method build takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local real rectStartX = htime.getReal(t,1)
		local real rectStartY = htime.getReal(t,2)
		local real rectEndX = htime.getReal(t,3)
		local real rectEndY = htime.getReal(t,4)
		local real excludeX = htime.getReal(t,5)
		local real excludeY = htime.getReal(t,6)
		local integer euQty = htime.getInteger(t,7)
		local integer edQty = htime.getInteger(t,8)
		local integer indexX = htime.getInteger(t,9)
		local integer indexY = htime.getInteger(t,10)
		local boolean clear = htime.getBoolean(t,11)
		local integer whichGround = htime.getInteger(t,13)
		local integer uid = htime.getInteger(t,100+GetRandomInt(1,euQty))
		local integer did = htime.getInteger(t,200+GetRandomInt(1,edQty))
		local real midX = (rectEndX-rectStartX) * 0.5
		local real midY = (rectEndY-rectStartY) * 0.5
		local real x = rectStartX + indexX * 80
		local real y = rectStartY + indexY * 80
		local integer buildType = GetRandomInt(1,8)

		if(x >= rectEndX and y >= rectEndY) then
			call htime.delTimer(t)
			set t = null
			if (clear) then
				call RemoveRect( htime.getRect(t,12) )
			endif
			return
		endif
		if(uid <= 0 and did <= 0) then
			call htime.delTimer(t)
			set t = null
			if (clear) then
				call RemoveRect( htime.getRect(t,12) )
			endif
			return
		endif

		if(x >= rectEndX ) then
			call htime.setInteger(t,10,1+indexY)
			set indexX = -1
		endif
		if(y >= rectEndY ) then
			set indexY = -1
		endif
		call htime.setInteger(t,9,1+indexX)
		set t = null
		if(hlogic.rabs(x-midX) < (excludeX*0.5) and hlogic.rabs(y-midY) < (excludeY*0.5))then
			return
		endif
		//
		if(buildType <= 3 and uid <= 0)then
			set buildType = 4
		endif
		if(buildType == 4 and did <= 0)then
			set buildType = -1
		endif
		if(buildType == -1)then
			return
		endif
		//
		if(buildType <= 3)then
			call hunit.createUnitXY(players[12], uid, x,y)
			if(whichGround > 0 and GetRandomInt(1,2) == 2)then
				if(GetTerrainType(x, y) !='Ybtl')then
					call SetTerrainType( x , y, whichGround, -1, 1, 0 )
				else
					if (myenv_randomIndex == 1) then // summer
						call SetTerrainType( x , y, 'Avin', -1, 1, 0 )
					elseif(myenv_randomIndex == 2)then // autumn
						call SetTerrainType( x , y, 'Yrtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 3)then // winter
						call SetTerrainType( x , y, 'Xbtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 4)then // WinterShow
						call SetTerrainType( x , y, 'Xbtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 5)then // dark
						call SetTerrainType( x , y, 'Xblm', -1, 1, 0 )
					elseif(myenv_randomIndex == 6)then // poor
						call SetTerrainType( x , y, 'Yrtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 7)then // ruins
						//
					elseif(myenv_randomIndex == 8)then // fire
						call SetTerrainType( x , y, 'Yblm', -1, 1, 0 )
					elseif(myenv_randomIndex == 9)then // underground
						call SetTerrainType( x , y, 'Yrtl', -1, 1, 0 )
					endif
				endif
			endif
		elseif(buildType == 4)then
			call SetDestructableInvulnerable( CreateDestructable(did, x , y, GetRandomDirectionDeg(), GetRandomReal(0.5,1.1), 0 ), false )
			if(whichGround > 0)then
				if(GetTerrainType(x, y) !='Ybtl')then
					call SetTerrainType( x , y, whichGround, -1, 1, 0 )
				else
					if (myenv_randomIndex == 1) then // summer
						call SetTerrainType( x , y, 'Avin', -1, 1, 0 )
					elseif(myenv_randomIndex == 2)then // autumn
						call SetTerrainType( x , y, 'Yrtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 3)then // winter
						call SetTerrainType( x , y, 'Xbtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 4)then // WinterShow
						call SetTerrainType( x , y, 'Xbtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 5)then // dark
						call SetTerrainType( x , y, 'Xblm', -1, 1, 0 )
					elseif(myenv_randomIndex == 6)then // poor
						call SetTerrainType( x , y, 'Yrtl', -1, 1, 0 )
					elseif(myenv_randomIndex == 7)then // ruins
						//
					elseif(myenv_randomIndex == 8)then // fire
						call SetTerrainType( x , y, 'Yblm', -1, 1, 0 )
					elseif(myenv_randomIndex == 9)then // underground
						call SetTerrainType( x , y, 'Yrtl', -1, 1, 0 )
					endif
				endif
			endif
		endif
	endmethod

	public static method clearUnits takes nothing returns nothing
		local unit tempUnit = null
		loop
			exitwhen(hgroup.isEmpty(myenv_u_group) == true)
				set tempUnit = FirstOfGroup(myenv_u_group)
				call hunit.del(tempUnit,0)
				call GroupRemoveUnit( myenv_u_group , tempUnit )
				set tempUnit = null
		endloop
		call GroupClear( myenv_u_group )
	endmethod

	public static method removeInRect takes rect whichRect returns nothing
		if(whichRect != null)then
			call EnumDestructablesInRectAll(whichRect, function thistype.removeEnumDestructable )
		endif
		set whichRect = null
	endmethod

	public static method removeInRange takes real x,real y,real width,real height returns nothing
		local rect whichRect = hrect.createInLoc(x,y,width,height)
		call EnumDestructablesInRectAll(whichRect, function thistype.removeEnumDestructable )
		call hrect.del(whichRect)
		set whichRect = null
	endmethod

	public static method random takes rect whichRect,MyEnvUnit whichUnit,MyEnvDestructable whichDestructable,integer whichGround,real excludeX,real excludeY,boolean clear returns nothing
		local integer i = 0
		local real rectStartX = hrect.getStartX(whichRect)
		local real rectStartY = hrect.getStartY(whichRect)
		local real rectEndX = hrect.getEndX(whichRect)
		local real rectEndY = hrect.getEndY(whichRect)
		local integer euQty = 0
		local integer edQty = 0
		local timer t = null
		call EnumDestructablesInRectAll(whichRect, function thistype.removeEnumDestructable )
		set i = 1
	    loop
	        exitwhen i > 10
	        	if( whichUnit[i] <= 0 ) then
					call DoNothing() YDNL exitwhen true
	        	else
					set euQty = euQty+1
	        	endif
	        set i = i + 1
	    endloop
		set i = 1
	    loop
	        exitwhen i > 10
	        	if( whichDestructable[i] <= 0 ) then
					call DoNothing() YDNL exitwhen true
	        	else
					set edQty = edQty+1
	        	endif
	        set i = i + 1
	    endloop
		if(euQty>0 or edQty>0)then
			set t = htime.setInterval(0.01,function thistype.build)
			call htime.setReal(t,1,rectStartX)
			call htime.setReal(t,2,rectStartY)
			call htime.setReal(t,3,rectEndX)
			call htime.setReal(t,4,rectEndY)
			call htime.setReal(t,5,excludeX)
			call htime.setReal(t,6,excludeY)
			call htime.setInteger(t,7,euQty)
			call htime.setInteger(t,8,edQty)
			call htime.setInteger(t,9,-1)
			call htime.setInteger(t,10,-1)
			call htime.setBoolean(t,11,clear)
			call htime.setRect(t,12,whichRect)
			call htime.setInteger(t,13,whichGround)
			set i = euQty
			loop
				exitwhen i <= 0
					call htime.setInteger(t,100+i,whichUnit[i])
				set i = i - 1
			endloop
			set i = edQty
			loop
				exitwhen i <= 0
					call htime.setInteger(t,200+i,whichDestructable[i])
				set i = i - 1
			endloop
			set t = null
		endif
		call whichUnit.destroy()
		call whichDestructable.destroy()
		set whichRect = null
	endmethod

	private static method randomDefault takes rect whichRect,string typeStr,real excludeX,real excludeY,boolean clear returns nothing
		local MyEnvUnit whichUnit = MyEnvUnit.create()
		local MyEnvDestructable whichDestructable = MyEnvDestructable.create()
		local integer whichGround = 0
		if(typeStr == "summer")then
			set whichGround = myenv_ground_summer
			set whichUnit[1] = myenv_u_flower1
			set whichUnit[2] = myenv_u_flower2
			set whichUnit[3] = myenv_u_flower3
			set whichUnit[4] = myenv_u_flower4
			set whichUnit[5] = myenv_u_flower5
			set whichUnit[6] = 0
			set whichDestructable[1] = myenv_tree_summer
			set whichDestructable[2] = myenv_block
			set whichDestructable[3] = myenv_bucket1
			set whichDestructable[4] = myenv_bucket2
			set whichDestructable[5] = myenv_bucket3
			set whichDestructable[6] = myenv_stone
			set whichDestructable[7] = 0
		elseif(typeStr == "autumn")then
			set whichGround = myenv_ground_autumn
			set whichUnit[1] = myenv_u_flower1
			set whichUnit[2] = myenv_u_typha1
			set whichUnit[3] = myenv_u_typha2
			set whichUnit[4] = 0
			set whichDestructable[1] = myenv_tree_autumn
			set whichDestructable[2] = myenv_box
			set whichDestructable[3] = myenv_bucket1
			set whichDestructable[4] = myenv_bucket2
			set whichDestructable[5] = myenv_stone_red
			set whichDestructable[6] = myenv_cage
			set whichDestructable[7] = myenv_support_column
			set whichDestructable[8] = 0
		elseif(typeStr == "winter")then
			set whichGround = myenv_ground_winter
			set whichUnit[1] = myenv_u_stone_show1
			set whichUnit[2] = myenv_u_stone_show2
			set whichUnit[3] = myenv_u_stone_show3
			set whichUnit[4] = 0
			set whichDestructable[1] = myenv_tree_winter
			set whichDestructable[2] = myenv_tree_winter_show
			set whichDestructable[3] = myenv_cage
			set whichDestructable[4] = myenv_stone_ice
			set whichDestructable[5] = 0
		elseif(typeStr == "winterShow")then
			set whichGround = myenv_ground_winter
			set whichUnit[1] = myenv_u_ice1
			set whichUnit[2] = myenv_u_ice2
			set whichUnit[3] = myenv_u_ice3
			set whichUnit[4] = myenv_u_ice4
			set whichUnit[5] = 0
			set whichDestructable[1] = myenv_tree_winter_show
			set whichDestructable[2] = myenv_cage
			set whichDestructable[3] = myenv_stone_ice
			set whichDestructable[4] = 0
		elseif(typeStr == "dark")then
			set whichGround = myenv_ground_dark
			set whichUnit[1] = myenv_u_rune1
			set whichUnit[2] = myenv_u_rune2
			set whichUnit[3] = myenv_u_rune3
			set whichUnit[4] = 0
			set whichDestructable[1] = myenv_tree_dark
			set whichDestructable[2] = myenv_tree_dark_umbrella
			set whichDestructable[3] = myenv_cage
			set whichDestructable[4] = 0
		elseif(typeStr == "poor")then
			set whichGround = myenv_ground_poor
			set whichUnit[1] = myenv_u_bone1
			set whichUnit[2] = myenv_u_bone2
			set whichUnit[3] = 0
			set whichDestructable[1] = myenv_tree_poor
			set whichDestructable[2] = myenv_tree_poor_umbrella
			set whichDestructable[3] = myenv_cage
			set whichDestructable[4] = myenv_box
			set whichDestructable[5] = 0
		elseif(typeStr == "ruins")then
			set whichGround = myenv_ground_ruins
			set whichUnit[1] = myenv_u_break_column1
			set whichUnit[2] = myenv_u_break_column2
			set whichUnit[3] = 0
			set whichDestructable[1] = myenv_tree_ruins
			set whichDestructable[2] = myenv_tree_ruins_umbrella
			set whichDestructable[3] = myenv_cage
			set whichDestructable[4] = 0
		elseif(typeStr == "fire")then
			set whichGround = myenv_ground_fire
			set whichUnit[1] = myenv_u_burn_body
			set whichUnit[2] = myenv_u_burn_build
			set whichUnit[3] = 0
			set whichDestructable[1] = myenv_tree_fire
			set whichDestructable[2] = myenv_volcano
			set whichDestructable[3] = myenv_stone_red
			set whichDestructable[4] = myenv_stone_red
			set whichDestructable[5] = myenv_stone_red
			set whichDestructable[6] = myenv_stone_red
			set whichDestructable[7] = 0
		elseif(typeStr == "underground")then
			set whichGround = myenv_ground_underground
			set whichUnit[1] = myenv_u_mushroom1
			set whichUnit[2] = myenv_u_mushroom2
			set whichUnit[3] = myenv_u_mushroom3
			set whichUnit[4] = 0
			set whichDestructable[1] = myenv_tree_underground1
			set whichDestructable[2] = myenv_tree_underground2
			set whichDestructable[3] = myenv_spider_eggs
			set whichDestructable[4] = 0
		endif
		call thistype.random(whichRect,whichUnit,whichDestructable,whichGround,excludeX,excludeY,clear)
		call whichUnit.destroy()
		call whichDestructable.destroy()
		set whichRect = null
		set typeStr = null
	endmethod

	public static method randomSummer takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "summer", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomAutumn takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "autumn", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomWinter takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "winter", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomWinterShow takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "winterShow", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomDark takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "dark", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomPoor takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "poor", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomRuins takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "ruins", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomFire takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "fire", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomUnderground takes rect whichRect,real excludeX,real excludeY,boolean clear returns nothing
		call randomDefault(whichRect, "underground", excludeX, excludeY, clear)
		set whichRect = null
	endmethod

	public static method randomEnv takes nothing returns nothing
		local integer i = 0
		local integer rectQty = 18
		local integer rectArea = 0
		local real x = 2400
		local real y = 2400
		local rect tempRect = null
		local hWeatherBean wb = 0
		//
		if(myenv_randomIndex == 0)then
			set myenv_randomIndex = GetRandomInt(1,9)
			if (myenv_randomIndex == 1) then // summer
				set musicBattle = gg_snd_env_summer
			elseif(myenv_randomIndex == 2)then // autumn
				set musicBattle = gg_snd_env_autumn
			elseif(myenv_randomIndex == 3)then // winter
				set musicBattle = gg_snd_env_winter
			elseif(myenv_randomIndex == 4)then // WinterShow
				set musicBattle = gg_snd_env_winter_show
			elseif(myenv_randomIndex == 5)then // dark
				set musicBattle = gg_snd_env_dark
			elseif(myenv_randomIndex == 6)then // poor
				set musicBattle = gg_snd_env_poor
			elseif(myenv_randomIndex == 7)then // ruins
				set musicBattle = gg_snd_env_ruins
			elseif(myenv_randomIndex == 8)then // fire
				set musicBattle = gg_snd_env_fire
			elseif(myenv_randomIndex == 9)then // underground
				set musicBattle = gg_snd_env_underground
			endif
		endif
		//
		set i = 1
		loop
			exitwhen i>rectQty
				set rectArea = GetRandomInt(180,460)
				set hxy.x = GetRandomReal(GetRectMinX(GetPlayableMapRect()), GetRectMaxX(GetPlayableMapRect()))
				set hxy.y = GetRandomReal(GetRectMinY(GetPlayableMapRect()), GetRectMaxY(GetPlayableMapRect()))
				if(hxy.x > GetLocationX(Loc_Ring)-x/2 and hxy.x < GetLocationX(Loc_Ring)+x/2 and hxy.y > GetLocationY(Loc_Ring)-y/2 and hxy.y < GetLocationY(Loc_Ring)+y/2)then
					// nothing
				else
					set myenv_weatherIndex = GetRandomInt(1,3)
					set tempRect = hrect.createInLoc(hxy.x,hxy.y,rectArea,rectArea)
					set wb = hWeatherBean.create()
					set wb.x = hxy.x
					set wb.y = hxy.y
					set wb.width = rectArea
					set wb.height = rectArea
					if (myenv_randomIndex == 1) then
						call thistype.randomSummer(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.rain(wb)
							set rectWeatherString = "rain"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.rainstorm(wb)
							set rectWeatherString = "rainstorm"
						endif
					elseif (myenv_randomIndex == 2) then
						call thistype.randomAutumn(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.rain(wb)
							set rectWeatherString = "rain"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.wind(wb)
							set rectWeatherString = "wind"
						endif
					elseif (myenv_randomIndex == 3) then
						call thistype.randomWinter(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.snow(wb)
							set rectWeatherString = "snow"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.wind(wb)
							set rectWeatherString = "wind"
						endif
					elseif (myenv_randomIndex == 4) then
						call thistype.randomWinterShow(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.snowstorm(wb)
							set rectWeatherString = "snowstorm"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.windstorm(wb)
							set rectWeatherString = "windstorm"
						endif
					elseif (myenv_randomIndex == 5) then
						call thistype.randomDark(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.rain(wb)
							set rectWeatherString = "rain"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.mistblue(wb)
							set rectWeatherString = "mistblue"
						endif
					elseif (myenv_randomIndex == 6) then
						call thistype.randomPoor(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.wind(wb)
							set rectWeatherString = "wind"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.windstorm(wb)
							set rectWeatherString = "windstorm"
						endif
					elseif (myenv_randomIndex == 7) then
						call thistype.randomRuins(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.rain(wb)
							set rectWeatherString = "rain"
						elseif (myenv_weatherIndex == 2) then
							set rectWeathereffect = hweather.rainstorm(wb)
							set rectWeatherString = "rainstorm"
						elseif (myenv_weatherIndex == 3) then
							set rectWeathereffect = hweather.mistgreen(wb)
							set rectWeatherString = "mistgreen"
						endif
					elseif (myenv_randomIndex == 8) then
						call thistype.randomFire(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.mistred(wb)
							set rectWeatherString = "mistred"
						endif
					elseif (myenv_randomIndex == 9) then
						call thistype.randomUnderground(tempRect,x,y,true)
						if (myenv_weatherIndex == 1) then
							set rectWeathereffect = hweather.shield(wb)
							set rectWeatherString = "shield"
						endif
					endif
					set tempRect = null
					call wb.destroy()
					set i=i+1
				endif
		endloop
	endmethod

endstruct
