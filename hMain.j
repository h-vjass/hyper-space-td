
//载入 h-vjass
#include "../h-vjass/h-vjass.j"
#include "global.j"
#include "env.j"
#include "set.j"

//载入 房间音乐
function hBgm takes string s returns nothing
	local string uri = "war3mapImported\\main.mp3"	//这个路径你可以播放默认的音乐（在F5）也可以播放F12导入的音乐
	call SetMapDescription(s)
	call PlayMusic(uri)
	set uri = null
endfunction
#define SetMapDescription(s) hBgm(s)

library Main initializer init needs hJass

	//预读
	private function preread takes nothing returns nothing
	    local integer i = 0
	    local integer total = 0
	    local unit array prereadUnits
		//
	    set i = g_token_count
	    loop
	        exitwhen i<=0
				set total = total+1
	            set prereadUnits[total] = CreateUnitAtLoc(player_passive, g_token[i], Loc_C, bj_UNIT_FACING)
	            call hattr.regAllAttrSkill(prereadUnits[total])
	        set i = i-1
	    endloop
	    set i = g_hero_count
	    loop
	        exitwhen i<=0
				set total = total+1
	            set prereadUnits[total] = CreateUnitAtLoc(player_passive, g_hero[i], Loc_C, bj_UNIT_FACING)
				set g_mon_label[i] = GetUnitName(prereadUnits[total])
	            call hattr.regAllAttrSkill(prereadUnits[total])
	        set i = i-1
	    endloop
	    set i = g_boss_count
	    loop
	        exitwhen i<=0
				set total = total+1
	            set prereadUnits[total] = CreateUnitAtLoc(player_passive, g_boss[i], Loc_C, bj_UNIT_FACING)
				set g_boss_label[i] = GetUnitName(prereadUnits[total])
	            call hattr.regAllAttrSkill(prereadUnits[total])
	        set i = i-1
	    endloop
	    set i = g_mon_count
	    loop
	        exitwhen i<=0
				set total = total+1
	            set prereadUnits[total] = CreateUnitAtLoc(player_passive, g_mon[i], Loc_C, bj_UNIT_FACING)
	            call hattr.regAllAttrSkill(prereadUnits[total])
	        set i = i-1
	    endloop
	    set i = g_summon_count
	    loop
	        exitwhen i<=0
				set total = total+1
	            set prereadUnits[total] = CreateUnitAtLoc(player_passive, g_summon[i], Loc_C, bj_UNIT_FACING)
	            call hattr.regAllAttrSkill(prereadUnits[total])
	        set i = i-1
	    endloop
	    set i = momentItems_count
	    loop
	        exitwhen i<=0
				set total = total+1
	            set prereadUnits[total] = CreateUnitAtLoc(player_passive, momentItems[i], Loc_C, bj_UNIT_FACING)
	            call hattr.regAllAttrSkill(prereadUnits[total])
	        set i = i-1
	    endloop
		//todo * key code 
	    call PolledWait(0.01)
	    set i = total
	    loop
	        exitwhen i<=0
	            call hunit.del(prereadUnits[i],0)
				set prereadUnits[i] = null
	        set i = i-1
	    endloop
	endfunction

	private function fail takes nothing returns nothing
		local integer i = player_max_qty
		loop
			exitwhen i<=0
				call hplayer.defeat(players[i], "守护失败")
			set i = i-1
		endloop
	endfunction

	private function timeRingBreak takes nothing returns nothing
		local unit u = hevent.getTriggerUnit()
		local MovieDialogue dia = MovieDialogue.create()
		local trigger tg = null
		local location loc = null
		local string txt = null
		local integer i = 0
		set g_mon_isrunning = false
		call htime.delTimer(g_timer_wave)
		//爆炸
		call SetCameraTargetController( u, 0, 0, false )
		call CameraSetupApplyForceDuration( gg_cam_cam_c, true, 0.00 )
		set loc = GetUnitLoc(u)
		call heffect.toLoc("war3mapImported\\ExplosionBIG.mdl",loc,0)
		call RemoveLocation(loc)
		call PolledWait( 2.00 )
		//BGM走起
		call hmedia.bgm(gg_snd_defeat)
		//镜头
		call CameraSetupApplyForceDuration( gg_cam_cam_lost1, true, 0.00 )
		call CameraSetupApplyForceDuration( gg_cam_cam_lost2, true, 5.00 )
		call CameraSetupApplyForceDuration( gg_cam_cam_lost3, true, 10.00 )
		//生成长老
		call hSet.failEnv()
		set u = hunit.createUnitXYFacing(player_ally,'n002',4663,1407, 180)
		set dia[1] = "时空之轮破碎了！惨烈！"
		set dia[2] = "情况已经没法挽救了，任务失败！～"
		set dia[5] = null
		call hSync_moive2force(playerForce,u,dia)
		call hunit.del(u,10.00)
		call ResetToGameCamera( 1.00 )
		call dia.destroy()
		set u_zhanglao = hunit.createUnitXYFacing(player_passive,'n002',6306,-1920, 150)
		//
		// 失败提醒
		call hmark.display(null,"war3mapImported\\defeat.blp",1.0,6.0,100.0,100.0)
		//
		call htime.setTimeout(15.00, function fail)
		set u = null
		set tg = null
		set loc = null
		set txt = null
	endfunction

	private function timeRingBreakSub takes nothing returns nothing
		call hmsg.echo("|cffffff80混沌魔怪打破了一个时空之轮！士气大增，更加凶狠了！")
		set g_ring_break_up = g_ring_break_up + 0.11
	endfunction

	private function myleaderboard takes nothing returns nothing
		local integer i = 0
		if(g_leaderboard == null)then
			set g_leaderboard = CreateLeaderboard()
			call LeaderboardSetLabel(g_leaderboard, g_diff_label[g_diff])
			call ForceSetLeaderboardBJ(g_leaderboard, GetPlayersAll())
			set i = 1
			loop
				exitwhen i>player_max_qty
					call LeaderboardAddItemBJ(players[i], g_leaderboard, GetPlayerName(players[i]), hplayer.getKill(players[i]) )
				set i=i+1
			endloop
			call LeaderboardDisplay(g_leaderboard, true)
		endif
		if(g_leaderboard != null)then
			set i = 1
			loop
				exitwhen i>player_max_qty
    				call LeaderboardSetPlayerItemValueBJ(players[i], g_leaderboard, hplayer.getKill(players[i]) )
				set i=i+1
			endloop
			call LeaderboardSortItemsBJ( g_leaderboard, bj_SORTTYPE_SORTBYVALUE, false )
		endif
	endfunction

	private function openSpace takes nothing returns nothing
		if (g_wave == g_first_wave)then
			call PingMinimapLocForForceEx( playerForce,Loc_C,5, bj_MINIMAPPINGSTYLE_FLASHY, 100, 0, 0 )
			call hSet.firstWave()
			call QuestSetCompleted( q_into_space, true )
			call QuestMessageBJ( playerForce, bj_QUESTMESSAGE_COMPLETED, "混沌开始!" )
			//排行榜
			call htime.setInterval(2.5,function myleaderboard)
			// call hmedia.hanabi(rectHanabi,30.0)
		endif
	endfunction

	private function difcSelectDialog takes nothing returns nothing
		local dialog d = GetClickedDialog()
		local button b = GetClickedButton()
		local integer bi = LoadInteger(hash_player,GetHandleId(b),7)
		set g_diff = bi
		if(g_diff == 2)then
			set g_boss_ready_time = 90
			set g_game_mon_loop = g_game_mon_loop - 0.75
			call hmsg.echo("选择了难度|cffffff80（"+g_diff_label[g_diff]+"）|r")
		elseif(g_diff == 3)then
			set g_boss_ready_time = 60
			set g_game_mon_loop = g_game_mon_loop - 1.50
			call hmsg.echo("选择了难度|cffff0000（"+g_diff_label[g_diff]+"）|r")
		else
			set g_boss_ready_time = 120
			set g_game_mon_loop = g_game_mon_loop
			call hmsg.echo("选择了难度|cff00ff00（"+g_diff_label[g_diff]+"）|r")
		endif
		call FlushChildHashtable(hash_player, GetHandleId(b))
		call DialogClear( d )
		call DialogDestroy( d )
		call DisableTrigger(GetTriggeringTrigger())
		call DestroyTrigger(GetTriggeringTrigger())
		set d = null
		set b = null
		set g_first_wave = 0
		set g_wave = 0
		call openSpace()
	endfunction

	private function openRect takes nothing returns nothing
		local trigger tg = null
		local string txt = null
		local dialog d = null
		local button b = null
		local trigger dtg = null
		local integer i = 0
		local integer dalaoWave = 0
		call htime.delTimer(GetExpiredTimer())
		call hmsg.echo("时空之轮已经召唤！"+"|cffffff80 守卫它！|r")
		call PingMinimapLocForForceEx( playerForce,Loc_Ring,5, bj_MINIMAPPINGSTYLE_FLASHY, 100, 0, 0 )
		//
		set u_timering = hunit.createUnit(player_ally, 'n00Z', Loc_Ring)
		call hevent.onDead(u_timering,function timeRingBreak)
		// 任务F9提醒
		set txt = ""
		set txt = txt + "抵御时空境域内顺流逆流的敌人"
		set txt = txt + "|n英雄按 B 即可建造兵塔，兵塔会吸收作战经验成长也可以转职为强力兵塔"
		set txt = txt + "|n兵塔在杀敌时有可能获得成长！Lv9满级"
		set txt = txt + "|n加油吧～"
		// call hunit.exploded(u_timering,15.00) // 测试失败用
		
		// $ 继承关
		// 先找出所有玩家里玩得最好的
		set dalaoWave = 0
		set i = 1
		loop
			exitwhen(i>player_max_qty)
				if (player_prolv[i] > dalaoWave and GetPlayerController(players[i]) == MAP_CONTROL_USER and GetPlayerSlotState(players[i]) == PLAYER_SLOT_STATE_PLAYING) then
					set dalaoWave = player_prolv[i]
				endif
			set i=i+1
		endloop
		if(dalaoWave > 0)then
			call hmsg.echo("队伍里有大佬曾经达到了第 "+I2S(dalaoWave)+" 波,奖励全员 |cffffff80"+I2S(dalaoWave*20)+"|r 金币")
			set i = 1
			loop
				exitwhen(i>player_max_qty)
					call hplayer.addGold(players[i],dalaoWave*20)
				set i=i+1
			endloop
		endif

		// 选难度
		set d = DialogCreate()
		call DialogSetMessage( d, "选择难度" )
		set b = DialogAddButton(d,"简单",0)
		call SaveInteger(hash_player,GetHandleId(b),7,1)
		set b = DialogAddButton(d,"困难",0)
		call SaveInteger(hash_player,GetHandleId(b),7,2)
		set b = DialogAddButton(d,"地狱",0)
		call SaveInteger(hash_player,GetHandleId(b),7,3)
		set dtg = CreateTrigger()
		call TriggerAddAction(dtg, function difcSelectDialog)
		call TriggerRegisterDialogEvent( dtg , d )
		set i = 1
		loop
			exitwhen(i>player_max_qty)
				if (hplayer.getStatus(players[i]) == "游戏中") then
					call DialogDisplay(players[i],d, true )
					call DoNothing() YDNL exitwhen true//(  )
				endif
			set i=i+1
		endloop

		set tg = null
		set txt = null
		set d = null
		set b = null
		set dtg = null
	endfunction

	//游戏开始0秒
	private function start takes nothing returns nothing
		local integer i = 0
		local integer j = 0
		local unit u = null
		local timer t = null
		local real chooseTime = 60
		local MovieDialogue dia = MovieDialogue.create()
		local string giftTxt = null
		local string txt = null
		local real stopX = 1540.00
		local real stopY = 1400.00
		// bgm stop
		call hmedia.bgmStop()
		// 死亡轮
		set u_dead_timering[0] = 'n05N'
		set u_dead_timering[1] = 'n04Y'
		set u_dead_timering[2] = 'n058'
		set u_dead_timering[3] = 'n059'
		set u_dead_timering[4] = 'n057'
		set u_dead_timering[5] = 'n04X'
		// 循环设定玩家参数
		set i = player_max_qty
		loop
			exitwhen i<=0
				set H_MAP_LV[i] = DzAPI_Map_GetMapLevel(players[i])
				if(DzAPI_Map_HasMallItem(players[i], "FGA") == true)then
					set player_isvip[i] = true
					set giftTxt = "永久"
				elseif(DzAPI_Map_HasMallItem(players[i], "FG7") == true)then
					set player_isvip[i] = true
					set giftTxt = "7天"
				elseif(DzAPI_Map_HasMallItem(players[i], "FG3") == true)then
					set player_isvip[i] = true
					set giftTxt = "3天"
				else
					set player_isvip[i] = false
				endif
				// 获取玩家最高纪录
				if(GetPlayerServerValueSuccess(players[i]) == true)then
					set player_prolv[i] = DzAPI_Map_GetStoredInteger(players[i], "wavelevel")
					if(player_prolv[i]<=0)then
						set player_prolv[i] = 0
					endif
				endif
				call hplayer.setLumberRatio(players[i],50.0+50.0*player_current_qty,0)
				call hplayer.setExpRatio(players[i],75.0+25.0*player_current_qty,0)
				if(player_isvip[i] == true)then
					call hplayer.setGold(players[i],2500)
					call hplayer.setLumber(players[i],0)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_RESOURCE_FOOD_CAP,4)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_FOOD_CAP_CEILING,50)
					call hhero.setPlayerAllowQty(players[i],2)
					call hplayer.setGoldRatio(players[i],93.0+15*player_current_qty,0)
					call hmsg.echoTo(players[i], " # 您是支持|cffffffcc抢先体验包("+giftTxt+")用户|r，拥有更多的资源、全部测试许可，以及所有后续版本内容!感谢您的支持 ^_^", 0)
					// 获得所有的升级科技和体验包
					call SetPlayerTechResearchedSwap( 'R001', 1, players[i] ) // 体验
					set j = 2
					loop
						exitwhen j > g_gift_count
							call SetPlayerTechResearchedSwap(H_MAP_LV_GIFT[j], 1, players[i] )
						set j=j+1
					endloop
				else
					call hplayer.setGold(players[i],1200)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_RESOURCE_FOOD_CAP,4)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_FOOD_CAP_CEILING,20)
					call hhero.setPlayerAllowQty(players[i],1)
					call hplayer.setGoldRatio(players[i],85.0+15*player_current_qty,0)
					call hmsg.echoTo(players[i], " # 您是|cffccffff免费游玩|r的玩家，所以部分游戏内容需要等待后续更新开放。如果您想抢先体验，可购买抢先体验包支持作者 ^_^", 0)
					// 获得对应的升级科技
					set j = 2
					loop
						exitwhen j > H_MAP_LV[i]
							call SetPlayerTechResearchedSwap(H_MAP_LV_GIFT[j], 1, players[i] )
						set j=j+1
					endloop
				endif
				if(H_MAP_LV[i] <= 1)then
					call hplayer.addGold(players[i],1000)
					call hmsg.echoTo(players[i], " # 由于您是|cffccffcc新手玩家|r，所以获赠额外的1000黄金，熟悉游戏 ^_^", 0)
				endif
			set i = i-1
		endloop
		// 任务F9提醒
		set txt = ""
		set txt = txt + "购买抢先体验包,支持作者 ^_^"
		set txt = txt + "|n你将会获得以下奖励："
		set txt = txt + "|n1. 所有关卡及地图内容设定"
		set txt = txt + "|n2. 地图特定内容的变动和隐藏彩蛋"
		set txt = txt + "|n3. 后续所有地图更新内容"
		set txt = txt + "|n4. 多英雄选择权，更多的人口上限"
		set txt = txt + "|n5. 完整的资源，8%的黄金获取加成"
		set txt = txt + "|n6. 所有需要地图等级才能获得的奖励"
		set txt = txt + "|n再次感谢～您的支持～"
		call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "感谢你的支持！",txt, "ReplaceableTextures\\CommandButtons\\BTNUnsummonBuilding.blp" )
		call FlashQuestDialogButton()
		//设定作为敌人的电脑玩家
		call henemy.setIsShareView(true)
		call henemy.setEnemyName("混沌魔军")
		call henemy.setEnemyPlayer(players[5])
		call henemy.setEnemyPlayer(players[6])
		call henemy.setEnemyPlayer(players[7])
		call henemy.setEnemyPlayer(players[8])
		call henemy.setEnemyPlayer(players[9])
		call henemy.setEnemyPlayer(players[10])
		call henemy.setEnemyPlayer(players[11])
		call SetPlayerTechResearchedSwap( 'R002', 1, players[5] )
		call SetPlayerTechResearchedSwap( 'R002', 1, players[6] )
		call SetPlayerTechResearchedSwap( 'R002', 1, players[7] )
		call SetPlayerTechResearchedSwap( 'R002', 1, players[8] )
		call SetPlayerTechResearchedSwap( 'R002', 1, players[9] )
		call SetPlayerTechResearchedSwap( 'R002', 1, players[10] )
		call SetPlayerTechResearchedSwap( 'R002', 1, players[11] )
		// 白熊
		//call henemy.createUnitXY('n00F', -1398,-1843)
		//call henemy.createUnitXY('n00F', -1398,-1843)
		//call henemy.createUnitXY('n00F', -1398,-1843)
		//call henemy.createUnitXY('n00F', -1398,-1843)
		//call henemy.createUnitXY('n00F', -1398,-1843)
		//call henemy.createUnitXY('n00F', -1398,-1843)
		
		//call hunit.createUnitXY(players[1],'n00F',-1398,-1843)
		//call hunit.createUnitXY(players[1],'n00F',-1398,-1843)
		//call hunit.createUnitXY(players[1],'n00F',-1398,-1843)
		//call hunit.createUnitXY(players[1],'n00F',-1398,-1843)
		//call hunit.createUnitXY(players[1],'n00F',-1398,-1843)
		
		//set u = henemy.createUnitXY(g_boss[120/5],-1211,-1290)
        //call hattr.addAttackPhysical(u,1000.0,0)
        //call hattr.addLife(u,100000.0,0)
        //call hattr.setMana(u,100.0,0)
		//call hGlobals.bossBuilt(u)
		
		
		//hSet
		call hSet.setInit()

		//BGM走起
		call dia.destroy()

		//将英雄类型写进酒馆，并生成选英雄
		if(hconsole.isOpenDebug() == true)then
			set chooseTime = 21.0
		endif
		set i = g_hero_count
		loop
			exitwhen i<=0
				call hhero.push(g_hero[i])
			set i=i-1
		endloop
		call hhero.setDrunkeryID('n003')
		call hhero.setBornXY(GetLocationX(Loc_JiuGuanBorn),GetLocationY(Loc_JiuGuanBorn))
		call hhero.setBuildXY(GetLocationX(Loc_JiuGuan),GetLocationY(Loc_JiuGuan))
		call hhero.setBuildDistance(200.00)
		call hhero.buildDrunkery(chooseTime)
		call htime.setTimeout(chooseTime + 1.5,function openRect)
		
		// 商店们
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n04S', stopX+128*0,stopY))
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n04T', stopX+128*1,stopY))
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n04V', stopX+128*2,stopY))
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n040', stopX+128*3,stopY))
		// 可爱信使
		set i = player_max_qty
		loop
			exitwhen i<=0
				if(player_isvip[i] == true and hplayer.getStatus(players[i])==hplayer.default_status_gaming)then // vip才有
					call hunit.createUnitXY(players[i],'n04Z',GetLocationX(Loc_JiuGuanBorn),GetLocationY(Loc_JiuGuanBorn))
				endif
			set i=i-1
		endloop
		// clear
		set u = null
		set t = null
		set giftTxt = null
		set txt = null
	endfunction

	private function init takes nothing returns nothing
		local trigger startTrigger = null
		local MyEnv myenv
		local hGlobals hg
		local real i = 0
		//globals
		set player_max_qty = 4
		set hg = hGlobals.create()
		call hg.do()
		// 随机地形
		set i = 0
		loop
			exitwhen i > 10
				call htime.setTimeout(i,function MyEnv.randomEnv)
			set i = i + 1
		endloop
		//预读
		call preread()
		//镜头模式
		call hcamera.setModel("normal")
		//属性 - 硬直条
		call hattrUnit.punishTtgIsOpen(false)
		//禁止反补
		call hattrUnit.setAllowDenied(false)
		//资源共享范围
		call haward.setRange(800)
		call hplayer.setConvertRatio(10000)
		//开启日志
		call hconsole.openDebug(false)
		// call FogEnable( false )
		// call FogMaskEnable( false )
		//开始触发
		set startTrigger = CreateTrigger()
	    call TriggerRegisterTimerEventSingle( startTrigger, 0.1 )
	    call TriggerAddAction(startTrigger, function start)
		set startTrigger = null
    endfunction

endlibrary
//最后一行必须留空请勿修改
