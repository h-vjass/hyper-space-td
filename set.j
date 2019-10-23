globals
	trigger sommonDeadTg = null
	trigger sommonLevelupTg = null
endglobals
struct hSet

	private static integer currentChengqu = 0
    private static trigger heroDeadTg = null
    private static trigger enemyDeadTg = null
    private static trigger bossDeadTg = null
    private static trigger destructableDeadTg = null
    private static trigger luckyDrawTg = null

	private static method fusuzhiguang takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local unit u = htime.getUnit(t,1)
		call htime.delTimer(t)
		if(hgroup.isIn(u,sk_group_fusuzhiguang) == true)then
			call hgroup.out(u,sk_group_fusuzhiguang)
		endif
		set t = null
		set u = null
	endmethod
	private static method onHeroSkillHappen takes nothing returns nothing
		local unit triggerUnit = hevent.getTriggerUnit()
		local integer skillid = hevent.getTriggerSkill()
		local location loc = null
		local location loc2 = null
		local hAttrHuntBean bean
		local group g = null
		local player p = null
		local unit u = null
		local integer i = 0
		local hFilter hf
		local timer t = null
		if(skillid == 'A05K')then // 逸风 - 一刹
			call SetUnitAnimation( triggerUnit, "attack slam" )
			set loc = hevent.getTargetLoc()
			set bean = hAttrHuntBean.create()
            set bean.damage = 3 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physicalwind"
            call hskill.leap(triggerUnit,loc,50,"Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl",75,false,bean)
            call bean.destroy()
		elseif(skillid == 'A05L')then // 逸风 - 无影斩
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physicalwind"
            call hskill.shuttleToUnit(triggerUnit,hevent.getTargetUnit(),300,20,30,5,50,null,"attack",'A06K',bean)
            call bean.destroy()
		endif
		if(skillid == 'A05M')then // 赤血 - 狂暴
			call hattr.addAttackSpeed(triggerUnit,100,10)
			call hattr.addMove(triggerUnit,100,10)
		elseif(skillid == 'A05N')then // 赤血 - 剑刃风暴
			call hattr.addHuntAmplitude(triggerUnit,I2R(GetUnitLevel(triggerUnit)) * 1, 10)
			call hattr.addKnocking(triggerUnit,I2R(GetUnitLevel(triggerUnit)) * 50, 10)
		endif
		if(skillid == 'A05I')then // 暗影猎手 - 恩典
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isAlly(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,600,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.addAttackPhysical(u,I2R(GetUnitLevel(triggerUnit)) * 2,30)
					call heffect.toUnitLoc("war3mapImported\\CallOfAggression.mdx",u,1.00)
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		elseif(skillid == 'A05O')then // 暗影猎手 - 蛇棒
			set loc = hevent.getTargetLoc()
			set loc2 = GetUnitLoc(triggerUnit)
			set i = 1
			loop
				exitwhen i > 3
					set u = hunit.createUnitFacing(GetOwningPlayer(triggerUnit),'n04R',loc,hlogic.getDegBetweenLoc(loc2,loc))
					call hunit.setPeriod(u,60)
					call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 15,59.9)
					call hattr.addAttackPhysical(u,hattr.getAttackMagic(triggerUnit),0)
					set u = null
				set i=i+1
			endloop
			call RemoveLocation(loc)
			call RemoveLocation(loc2)
		endif
		if(skillid == 'A04H')then // 大魔法师 - 召唤水元素
			set hxy.x = GetUnitX(triggerUnit)
			set hxy.y = GetUnitY(triggerUnit)
			set hxy = hlogic.polarProjection(hxy,125.0,GetUnitFacing(triggerUnit))
			set i = 1
			loop
				exitwhen i > 2
					set u = hunit.createUnithXY(GetOwningPlayer(triggerUnit),'n04U',hxy)
					call hunit.setPeriod(u,45)
					call hattr.addAttackHuntType(u,"water",0)
					call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 15,44.9)
					call hattrNatural.addWaterOppose(u,50,0)
					call hattrNatural.addFireOppose(u,50,0)
					call hattr.addAttackMagic(u,hattr.getAttackMagic(triggerUnit),0)
				set i=i+1
			endloop
		elseif(skillid == 'A06J')then // 大魔法师 - 魔窍
			call hattr.addMana(hevent.getTargetUnit(),100,10)
			call hattr.addManaBack(hevent.getTargetUnit(),3.0,10)
			call hattr.addAttackHuntType(hevent.getTargetUnit(),"ice",10)
		elseif(skillid == 'A04G')then // 大魔法师 - 暴风雪
			call hattr.addAttackHuntType(triggerUnit,"waterice",10.0)
		endif
		if(skillid == 'A06O')then // 圣骑士 - 神圣护甲
			call hattr.setLifeBack(triggerUnit,hattr.getLife(triggerUnit)*0.1,5)
		elseif(skillid == 'A06Q')then // 圣骑士 - 闪爆
		elseif(skillid == 'A06R')then // 圣骑士 - 复苏之光
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isAlly(true,triggerUnit)
			set g = hgroup.createByUnit(hevent.getTargetUnit(),275,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					if(hgroup.isIn(u,sk_group_fusuzhiguang) == false)then
						call hgroup.in(u,sk_group_fusuzhiguang)
						call hattr.addAttackHuntType(u,"light",15.0)
						call heffect.toUnit("war3mapImported\\HolyAurora.mdx",u,"origin",13.50)
						set t = htime.setTimeout(15.00,function thistype.fusuzhiguang)
						call htime.setUnit(t,1,u)
					endif
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		endif
		if(skillid == 'A06X')then // 魔剑士 - 冰钢之军
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isAlly(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,600,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.addDefend(u,I2R(GetUnitLevel(triggerUnit)),10)
					call hattrNatural.addIceOppose(u,30,10)
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		elseif(skillid == 'A06Y')then // 魔剑士 - 光焰冲锋
			call SetUnitAnimation( triggerUnit, "attack" )
			set loc = hevent.getTargetLoc()
			set bean = hAttrHuntBean.create()
            set bean.damage = 4 * hattr.getAttackMagic(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "magicfire"
            call hskill.leap(triggerUnit,loc,25,"Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl",125,false,bean)
            call bean.destroy()
		endif
		if(skillid == 'A072')then // 森林老鹿 - 森林庇护
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isAlly(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,600,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.addLifeBack(u,3.0 * I2R(GetUnitLevel(triggerUnit)),30)
					call hattr.addToughness(u,1.5 * I2R(GetUnitLevel(triggerUnit)),30)
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		elseif(skillid == 'A073')then // 森林老鹿 - 缠绕
			call hattrNatural.addWood(triggerUnit,1.0 * I2R(GetUnitLevel(triggerUnit)),60)
		endif
		if(skillid == 'A074')then // 巫妖 - 冽冰鬼盾
			call hattr.addToughness(hevent.getTargetUnit(),2.0 * I2R(GetUnitLevel(triggerUnit)),20)
			call hattr.addPunish(hevent.getTargetUnit(),50.0 * I2R(GetUnitLevel(triggerUnit)),20)
			call hattrNatural.addIceOppose(hevent.getTargetUnit(),75,20)
		elseif(skillid == 'A075')then // 巫妖 - 阴骨
			call hattr.addAttackHuntType(hevent.getTargetUnit(),"ice",15)
			call hattrNatural.addIce(hevent.getTargetUnit(),50.0,15)
		elseif(skillid == 'A076')then // 巫妖 - 霜冻凝结
			call hattr.subMove(hevent.getTargetUnit(),300.0,3)
			call hattr.subAttackSpeed(hevent.getTargetUnit(),80.0,3)
		elseif(skillid == 'A077')then // 巫妖 - 冰封
			call hAttrEffect.addColdVal(triggerUnit,10.0,6)
			call hAttrEffect.addColdDuring(triggerUnit,3.0,6)
			call hAttrEffect.addFreezeVal(triggerUnit,10.0,6)
			call hAttrEffect.addFreezeDuring(triggerUnit,3.0,6)
			call hattrNatural.addIce(triggerUnit,1.0 * I2R(GetUnitLevel(triggerUnit)),6)
		endif
		if(skillid == 'A08H')then // 操火师 - 点燃
			if(his.ally(triggerUnit,hevent.getTargetUnit()))then
				call hattr.addAttackHuntType(hevent.getTargetUnit(),"fire",15)
				call hattrNatural.addFire(hevent.getTargetUnit(),75.0,15)
			else
				call hattrNatural.subFire(hevent.getTargetUnit(),75.0,15)
			endif
		endif
		if(skillid == 'A07E')then // 黑游 - 黑暗之箭
			call hattrNatural.addDark(triggerUnit,3.0 * I2R(GetUnitLevel(triggerUnit)),11)
		elseif(skillid == 'A07A')then // 黑游 - 寡言
			call hattr.addAttackSpeed(triggerUnit,150.0,11)
			call hAttrEffect.addSilentOdds(triggerUnit,100.0,11)
			call hAttrEffect.addSilentDuring(triggerUnit,2.50,11)
		elseif(skillid == 'A07B')then // 黑游 - 邪魅
			call hattrNatural.addDark(triggerUnit,50,13)
			call SetUnitAnimation( triggerUnit, "spell" )
			set loc = hevent.getTargetLoc()
			set bean = hAttrHuntBean.create()
            set bean.damage = 5 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Abilities\\Spells\\NightElf\\shadowstrike\\shadowstrike.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "magicdark"
            call hskill.leap(triggerUnit,loc,70,"Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl",75,false,bean)
            call bean.destroy()
		endif
		if(skillid == 'A078')then // 炼金 - 黄金之力
			set p = GetOwningPlayer(triggerUnit)
			call hattr.addAttackPhysical(hevent.getTargetUnit(),hplayer.getTotalGoldCost(p) * 0.004,10)
			call hattr.addAttackSpeed(hevent.getTargetUnit(),hplayer.getTotalGoldCost(p) * 0.0001,10)
		elseif(skillid == 'A07F')then // 炼金 - 看透生德
			call hplayer.subGoldRatio(GetOwningPlayer(triggerUnit),15.0,50.00)
			call hplayer.addExpRatio(GetOwningPlayer(triggerUnit),30.0,50.00)
			call hplayer.addSellRatio(GetOwningPlayer(triggerUnit),20.0,50.00)
		endif
		set triggerUnit = null
		set loc = null
		set loc2 = null
		set g = null
		set p = null
		set u = null
		set t = null
	endmethod
	private static method onHeroLevelUp takes nothing returns nothing
		local unit u = hevent.getTriggerUnit()
		local integer uid = GetUnitTypeId(u)
		local integer lv = GetHeroLevel(u)
		local real diffLv = I2R(lv - hhero.getHeroPrevLevel(u))
		call hattr.addLife(u,diffLv*20,0)
		call hattr.addPunish(u,diffLv*50,0)
		if(uid == 'H00I')then //赤血
            call hattr.addHemophagia(u,diffLv*0.5,0)
        endif
		if(uid == 'H00K')then // 暗影猎手
			call hattrEffect.addToxicVal(u,diffLv*0.3,0)
		endif
		if(uid == 'H00M')then // 大魔法师
			call hattrNatural.addWater(u,diffLv*0.01,0)
		endif
		if(uid == 'H00X')then //操火师
			call hattrNatural.addFire(u,diffLv*1,0)
		endif
		if(uid == 'H00P')then //森林老鹿
			call hattrEffect.addBombVal(u,diffLv*30,0)
		endif
		set u = null
	endmethod
    private static method onHeroDead takes nothing returns nothing
		local unit u = GetTriggerUnit()
		local unit killer = hevent.getLastDamageUnit(u)
		local player p = GetOwningPlayer(u)
		local unit tempu = null
		local real rebornTime = REBORN_HERO
		if(hgroup.isIn(u,sk_group_fusuzhiguang) == true)then
			set rebornTime = 0
		else
			call hmsg.echo(GetUnitName(u)+" 被 "+GetUnitName(killer)+" 狠狠地打死了！"+I2S(R2I(rebornTime))+" 秒后在原地复活～")
			set tempu = hunit.createUnitXYFacing(p,'n05A',GetUnitX(u),GetUnitY(u),270)
			call SetUnitVertexColor(tempu, 255, 255, 0, 200)
			call hunit.shadow(GetUnitTypeId(u),GetUnitX(u),GetUnitY(u),270,100,0,75,120,rebornTime)
			if(rebornTime>0)then
				call SetUnitTimeScalePercent(tempu, 1000.0 / rebornTime)
			endif
			call hunit.del(tempu,rebornTime)
			set g_thisturn_hero_dead_qty = g_thisturn_hero_dead_qty + 1
		endif
        call hunit.rebornAtXY(u,GetUnitX(u),GetUnitY(u),rebornTime,5.00)
		set u = null
		set killer = null
		set p = null
		set tempu = null
	endmethod
	private static method onHeroKill takes nothing returns nothing
		local unit killer = hevent.getKiller()
		local unit bekiller = hevent.getTargetUnit()
		local unit u = null
		if(GetUnitAbilityLevel(killer,'A079') >= 1)then // 黑游 - 黑奴
			call hattr.addAttackSpeed(killer,20,5.00)
			set u = hunit.createUnitXY(GetOwningPlayer(killer),'n04W',GetUnitX(bekiller),GetUnitY(bekiller))
			call hunit.setPeriod(u,5.00)
			call hattr.addAttackHuntType(u,"dark",0)
			call hattr.addLife(u,I2R(GetUnitLevel(killer)) * 10,0)
			call hattrNatural.addDarkOppose(u,90,0)
			call hattr.addAttackPhysical(u,hattr.getAttackPhysical(killer),0)
		endif
		if(GetUnitAbilityLevel(killer,'A07D') >= 1)then // 炼金 - 好运
			call hplayer.addGold(GetOwningPlayer(killer),GetUnitLevel(killer)*4)
		endif
		set u = null
		set killer = null
		set bekiller = null
	endmethod
    private static method onHeroPick takes nothing returns nothing
        local unit u = hevent.getTriggerUnit()
        local integer uid = GetUnitTypeId(u)
        local string t = hhero.getHeroType(uid)
        call TriggerRegisterUnitEvent( heroDeadTg, u, EVENT_UNIT_DEATH )
		call hunit.setOpenPunish(u,true)
		call hevent.onSkillHappen(u,function thistype.onHeroSkillHappen)
		call hevent.onLevelUp(u,function thistype.onHeroLevelUp)
		call hevent.onKill(u,function thistype.onHeroKill)
		call UnitAddAbility(u,'A082') // reborn
        //检测英雄类别
        if(t == "str")then
			call hattr.addMove(u,200,0)
            call hattr.addLife(u,150,0)
			call hattr.addMana(u,80,0)
			call hattr.addManaBack(u,0.50,0)
            call hattr.addAttackPhysical(u,15,0)
        elseif(t == "agi")then
			call hattr.addMove(u,220,0)
            call hattr.addLife(u,130,0)
			call hattr.addMana(u,80,0)
			call hattr.addManaBack(u,1.00,0)
            call hattr.addAttackPhysical(u,25,0)
        elseif(t == "int")then
			call hattr.addMove(u,180,0)
            call hattr.addLife(u,100,0)
            call hattr.addMana(u,120,0)
            call hattr.addManaBack(u,2.00,0)
            call hattr.addAttackMagic(u,20,0)
        endif
        if(uid == 'H001')then //逸风
            call hattr.addAvoid(u,25,0)
            call hattr.addAttackHuntType(u,"wind",0)
            call hattrEffect.addAttackSpeedVal(u,3,0)
            call hattrEffect.addAttackSpeedDuring(u,15,0)
        endif
        if(uid == 'H00I')then //赤血
            call hattr.addHemophagia(u,0.5,0)
			call hattrEffect.addSplitVal(u,5,0)
            call hattrEffect.addSplitDuring(u,7,0)
        endif
        if(uid == 'H00K')then //暗影猎手
            call hattrEffect.addToxicVal(u,0.3,0)
            call hattrEffect.addToxicDuring(u,3,0)
        endif
        if(uid == 'H00M')then //大魔法师
            call hattr.addManaBack(u,3.5,0)
			call hattrNatural.addWater(u,0.01,0)
        endif
        if(uid == 'H00N')then //圣骑士
			if(sk_group_fusuzhiguang == null)then
				set sk_group_fusuzhiguang = CreateGroup()
			endif
            call hattr.addDefend(u,20.0,0)
			call hattrNatural.addFireOppose(u,10.0,0)
			call hattrNatural.addSoilOppose(u,10.0,0)
			call hattrNatural.addWaterOppose(u,10.0,0)
			call hattrNatural.addIceOppose(u,10.0,0)
			call hattrNatural.addWindOppose(u,10.0,0)
			call hattrNatural.addLightOppose(u,10.0,0)
			call hattrNatural.addDarkOppose(u,10.0,0)
			call hattrNatural.addWoodOppose(u,10.0,0)
			call hattrNatural.addThunderOppose(u,10.0,0)
			call hattrNatural.addPoisonOppose(u,10.0,0)
			call hattrNatural.addMetalOppose(u,10.0,0)
			call hattrNatural.addGhostOppose(u,10.0,0)
			call hattrNatural.addDragonOppose(u,10.0,0)
        endif
		if(uid == 'H00O')then //魔剑士
			call hattr.addInvincible(u,10.0,0)
			call hattrEffect.addFreezeVal(u,10.0,0)
			call hattrEffect.addFreezeDuring(u,5.0,0)
			call hattrEffect.addColdVal(u,20.0,0)
			call hattrEffect.addColdDuring(u,5.0,0)
		endif
		if(uid == 'H00X')then //操火师
			call hattr.addAttackHuntType(u,"fire",0)
			call hattrNatural.addFire(u,1.0,0)
		endif
		if(uid == 'H00P')then //森林老鹿
			call hattr.addAttackHuntType(u,"wood",0)
			call hattrNatural.addWoodOppose(u,50.0,0)
			call hattrEffect.setBombOdds(u,100,0)
			call hattrEffect.setBombVal(u,30,0)
			call hattrEffect.setBombRange(u,50,0)
			call hattrEffect.setBombModel(u,"Abilities\\Spells\\NightElf\\EntanglingRoots\\EntanglingRootsTarget.mdl")
		endif
		if(uid == 'H00S')then //黑游
			call hattr.addAttackHuntType(u,"dark",0)
		endif
		if(uid == 'H00R')then //炼金
			call hattr.addAttackHuntType(u,"metal",0)
			call hplayer.addGoldRatio(GetOwningPlayer(u),25,0)
		endif
		set u = null
		set t = null
    endmethod

    private static method removeEnumDestructable takes nothing returns nothing
		call RemoveDestructable( GetEnumDestructable() )
	endmethod

	public static method failEnv takes nothing returns nothing
		local integer i = 0
		local integer j = 0
		local integer rectArea = 0
		local real x = 1300.0
		local real y = 1300.0
		local hWeatherBean wb = 0
		call EnumDestructablesInRectAll(rectBattle, function thistype.removeEnumDestructable )
		call henv.clearUnits()
		call SetTerrainType( GetRectCenterX(rectBattle) , GetRectCenterY(rectBattle), 'Adrd', -1, 4, 0 )
		call SetBlight( player_aggressive, GetRectCenterX(rectBattle) , GetRectCenterY(rectBattle), GetRectMaxX(GetPlayableMapRect())-GetRectMinX(GetPlayableMapRect()), true )
		if (rectWeathereffect != null) then
			call hweather.del(rectWeathereffect)
		endif
	endmethod

	private static method winEnv takes nothing returns nothing
		local integer i = 0
		local integer j = 0
		local integer rectArea = 0
		local real x = 1300.0
		local real y = 1300.0
		local rect tempRect = null
		local hWeatherBean wb = 0
		local string txt = null
		local unit u = null
		call hmedia.bgm(gg_snd_bgm_xy_gts_dspadpcm)
		call SetUnitTimeScalePercent( u_timering, 0.00 )
		call EnumDestructablesInRectAll(rectBattle, function thistype.removeEnumDestructable )
		call henv.clearUnits()
		call SetTerrainType( GetRectCenterX(rectBattle) , GetRectCenterY(rectBattle), 'Agrd', -1, 18, 0 )
		if (rectWeathereffect != null) then
			call hweather.del(rectWeathereffect)
		endif
		// 任务F9提醒
		call hmark.display(null,"war3mapImported\\win.blp",1.0,10.0,100.0,100.0)
		set txt = ""
		set txt = txt + "冒险者感谢你！"
		set txt = txt + "|n时空境域恢复了原来的生气，村民都出来游玩了"
		set txt = txt + "|n谢谢你，你可以继续留在这里游玩，也可以回到你的世界～"
		set txt = txt + "|n而混沌魔兽的老大被锁住作为警示了，你也可以去看看"
		set txt = txt + "|n再次感激！"
		call QuestMessageBJ( playerForce, bj_QUESTMESSAGE_DISCOVERED, "守住了！胜利了！冒险者！" )
		call QuestSetCompleted( CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "通关！胜利！",txt, "ReplaceableTextures\\CommandButtons\\BTNStarWand.blp" ), true )
		set tempRect = null
		set wb = 0
		set txt = null
		set u = null
	endmethod

	// 刷兵机制
    private static method onEnemyDead takes nothing returns nothing
		local unit u = GetTriggerUnit()
		local unit killer = hevent.getLastDamageUnit(u)
		local integer exp = 0
		local integer expk = 0
		local integer gold = 0
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        local integer uid = GetUnitTypeId(u)
		call hGlobals.enemyDeadDrop(u)
		if(g_gp_mon != null)then
			call GroupRemoveUnit(g_gp_mon,u)
		endif
		if(g_gp_attack != null and IsUnitInGroup(u, g_gp_attack) == true)then
			call GroupRemoveUnit(g_gp_attack,u)
		endif
		set exp = R2I(I2R(g_wave) * 16 * g_game_speed)
		set expk = R2I(I2R(g_wave) * 30 * g_game_speed)
		set gold = R2I(I2R(g_wave) * 1.5 * g_game_speed)
		if(killer != null)then
			call haward.forUnit(killer,expk,gold,0)
			call haward.forGroup(killer,exp,0,0)
		endif
		call hunit.del(u,2.00)
        // gold
		if (gold<1)then
			set gold = 1
		endif
		if(GetRandomInt(1,100) == 44)then
			call hitem.toXY(momentItems[1],gold*20,x,y,60.00)
			call hitem.toXY(momentItems[3],exp*20,x,y,60.00)
		endif
		// glv
		if(killer != null)then
			if(GetUnitAbilityLevel(killer,'A03U') > 0)then //E
				call hattr.addLife(killer,2,0)
				call hattr.addAttackSpeed(killer,0.1,0)
				call hattr.addAttackPhysical(killer,1,0)
			elseif(GetUnitAbilityLevel(killer,'A064') > 0)then //D
				call hattr.addLife(killer,3,0)
				call hattr.addAttackSpeed(killer,0.13,0)
				call hattr.addAttackPhysical(killer,1.3,0)
			elseif(GetUnitAbilityLevel(killer,'A066') > 0)then //C
				call hattr.addLife(killer,4,0)
				call hattr.addAttackSpeed(killer,0.16,0)
				call hattr.addAttackPhysical(killer,1.6,0)
			elseif(GetUnitAbilityLevel(killer,'A067') > 0)then //B
				call hattr.addLife(killer,6,0)
				call hattr.addAttackSpeed(killer,0.2,0)
				call hattr.addAttackPhysical(killer,1,0)
				call hattr.addAttackMagic(killer,1,0)
			elseif(GetUnitAbilityLevel(killer,'A069') > 0)then //A
				call hattr.addLife(killer,8,0)
				call hattr.addAttackSpeed(killer,0.25,0)
				call hattr.addAttackPhysical(killer,1.5,0)
				call hattr.addAttackMagic(killer,1.5,0)
			elseif(GetUnitAbilityLevel(killer,'A068') > 0)then //S
				call hattr.addLife(killer,11,0)
				call hattr.addAttackSpeed(killer,0.3,0)
				call hattr.addAttackPhysical(killer,2,0)
				call hattr.addAttackMagic(killer,2,0)
			endif
		endif
		set u = null
		set killer = null
	endmethod
    
	public static method createEnemy takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local integer i = htime.getInteger(t,1)
		local integer j = 0 
		local location loc = null
		local unit u = null
		local real life = 0
		local real move = 0
		local real attack = 0
		if(i >= R2I(g_gp_max / g_game_speed))then
			call htime.delTimer(t)
			set t = null
			if(g_mon_isrunning)then
				if(hlogic.imod(g_wave+1,g_boss_mod) == 0 or g_wave+1 >= g_max_wave)then
					call thistype.nextWave(g_boss_ready_time)
					// call htime.setInterval(3.00,function thistype.checkGGPmon)
				else
					call thistype.nextWave(0)
				endif
			endif
			return
		endif
		if(hgroup.count(g_gp_mon) >= 380)then
			return
		endif
		call htime.setInteger(t,1,1+i)
		set life = g_wave * (25 + g_diff * 15)
		set move = 130 + g_wave * 2 + g_diff * 5
		set attack = g_wave * 3 + g_diff * 7
		set j = 1
		loop
			exitwhen j>spaceDegQty
				set u = henemy.createUnitXY(g_mon[monRand],spaceDegX[j],spaceDegY[j])
				call GroupAddUnit(g_gp_mon,u)
				call TriggerRegisterUnitEvent( enemyDeadTg, u, EVENT_UNIT_DEATH )
				call hattr.setLife(u,life,0)
				call hattr.setMove(u,move,0)
				call hattr.setAttackPhysical(u,attack,0)
				call hGlobals.enemyBuilt(u)
				call SetUnitUserData(u,0)
				set j = j+1
		endloop
		set t = null
		set u = null
		set loc = null
	endmethod

	private static method onBossDead takes nothing returns nothing
		local unit u = GetTriggerUnit()
		local unit killer = hevent.getLastDamageUnit(u)
		local integer exp = 0
		local integer gold = 0
		local integer i = 0
		call hGlobals.bossDeadDrop(u)
		call hmedia.soundPlay(gg_snd_audio_gandepiaoliang)
		call hmsg.echo("|cffffff80"+GetUnitName(u)+"|r被狠狠地打死了～|r")
		if(g_gp_mon != null)then
			call GroupRemoveUnit(g_gp_mon,u)
		endif
		if(g_gp_attack != null and IsUnitInGroup(u, g_gp_attack) == true)then
			call GroupRemoveUnit(g_gp_attack,u)
		endif
		set exp = g_wave * 3000
		set gold = g_wave * 70
		if(killer!=null)then
			call haward.forUnit(killer,exp,0,0)
		endif
		call hitem.toXY(momentItems[2],1,GetUnitX(u),GetUnitY(u),90.00)
		set i = 1
		loop
			exitwhen i > 20
				set hxy.x = GetUnitX(u)
        		set hxy.y = GetUnitY(u)
				set hxy = hlogic.polarProjection(hxy,i*10,i*10)
				call hitem.toXY(momentItems[1],gold,hxy.x,hxy.y,90.00)
				if(GetRandomInt(1,50) == 33)then
					call hitem.toXY(momentItems[3],g_wave*1000,hxy.x,hxy.y,90.00)
				endif
			set i = i+1
		endloop
		call hunit.del(u,5)
		if(g_wave < g_max_wave)then
			call hmedia.bgm(gg_snd_gyq_battle)
		endif
		set u = null
		set killer = null
	endmethod

	public static method createBoss takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local unit u = null
        local location loc = null
		local integer bossIndex = bossRand
		local integer rand = GetRandomInt(1,spaceDegQty)
		local real bossPercent = 0
		local real bossPercentLittle = 0
		local real bossPercentTiny = 0
		call htime.delTimer(t)
		set loc = Location(spaceDegX[rand],spaceDegY[rand])
		set last_boss_uid = g_boss[bossIndex]
		set u = henemy.createUnit(last_boss_uid,loc)
		call GroupAddUnit(g_gp_mon,u)
		call TriggerRegisterUnitEvent( bossDeadTg, u, EVENT_UNIT_DEATH )
		set bossPercent = g_wave * 5 + g_diff
		set bossPercentLittle = g_wave * 4 + g_diff
		set bossPercentTiny = g_wave * 3 + g_diff
		if(bossPercent > 80)then
			set bossPercent = 80
		endif
		if(bossPercentLittle > 65)then
			set bossPercentLittle = 65
		endif
		if(bossPercentTiny > 50)then
			set bossPercentTiny = 50
		endif
        call hattr.setLife(u, g_wave * (8500+450*g_diff) ,0)
		call hattr.setLifeBack(u, g_wave* 2 + g_diff * 5 ,0)
		call hattr.addMana(u,1000*g_diff,0)
        call hattr.addManaBack(u,30*g_diff,0)
        call hattr.setDefend(u, (g_wave+g_diff)*5 ,0)
		call hattr.addResistance(u,bossPercent,0)
		call hattr.setMove(u, 140 + g_wave*7 + g_diff*4 ,0)
        call hattr.setAttackPhysical(u, 40 + g_wave*(12 + g_diff*2)  ,0)
		call hattr.setAttackMagic(u, 60 + g_wave*(13 + g_diff*2)  ,0)
        call hattr.setAttackSpeed(u, g_wave * 3 + g_diff * 6 ,0)
        call hattr.setAim(u,bossPercent,0)
        call hattr.setAvoid(u,bossPercentLittle,0)
		call hattr.setInvincible(u,bossPercent,0)
        call hattr.setSwimOppose(u,bossPercent,0)
        call hattr.setSilentOppose(u,bossPercent,0)
        call hattr.setUnarmOppose(u,bossPercent,0)
        call hattr.setFetterOppose(u,bossPercent,0)
        call hattr.setBombOppose(u,bossPercentTiny,0)
        call hattr.setCrackFlyOppose(u,bossPercentLittle,0)
        call hattr.setKnockingOppose(u,-850 + g_wave * 550 + g_diff * 300,0)
        call hattr.setViolenceOppose(u,-950 + g_wave * 600 + g_diff * 350,0)
		call hattrEffect.addCrackFlyOdds(u,g_wave*4 + g_diff,0)
		call hattrEffect.addCrackFlyVal(u,g_wave*(25 + g_diff),0)
		call hattrEffect.addCrackFlyHigh(u,g_wave*(6 + g_diff),0)
		call hattrEffect.addCrackFlyDistance(u,0,0)
		call hGlobals.bossBuilt(u)
		//警告
		call PingMinimapLocForForceEx( GetPlayersAll(),loc,3, bj_MINIMAPPINGSTYLE_FLASHY, 100, 0, 0 )
		call RemoveLocation(loc)
		call hmedia.bgm(gg_snd_eddyliu_menu_bgm)
		call hmedia.soundPlay(gg_snd_audio_buyaohuang)
		call hmsg.echo("|cffffff80"+GetUnitName(u)+"|r现身！！|cffffff80注意防范！|r")
		set t = null
		set u = null
		set loc = null
	endmethod

    private static method mildDirect takes nothing returns nothing
		local timer t = null
		set t = htime.setInterval(g_game_mon_loop,function thistype.createEnemy)
		call htime.setInteger(t,1,0)
		if (hlogic.imod(g_wave,g_boss_mod) == 0) then
			set t = htime.setTimeout(g_game_mon_loop*0.6*(g_gp_max / g_game_speed),function thistype.createBoss)
		endif
		set t = null
	endmethod
    private static method mild takes nothing returns nothing
		local timer t = GetExpiredTimer()
		call htime.delTimer(t)
		call hmedia.bgm(gg_snd_gyq_battle)
		call hmedia.soundPlay(gg_snd_audio_effect_4)
		call SetUnitTimeScalePercent( u_timering, 100.00 )
		set t = htime.setInterval(g_game_mon_loop,function thistype.createEnemy)
		call htime.setInteger(t,1,0)
		if (hlogic.imod(g_wave,g_boss_mod) == 0) then
			set t = htime.setTimeout(g_game_mon_loop*0.6*(g_gp_max / g_game_speed),function thistype.createBoss)
		endif
		set t = null
	endmethod

	private static method enemyDebug takes nothing returns nothing
		local integer i = 0
		local integer waveBoss = 0
		call GroupPointOrderLoc( g_gp_attack , "attack", Loc_Ring )
		//记录
		set waveBoss = R2I((I2R(g_wave)/5)) * 5
		set i = player_max_qty
		loop
			exitwhen i<=0
				if(GetPlayerServerValueSuccess(players[i]) == true)then
					if(DzAPI_Map_GetStoredInteger(players[i], "wavelevel") < waveBoss)then
						call DzAPI_Map_StoreInteger(players[i], "wavelevel", waveBoss )
						call DzAPI_Map_Stat_SetStat(players[i], "wavelevel", I2S(waveBoss) )
					endif
				endif
			set i = i-1
		endloop
	endmethod

	// 计算出怪点
	private static method readyWave takes real holdon returns nothing
		local location loc = null
		local integer i = 0
		local timer t = null
		set monRand = GetRandomInt(1,g_mon_count)
		set bossRand = GetRandomInt(1,g_boss_count)
		if (holdon <= 0) then
			call hmsg.echo("|cffffff00Lv."+I2S(g_wave)+" 来袭！来袭！|r")
			call mildDirect()
		else
			set g_timer_wave = htime.setTimeout( holdon ,function thistype.mild)
			call SetUnitTimeScalePercent( u_timering, 0.00 )
			// main
			call hattr.addLife(u_timering,500,0)
			call hattr.addDefend(u_timering,0.50,0)
			call hattr.addResistance(u_timering,1.0,0)
			call hattr.addLifeBack(u_timering,0.60,0)
			//
			if (hlogic.imod(g_wave,g_boss_mod) == 0) then
				call hmark.display(null,"war3mapImported\\warning.blp",1.0,5.0,100.0,100.0)
				call hmedia.bgm(gg_snd_dangerComing)
				call htime.setDialog(g_timer_wave, "第"+I2S(g_wave)+"波※BOSS")
				call hmsg.echo("时空炸裂！！小心！|cffff8080BOSS|r 要来了～")
			else
				call hmedia.bgm(gg_snd_ready)
				call htime.setDialog(g_timer_wave, "第"+I2S(g_wave)+"波")
				call hmsg.echo("时空震荡！！小心！敌人围剿啦～")
			endif
			//记录
			set i = player_max_qty
			loop
				exitwhen i<=0
					if(GetPlayerServerValueSuccess(players[i]) == true)then
						if(DzAPI_Map_GetStoredInteger(players[i], "wavelevel") < g_wave)then
							call DzAPI_Map_StoreInteger(players[i], "wavelevel", g_wave )
							call DzAPI_Map_Stat_SetStat(players[i], "wavelevel", I2S(g_wave) )
						endif
					endif
				set i = i-1
			endloop
		endif
		set t = null
		set loc = null
	endmethod

	public static method firstWave takes nothing returns nothing
		if (g_wave == g_first_wave)then
			set g_wave = g_first_wave+1
			// 开启一个N秒一次的debug
			call htime.setInterval(15,function thistype.enemyDebug)
			call thistype.readyWave(g_first_ready_time)
		endif
	endmethod

	private static method nextWaveClearEnv takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local real x = htime.getReal(t,1)
		local real y = htime.getReal(t,2)
		call htime.delTimer(t)
		call henv.removeInRange(x,y,275,275)
		set t=null
	endmethod
	
	public static method nextWave takes real holdon returns nothing
		local integer i = 0
		if(g_mon_isrunning == false)then
			return
		endif
		set g_wave = g_wave+1
		if(g_wave > g_max_wave)then
			call SetUnitInvulnerable(u_timering, true )
			call thistype.winEnv()
			return
		endif
		// 测试胜利
		//call thistype.winEnv()
		//return
		
		call thistype.readyWave(holdon)
	endmethod

    // 注册瞬逝型物品
    private static method registerItemMonentCall takes nothing returns nothing
        local unit u = hevent.getTriggerUnit()
        local integer id = hevent.getId()
        local real charges = hevent.getValue()
        if (id == 'o002') then // 金币
            call haward.forUnitGold(u,2*R2I(charges))
        elseif (id == 'o003') then // 木材
            call haward.forUnitLumber(u,R2I(charges))
        elseif (id == 'o004') then // 经验
            call haward.forGroupExp(u,R2I(charges))
        elseif (id == 'o005') then // 时轮之力G
            call haward.forPlayerGold(u,R2I(charges))
        elseif (id == 'o006') then // 时轮之力L
            call haward.forPlayerLumber(u,R2I(charges))
        elseif (id == 'o007') then // 时轮之力E
            call haward.forGroupExp(u,R2I(charges))
        endif
		set u = null
    endmethod
    private static method registerItemMonent takes nothing returns nothing
        local hItemBean hitembean
		local integer i = 0
		loop
			exitwhen i>momentItems_count
				set hitembean = hItemBean.create()
				set hitembean.item_type = HITEM_TYPE_MOMENT
				set hitembean.item_id = momentItems[i]
				call hitem.format(hitembean)
				call hitembean.destroy()
				call hitem.onMoment(momentItems[i],function thistype.registerItemMonentCall)
			set i=i+1
		endloop
    endmethod



	private static method onSommonDead takes nothing returns nothing
		call hGlobals.deadSummon(GetTriggerUnit())
	endmethod
	private static method onConstructFinish takes nothing returns nothing
		call hGlobals.initSummon(GetTriggerUnit(),1.00)
	endmethod
	private static method onConstructUpgrade takes nothing returns nothing
		call hGlobals.upgradeSummon(GetTriggerUnit())
	endmethod

    public static method setInit takes nothing returns nothing
        local unit u = null
        local integer qty = 0
		local trigger tg = null
        set heroDeadTg = CreateTrigger()
        set sommonDeadTg = CreateTrigger()
        set enemyDeadTg = CreateTrigger()
        set bossDeadTg = CreateTrigger()
        set sommonLevelupTg = CreateTrigger()
        call TriggerAddAction(enemyDeadTg,function thistype.onEnemyDead)
        call TriggerAddAction(bossDeadTg,function thistype.onBossDead)
        call TriggerAddAction(heroDeadTg,function thistype.onHeroDead)
        call TriggerAddAction(sommonDeadTg,function thistype.onSommonDead)

        call hevent.onPickHero(function thistype.onHeroPick)

        // item
        call registerItemMonent()

		// build
		call hevent.onConstructFinish(function thistype.onConstructFinish)
		// 升级建筑
		set tg = CreateTrigger()
		call TriggerRegisterAnyUnitEventBJ( tg, EVENT_PLAYER_UNIT_UPGRADE_FINISH )
		call TriggerAddAction( tg, function thistype.onConstructUpgrade )
		set u = null
		set tg = null
    endmethod

endstruct
