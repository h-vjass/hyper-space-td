
//载入 h-vjass
#include "../h-vjass/h-vjass.j"
#include "global.j"
#include "set.j"

//载入 房间音乐
function hBgm takes string s returns nothing
	local string uri = "main.mp3"	//这个路径你可以播放默认的音乐（在F5）也可以播放F12导入的音乐
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
		local MovieDialogue dia = MovieDialogue.create()
		local integer i = 0
		call DisableTrigger(GetTriggeringTrigger())
		call DestroyTrigger(GetTriggeringTrigger())
		//BGM走起
		call hmedia.bgm(gg_snd_main)
		call QuestSetCompleted( q_quit_space, true )
		call QuestMessageBJ( playerForce, bj_QUESTMESSAGE_COMPLETED, "已逃离混沌领域!" )
		//镜头
		call CameraSetupApplyForceDuration( gg_cam_cam_failA1, true, 0.00 )
		call CameraSetupApplyForceDuration( gg_cam_cam_failA2, true, 9.00 )
		//生成初始长老
		set dia[1] = "时空领域已经现在已经完全黯淡了..."
		set dia[2] = "我现在开始准备传送了...而这个时空..."
		set dia[3] = "我知道...这并不是你的错..."
		set dia[4] = null
		call hSync_moive2force(playerForce,u_zhanglao,dia)
		//镜头
		call CameraSetupApplyForceDuration( gg_cam_cam_failB1, true, 0.00 )
		call CameraSetupApplyForceDuration( gg_cam_cam_failB2, true, 17.00 )
		set dia[1] = "怪物已经充斥只有烈火、暴雨及黑暗..."
		set dia[2] = "或许下一个冒险者会改变这一切吧..."
		set dia[3] = "传送阵已经准备好了～离开这里吧～已经不行了～"
		set dia[4] = "后会有期！冒险者"
		set dia[5] = null
		call hSync_moive2force(playerForce,u_zhanglao,dia)
		call dia.destroy()
		//循环设定玩家参数
		set i = player_max_qty
		loop
			exitwhen i<=0
				call hplayer.defeat(players[i], "传送离开")
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
		call hmedia.bgm(gg_snd_danger)
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
			call LeaderboardSetLabel(g_leaderboard, "大局为重")
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

	private function waveSelectDialog takes nothing returns nothing
		local dialog d = GetClickedDialog()
		local button b = GetClickedButton()
		local integer bi = LoadInteger(hash_player,GetHandleId(b),7)
		local integer zhazhaWave = 0
		local integer i = 0
		local integer gold = 0
		local integer lumber = 0
		local integer exp = 0
		local real life = 0
		local real defend = 0
		local real resistance = 0
		local real lifeBack = 0
		if(bi == 1)then
			set zhazhaWave = LoadInteger(hash_player,GetHandleId(b),70)
			set g_first_wave = zhazhaWave-1
			set g_wave = zhazhaWave-1
			set g_first_ready_time = g_first_ready_time + I2R(g_wave)*2
			set i = 1
			set gold = 0
			set lumber = 0
			set exp = 0
			loop
				exitwhen(i>g_first_wave)
					set exp = exp + i * 16 * g_gp_max
					set gold = gold + i * 2 * g_gp_max
					if (hlogic.imod(i,g_boss_mod) == 0) then
						set g_gp_max = g_gp_max + 20
						set exp = exp + i * (3000+1000)
						set gold = gold + i * (70+30) * 20
						set lumber = lumber + 1
					endif
				set i=i+1
			endloop
			call hitem.toXY(momentItems[4],gold,0,512,0)
			call hitem.toXY(momentItems[5],lumber,256,256,0)
			call hitem.toXY(momentItems[6],exp,512,0,0)
			// main
			set life = 500 * g_wave
			set defend = 0.5 * g_wave
			set resistance = 1 * g_wave
			set lifeBack = 0.6 * g_wave
			call hattr.addLife(u_timering,life,0)
			call hattr.addDefend(u_timering,defend,0)
			call hattr.addResistance(u_timering,resistance,0)
			call hattr.addLifeBack(u_timering,lifeBack,0)
			// sub
			set life = 300 * g_wave
			set defend = 0.3 * g_wave
			set resistance = 0.4 * g_wave
			set lifeBack = 0.2 * g_wave
			call hattr.addLife(u_timering1,life,0)
			call hattr.addDefend(u_timering1,defend,0)
			call hattr.addResistance(u_timering1,resistance,0)
			call hattr.addLifeBack(u_timering1,lifeBack,0)
			call hattr.addLife(u_timering2,life,0)
			call hattr.addDefend(u_timering2,defend,0)
			call hattr.addResistance(u_timering2,resistance,0)
			call hattr.addLifeBack(u_timering2,lifeBack,0)
			call hattr.addLife(u_timering3,life,0)
			call hattr.addDefend(u_timering3,defend,0)
			call hattr.addResistance(u_timering3,resistance,0)
			call hattr.addLifeBack(u_timering3,lifeBack,0)
		endif
		call FlushChildHashtable(hash_player, GetHandleId(b))
		call DialogClear( d )
		call DialogDestroy( d )
		call DisableTrigger(GetTriggeringTrigger())
		call DestroyTrigger(GetTriggeringTrigger())
		set d = null
		set b = null
		call openSpace()
	endfunction

	private function openRect takes nothing returns nothing
		local trigger tg = null
		local string txt = null
		local dialog d = null
		local button b = null
		local trigger dtg = null
		local integer i = 0
		local integer zhazhaWave = 0
		call htime.delTimer(GetExpiredTimer())
		call hmsg.echo("时空轮组已经召唤！"+"|cffffff80 加油！")
		call PingMinimapLocForForceEx( playerForce,Loc_Ring,5, bj_MINIMAPPINGSTYLE_FLASHY, 100, 0, 0 )
		//
		set u_timering = hunit.createUnit(player_ally, 'n00Z', Loc_Ring)
		call hevent.onDead(u_timering,function timeRingBreak)
		// 任务F9提醒
		set txt = ""
		set txt = txt + "进入时空境域，防御敌人"
		set txt = txt + "|n英雄按 B 即可建造兵塔，兵塔会吸收作战经验升级或者主动花金币升级"
		set txt = txt + "|n加油吧～"
		call QuestMessageBJ( playerForce, bj_QUESTMESSAGE_DISCOVERED, "发现新的传送门" )
		set q_into_space = CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "进入时空境域",txt, "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp" )
		call FlashQuestDialogButton()
		// call hunit.exploded(u_timering,15.00) // 测试失败用
		// $ 继承上一关
		// 先找出所有玩家里玩得最渣的
		set zhazhaWave = 9999
		set i = 1
		loop
			exitwhen(i>player_max_qty)
				if (player_prolv[i] < zhazhaWave and GetPlayerController(players[i]) == MAP_CONTROL_USER and GetPlayerSlotState(players[i]) == PLAYER_SLOT_STATE_PLAYING) then
					set zhazhaWave = player_prolv[i]
				endif
			set i=i+1
		endloop
		// set zhazhaWave = 0
		if(zhazhaWave >= 2)then
			set d = DialogCreate()
			call DialogSetMessage( d, "时空轮回之力" )
			set b = DialogAddButton(d,"轮回再续Lv"+I2S(zhazhaWave),0)
			call SaveInteger(hash_player,GetHandleId(b),7,1)
			call SaveInteger(hash_player,GetHandleId(b),70,zhazhaWave)
			set b = DialogAddButton(d,"从头开始(不会清空最佳存档)",0)
			call SaveInteger(hash_player,GetHandleId(b),7,2)
			set dtg = CreateTrigger()
			call TriggerAddAction(dtg, function waveSelectDialog)
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
		else
			set g_first_wave = 0
			set g_wave = 0
			call openSpace()
		endif
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
		//死亡轮
		set u_dead_timering[1] = 'n04Y'
		set u_dead_timering[2] = 'n058'
		set u_dead_timering[3] = 'n059'
		set u_dead_timering[4] = 'n057'
		set u_dead_timering[5] = 'n04X'
		//
		set spaceDegX[1] = 128
		set spaceDegY[1] = 3200
		set spaceDegX[2] = 1280
		set spaceDegY[2] = 3968
		set spaceDegX[3] = 3200
		set spaceDegY[3] = 3968
		set spaceDegX[4] = 3968
		set spaceDegY[4] = 2816
		set spaceDegX[5] = 3968
		set spaceDegY[5] = 896
		set spaceDegX[6] = 2816
		set spaceDegY[6] = 128
		set spaceDegX[7] = 896
		set spaceDegY[7] = 128
		set spaceDegX[8] = 128
		set spaceDegY[8] = 1280
		//循环设定玩家参数
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
				call hplayer.setLumberRatio(players[i],100*player_current_qty,0)
				call hplayer.setExpRatio(players[i],50.0+50*player_current_qty,0)
				if(player_isvip[i] == true)then
					call hplayer.setGold(players[i],3000)
					call hplayer.setLumber(players[i],0)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_RESOURCE_FOOD_CAP,15)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_FOOD_CAP_CEILING,15)
					call hhero.setPlayerAllowQty(players[i],3)
					set g_summon_upgrade_judge = 225
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
					call hplayer.setGold(players[i],2000)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_RESOURCE_FOOD_CAP,9)
					call SetPlayerStateBJ(players[i], PLAYER_STATE_FOOD_CAP_CEILING,9)
					call hhero.setPlayerAllowQty(players[i],1)
					set g_summon_upgrade_judge = 150
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
		set txt = txt + "|n4. 多英雄选择权，更多的人口"
		set txt = txt + "|n5. 完整的资源，8%的黄金获取加成"
		set txt = txt + "|n6. 所有需要地图等级才能获得的奖励"
		set txt = txt + "|n再次感谢～您的支持～"
		call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "感谢你的支持！",txt, "ReplaceableTextures\\CommandButtons\\BTNUnsummonBuilding.blp" )
		call FlashQuestDialogButton()
		//设定作为敌人的电脑玩家
		call henemy.setIsShareView(true)
		call henemy.setEnemyName("混沌魔军")
		call henemy.setEnemyPlayer(players[6])
		call henemy.setEnemyPlayer(players[7])
		call henemy.setEnemyPlayer(players[8])
		call henemy.setEnemyPlayer(players[9])
		call henemy.setEnemyPlayer(players[10])
		call henemy.setEnemyPlayer(players[11])
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
		call hmedia.bgm(gg_snd_ready)
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
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n04S', 663,2081))
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n04T', 2090,3483))
		call hitem.initShop(hunit.createUnitXY(player_ally, 'n04V', 2034,680))
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
		local hGlobals hg
		//globals
		set player_max_qty = 3
		set hg = hGlobals.create()
		call hg.do()
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
