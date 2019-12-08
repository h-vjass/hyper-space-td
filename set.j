globals
	trigger sommonDeadTg = null
	trigger sommonPointTg = null
	trigger sommonLevelupTg = null
endglobals
struct hSet

	private static integer currentChengqu = 0
    private static trigger heroDeadTg = null
    private static trigger enemyDeadTg = null
	private static trigger enemyStopTg = null
    private static trigger bossDeadTg = null
    private static trigger destructableDeadTg = null
    private static trigger luckyDrawTg = null

	// 复苏之光
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

	// 奔腾霹雳
	private static method bentengpili takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local unit triggerUnit = htime.getUnit(t,1)
		local integer i = htime.getInteger(t,2)
		local hAttrHuntBean bean
		local group g = null
		local unit u = null
		local hFilter hf
		if(i > 60)then
			call htime.delTimer(t)
			set t = null
			set triggerUnit = null
		endif
		call htime.setInteger(t,2,i+1)
		set hf = hFilter.create()
		call hf.isAlive(true)
		call hf.isEnemy(true,triggerUnit)
		set g = hgroup.createByUnit(triggerUnit,1000,function hFilter.get)
		call hf.destroy()
		if(hgroup.count(g)>0)then
			set u = GroupPickRandomUnit(g)
			call hattr.subMove(u,150,5)
			call heffect.toUnitLoc("war3mapImported\\eff_Lightnings_Long.mdl",u,1.00)
			set u = null
		endif
		call GroupClear(g)
		call DestroyGroup(g)
		set g = null
		set t = null
		set triggerUnit = null
	endmethod
	
	private static method onHeroSkillHappen takes nothing returns nothing
		local unit triggerUnit = hevent.getTriggerUnit()
		local integer skillid = hevent.getTriggerSkill()
		local integer triggerUID = 0
		local location loc = null
		local location loc2 = null
		local hAttrHuntBean bean
		local group g = null
		local player p = null
		local unit u = null
		local integer i = 0
		local hFilter hf
		local timer t = null
		local texttag ttg = null
		if(skillid == 'A043')then // 召唤D级兵种
            set p = GetOwningPlayer(triggerUnit)
			set loc = GetSpellTargetLoc()
            call SetUnitPosition( triggerUnit, GetUnitX(triggerUnit), GetUnitY(triggerUnit) )
			if(GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_CAP) - GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_USED) <= 0) then
                set ttg = hmsg.ttg2Unit(triggerUnit,"需要更多的人口",7,"",0,1.70,60.00)
                call hmsg.style(ttg,"scale",0,0.1)
                set ttg = null
            elseif(hplayer.getGold(p) < 500)then
                set ttg = hmsg.ttg2Unit(triggerUnit,"黄金不足",7,"",0,1.70,60.00)
                call hmsg.style(ttg,"scale",0,0.1)
                set ttg = null
            else
                call hplayer.subGold(p,500)
				set triggerUID = g_summon_d[GetRandomInt(1,g_summon_count_d)]
                set u = hunit.createUnit(p,triggerUID,loc)
                call hGlobals.initSummon(u)
                call hGlobals.initSummonAbility(u,null,null)
                set u = null
            endif
			call RemoveLocation(loc)
			set loc = null
        elseif(skillid == 'A06F' or skillid == 'A06D' or skillid == 'A06I' or skillid == 'A07L')then // 召唤A~SSS
            set p = GetOwningPlayer(triggerUnit)
			set loc = GetSpellTargetLoc()
			call SetUnitPosition( triggerUnit, GetUnitX(triggerUnit), GetUnitY(triggerUnit) )
            if(GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_CAP) - GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_USED) <= 0) then
                set ttg = hmsg.ttg2Unit(triggerUnit,"需要更多的人口",7,"",0,1.70,60.00)
                call hmsg.style(ttg,"scale",0,0.1)
                set ttg = null
            else
			 	if(skillid == 'A06F')then // A~S
				 	call RemoveItem(GetItemOfTypeFromUnitBJ(triggerUnit, 'I024'))
                elseif(skillid == 'A06D')then // A~SS
					call RemoveItem(GetItemOfTypeFromUnitBJ(triggerUnit, 'I026'))
                elseif(skillid == 'A06I')then // S~SS
					call RemoveItem(GetItemOfTypeFromUnitBJ(triggerUnit, 'I025'))
                elseif(skillid == 'A07L')then // S~SSS
					call RemoveItem(GetItemOfTypeFromUnitBJ(triggerUnit, 'I027'))
                endif
                if(skillid == 'A06F')then // A~S
                    set i = GetRandomInt(1,15)
                    if(i == 7) then
                        set triggerUID = g_summon_s[GetRandomInt(1,g_summon_count_s)]
                    else
                        set triggerUID = g_summon_a[GetRandomInt(1,g_summon_count_a)]
                    endif
                elseif(skillid == 'A06D')then // A~SS
                    set i = GetRandomInt(1,15)
                    if(i <= 1) then
                        set triggerUID = g_summon_ss[GetRandomInt(1,g_summon_count_ss)]
                    elseif(i < 6) then
                         set triggerUID = g_summon_s[GetRandomInt(1,g_summon_count_s)]
                    else
                        set triggerUID = g_summon_a[GetRandomInt(1,g_summon_count_a)]
                    endif
                elseif(skillid == 'A06I')then // S~SS
                    set i = GetRandomInt(1,15)
                    if(i <= 3) then
                        set triggerUID = g_summon_ss[GetRandomInt(1,g_summon_count_ss)]
                    else
                        set triggerUID = g_summon_s[GetRandomInt(1,g_summon_count_s)]
                    endif
                elseif(skillid == 'A07L')then // SS
                    set triggerUID = g_summon_ss[GetRandomInt(1,g_summon_count_ss)]
                endif
                set u = hunit.createUnit(p,triggerUID,loc)
                call hGlobals.initSummon(u)
                call hGlobals.initSummonAbility(u,null,null)
                set u = null
            endif
			call RemoveLocation(loc)
			set loc = null
		endif
		if(skillid == 'A08X' or skillid == 'A04F' or skillid == 'A09N' or skillid == 'A09O')then // 四种符咒
			set loc = GetSpellTargetLoc()
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByLoc(loc,400,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					if(skillid == 'A08X')then // [特攻]号令·圣锤封印
						call hability.swim(u,12)
					elseif(skillid == 'A04F')then // [特攻]号令·圣盾封印
						call hattr.subDefend(u,40,30)
						call heffect.toUnit("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayTarget.mdl",u,"origin",30)
					elseif(skillid == 'A09N')then // [特攻]号令·圣斧封印
						call hability.silent(u,30)
					elseif(skillid == 'A09O')then // [特攻]号令·圣剑封印
						call hability.unarm(u,30)
					endif
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
			set loc = null
		endif
		if(skillid == 'A05K')then // 斩破 - 一刹
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
		elseif(skillid == 'A05L')then // 斩破 - 无影斩
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physicalwind"
            call hskill.shuttleToUnit(triggerUnit,hevent.getTargetUnit(),700,20,30,5,50,null,"attack",'A06K',bean)
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
			call hf.isOwnerPlayer(false,players[12])
			set g = hgroup.createByUnit(triggerUnit,600,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.addAttackPhysical(u,I2R(GetUnitLevel(triggerUnit)) * 2,30)
					call heffect.toUnitLoc("war3mapImported\\eff_CallOfAggression.mdx",u,1.00)
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
		if(skillid == 'A0A5')then // 地穴领主 - 埋沙
			call SetUnitAnimation( triggerUnit, "morph" )
			call SetUnitVertexColor( triggerUnit, 255, 255, 255, 50 )
			set loc = hevent.getTargetLoc()
			set bean = hAttrHuntBean.create()
            set bean.damage = 2 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "physical"
            call hskill.leap(triggerUnit,loc,20,"Objects\\Spawnmodels\\Undead\\ImpaleTargetDust\\ImpaleTargetDust.mdl",100,false,bean)
            call bean.destroy()
		endif
		if(skillid == 'A0AA')then // 蝠王 - 血蝠爆破
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,400,function hFilter.get)
			call hf.destroy()
			set bean = hAttrHuntBean.create()
			if(his.night())then
				set bean.damage = 60 * I2R(GetUnitLevel(triggerUnit))
			else
				set bean.damage = 30 * I2R(GetUnitLevel(triggerUnit))
			endif
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_dark_night_bat.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "dark"
			set i = 0
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 6)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					set bean.toUnit = u
					call hattrHunt.huntUnit(bean)
					set u = null
					set i = i+1
				endloop
			endif
			call bean.destroy()
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		elseif(skillid == 'A0AB')then // 蝠王 - 毒蝠丧魂
			if(his.night())then
				call hattr.subLifeBack(hevent.getTargetUnit(),72*I2R(GetUnitLevel(triggerUnit)),15)
				call hattrNatural.subPoison(hevent.getTargetUnit(),200,15)
			else
				call hattr.subLifeBack(hevent.getTargetUnit(),36*I2R(GetUnitLevel(triggerUnit)),15)
				call hattrNatural.subPoison(hevent.getTargetUnit(),100,15)
			endif
			call heffect.toUnit("Abilities\\Spells\\Human\\Banish\\BanishTarget.mdl",hevent.getTargetUnit(),"origin",15)
		endif
		if(skillid == 'A06O')then // 圣骑士 - 神圣护甲
			call hattr.setLifeBack(triggerUnit,hattr.getLife(triggerUnit)*0.1,5)
		elseif(skillid == 'A06Q')then // 圣骑士 - 闪爆
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,800,function hFilter.get)
			call hf.destroy()
			set bean = hAttrHuntBean.create()
            set bean.damage = 20 * I2R(GetUnitLevel(triggerUnit))
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_flame_flash2.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "light"
			set i = 0
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattrNatural.subLight(u,50,10)
					if(i < 6)then
						set bean.toUnit = u
						call hattrHunt.huntUnit(bean)
					endif
					set u = null
					set i = i + 1
				endloop
			endif
			call bean.destroy()
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
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
						call hattr.addAttackHuntType(u,"light",45.0)
						call heffect.toUnit("war3mapImported\\eff_HolyAurora.mdx",u,"origin",43.50)
						set t = htime.setTimeout(45.00,function thistype.fusuzhiguang)
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
			call hplayer.addExpRatio(GetOwningPlayer(triggerUnit),100.0,50.00)
		endif
		if(skillid == 'A0AE')then // 火焰巨魔 - 炎炮
			set loc = GetSpellTargetLoc()
			call heffect.toLoc("war3mapImported\\eff_NewGroundEX.mdl",loc,2.00)
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByLoc(loc,250,function hFilter.get)
			call hf.destroy()
			set bean = hAttrHuntBean.create()
            set bean.damage = 8 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_Pillar_of_Flame_Orange.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "fire"
			set i = 0
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 5)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					set bean.toUnit = u
					call hattrHunt.huntUnit(bean)
					set u = null
					set i = i + 1
				endloop
			endif
			call bean.destroy()
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
			call RemoveLocation(loc)
			set loc = null
		elseif(skillid == 'A0AG')then // 火焰巨魔 - 大爆炸
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,800,function hFilter.get)
			call hf.destroy()
			set bean = hAttrHuntBean.create()
			set bean.damage = 80 * I2R(GetUnitLevel(triggerUnit))
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_Pillar_of_Flame_Orange.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "fire"
			set i = 0
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 8)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					set bean.toUnit = u
					call hattrHunt.huntUnit(bean)
					set u = null
					set i = i + 1
				endloop
			endif
			call bean.destroy()
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		elseif(skillid == 'A0AF')then // 火焰巨魔 - 热传导
			call hattr.subAttackSpeed(hevent.getTargetUnit(),50,20)
			call hattr.subMove(hevent.getTargetUnit(),200,20)
			call hattr.addAttackSpeed(triggerUnit,50,20)
			call hattr.addMove(triggerUnit,200,20)
			call heffect.toUnit("war3mapImported\\eff_Orchid.mdl",hevent.getTargetUnit(),"origin",20)
		endif
		if(skillid == 'A0AK')then // 机械师 - 报废工厂
			set loc = GetSpellTargetLoc()
			call heffect.toLoc("war3mapImported\\eff_NewGroundEX.mdl",loc,2.00)
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByLoc(loc,300,function hFilter.get)
			call hf.destroy()
			set bean = hAttrHuntBean.create()
            set bean.damage = 1 * hattr.getAttackMagic(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_Pillar_of_Flame_Orange.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "fire"
			set i = 0
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 6)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					set bean.toUnit = u
					call hattrHunt.huntUnit(bean)
					set u = null
					set i = i + 1
				endloop
			endif
			call bean.destroy()
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
			set i = 1
			loop
				exitwhen i > 5
					set u = hunit.createUnit(GetOwningPlayer(triggerUnit),'n05U',loc)
					call hunit.setPeriod(u,10)
					call hattr.addAttackPhysical(u,0.3*hattr.getAttackPhysical(triggerUnit),0)
					set u = null
				set i = i + 1
			endloop
			call RemoveLocation(loc)
			set loc = null
		elseif(skillid == 'A0AJ')then // 机械师 - 过载机器
			call hattr.addAttackPhysical(triggerUnit,GetUnitLevel(triggerUnit)*25,60)
			call hattr.addAttackSpeed(triggerUnit,50,60)
		endif
		if(skillid == 'A097')then // 美杜莎 - 冲击
			set loc = GetUnitLoc(triggerUnit)
			set u = hunit.createUnitFacing(GetOwningPlayer(triggerUnit),'n05V',loc,hlogic.getDegBetweenLoc(loc,hevent.getTargetLoc()))
			call hunit.setPeriod(u,1.16)
			set bean = hAttrHuntBean.create()
            set bean.damage = 4 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "water"
			set loc2 = PolarProjectionBJ(loc, 700, hlogic.getDegBetweenLoc(loc, hevent.getTargetLoc()))
            call hskill.leap(u,loc2,12,"Abilities\\Spells\\Other\\CrushingWave\\CrushingWaveDamage.mdl",150,false,bean)
            call bean.destroy()
			set loc = null
			set loc2 = null
			set u = null
		elseif(skillid == 'A098')then // 美杜莎 - 诅咒恐惧
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByUnit(hevent.getTargetUnit(),400,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.subAttackSpeed(u,60,10.0)
					call heffect.toUnit("Abilities\\Spells\\Undead\\Curse\\CurseTarget.mdl",u,"overhead",10)
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		elseif(skillid == 'A099')then // 美杜莎 - 石化
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isEnemy(true,triggerUnit)
			set g = hgroup.createByUnit(triggerUnit,400,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.subAttackSpeed( u, 300, 10.00 )
					call hattr.subMove(u,1000,10.0)
					call heffect.toUnit("war3mapImported\\eff_Void_Spear.mdl",u,"origin",10)
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		endif
		if(skillid == 'A0AL')then // 兽王 - 灰熊豪猪
			set loc = hevent.getTargetLoc()
			set u = hunit.createUnit(GetOwningPlayer(triggerUnit),'n05W',loc)
			call hunit.setPeriod(u,60)
			call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 40,59.9)
			call hattr.addAttackPhysical(u,hattr.getAttackPhysical(triggerUnit),0)
			set u = hunit.createUnit(GetOwningPlayer(triggerUnit),'n05X',loc)
			call hunit.setPeriod(u,60)
			call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 30,59.9)
			call hattr.addAttackPhysical(u,hattr.getAttackMagic(triggerUnit),0)
			set u = null
			call RemoveLocation(loc)
		elseif(skillid == 'A0AO')then // 兽王 - 犀牛冲撞
			set loc = GetUnitLoc(triggerUnit)
			set u = hunit.createUnitFacing(GetOwningPlayer(triggerUnit),'n05Y',loc,hlogic.getDegBetweenLoc(loc,hevent.getTargetLoc()))
			call hunit.setPeriod(u,2.7)
			set bean = hAttrHuntBean.create()
            set bean.damage = 4 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_CorpseExplosion.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "physical"
			set loc2 = PolarProjectionBJ(loc, 1200, hlogic.getDegBetweenLoc(loc, hevent.getTargetLoc()))
            call hskill.leap(u,loc2,9,null,150,false,bean)
            call bean.destroy()
			set loc = null
			set loc2 = null
			set u = null
		elseif(skillid == 'A0AN')then // 兽王 - 怒吼
			set hf = hFilter.create()
			call hf.isAlive(true)
			call hf.isBuilding(false)
			call hf.isAlly(true,triggerUnit)
			call hf.isOwnerPlayer(false,players[12])
			set g = hgroup.createByUnit(triggerUnit,600,function hFilter.get)
			call hf.destroy()
			if(hgroup.count(g)>0)then
				loop
				exitwhen(IsUnitGroupEmptyBJ(g) == true)
					set u = FirstOfGroup(g)
					call GroupRemoveUnit( g , u )
					call hattr.addAttackPhysical(u,I2R(GetUnitLevel(triggerUnit)) * 4,10)
					call heffect.toUnit("Abilities\\Spells\\NightElf\\BattleRoar\\RoarTarget.mdl",u,"overhead",10)
					set u = null
				endloop
			endif
			call GroupClear(g)
			call DestroyGroup(g)
			set g = null
		endif
		if(skillid == 'A0AP')then // 死骑 - 地狱冲击
			set loc = GetUnitLoc(triggerUnit)
			set u = hunit.createUnitFacing(GetOwningPlayer(triggerUnit),'n05Z',loc,hlogic.getDegBetweenLoc(loc,hevent.getTargetLoc()))
			call hunit.setPeriod(u,0.89)
			set bean = hAttrHuntBean.create()
            set bean.damage = 4 * hattr.getAttackPhysical(triggerUnit)
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_burst_round_purple.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "ghost"
			set loc2 = PolarProjectionBJ(loc, 800, hlogic.getDegBetweenLoc(loc, hevent.getTargetLoc()))
            call hskill.leap(u,loc2,18,null,300,false,bean)
            call bean.destroy()
			set loc = null
			set loc2 = null
			set u = null
		elseif(skillid == 'A0AS')then // 死骑 - 骷髅大军
			set i = 1
			loop
				exitwhen i > 14
					set hxy.x = GetUnitX(triggerUnit)
					set hxy.y = GetUnitY(triggerUnit)
					set hxy = hlogic.polarProjection(hxy,GetRandomReal(100,800),GetRandomReal(0,360))
					if(GetRandomInt(1,2) == 1)then
						set u = hunit.createUnithXY(GetOwningPlayer(triggerUnit),'n05S',hxy)
						call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 20,39.9)
						call hattr.addAttackPhysical(u,hattr.getAttackPhysical(triggerUnit),0)
						call SetUnitPathing( u, false )
					else
						set u = hunit.createUnithXY(GetOwningPlayer(triggerUnit),'n060',hxy)
						call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 10,39.9)
						call hattr.addAttackPhysical(u,hattr.getAttackMagic(triggerUnit),0)
						call SetUnitPathing( u, false )
					endif
					call hunit.setPeriod(u,40)
					set u = null
				set i = i+1
			endloop
		elseif(skillid == 'A0AR')then// 死骑 - 致命缠绕
			call hattr.subDefend(hevent.getTargetUnit(),16,15)
			call hattrNatural.subDarkOppose(hevent.getTargetUnit(),75,15)
		endif
		if(skillid == 'A0A2')then // 先知 - 幽冥之狼
			set loc = hevent.getTargetLoc()
			set i = 1
			loop
				exitwhen i > 2
					set u = hunit.createUnit(GetOwningPlayer(triggerUnit),'n061',loc)
					call hunit.setPeriod(u,60)
					call hattr.addLife(u,I2R(GetUnitLevel(triggerUnit)) * 35,59.9)
					call hattr.addAttackPhysical(u,hattr.getAttackMagic(triggerUnit),0)
					set u = null
				set i=i+1
			endloop
			call RemoveLocation(loc)
		elseif(skillid == 'A0A3')then // 先知 - 雷霆攻击
			call hattr.addAttackHuntType(hevent.getTargetUnit(),"thunder",15)
			call hattrEffect.addLightningChainOdds(hevent.getTargetUnit(),50,15)
			call hattrEffect.addLightningChainVal(hevent.getTargetUnit(),hattr.getAttackMagic(triggerUnit),15)
			call hattrEffect.addLightningChainQty(hevent.getTargetUnit(),3,15)
			call hattrEffect.setLightningChainModel(hevent.getTargetUnit(),lightningCode_shandianlian_ci)
		elseif(skillid == 'A0A4')then // 先知 - 奔腾霹雳
			set t = htime.setInterval(1.00,function thistype.bentengpili)
			call htime.setUnit(t,1,triggerUnit)
			call htime.setInteger(t,2,1)
			set t = null
		endif
		if(skillid == 'A0AU')then // 影刺客 - 瞬杀
			call heffect.toUnit("war3mapImported\\eff_in_a_flash2.mdl",triggerUnit,"origin",1)
			if(his.enemy(triggerUnit,hevent.getTargetUnit()))then
				call hattr.addAttackSpeed(triggerUnit,150,3)
				call hattr.addAttackPhysical(triggerUnit,I2R(GetUnitLevel(triggerUnit))*15,3)
				call hability.swim(hevent.getTargetUnit(),2.5)
				if(his.night())then // 影刺客 - 影子戏法
					call hattr.addKnocking(triggerUnit,2000,3)
				else
					call hattr.addMove(triggerUnit,200,6)
				endif
			endif
			call SetUnitPosition(triggerUnit, GetUnitX(hevent.getTargetUnit()), GetUnitY(hevent.getTargetUnit()) ) 
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
		call hattr.addAttackPhysical(u,diffLv*5,0)
		call hattr.addAttackMagic(u,diffLv*5,0)
		call hattr.addPunish(u,diffLv*50,0)
		if(uid == 'H00I')then //赤血
            call hattr.addHemophagia(u,diffLv*0.5,0)
        endif
		if(uid == 'H00K')then // 暗影猎手
			call hattrEffect.addToxicVal(u,diffLv*0.4,0)
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
		if(uid == 'H004')then //死骑
			call hattrEffect.addAttackPhysicalVal(u,3,0)
		endif
		set u = null
	endmethod
    private static method onHeroDead takes nothing returns nothing
		local unit u = GetTriggerUnit()
		local unit killer = hevent.getLastDamageUnit(u)
		local player p = GetOwningPlayer(u)
		local unit tempu = null
		local real rebornTime = REBORN_HERO
		if(g_mon_isrunning == true)then
			if(hgroup.isIn(u,sk_group_fusuzhiguang) == true)then
				set rebornTime = 0
			else
				call hmsg.echo(GetUnitName(u)+" 被 "+GetUnitName(killer)+" 狠狠地击倒了！"+I2S(R2I(rebornTime))+" 秒后在原地复活～")
				set tempu = hunit.createUnitXYFacing(p,'n05A',GetUnitX(u),GetUnitY(u),270)
				call SetUnitVertexColor(tempu, 255, 255, 0, 200)
				call hunit.shadow(GetUnitTypeId(u),GetUnitX(u),GetUnitY(u),270,100,0,75,120,rebornTime)
				if(rebornTime>0)then
					call SetUnitTimeScalePercent(tempu, 1000.0 / rebornTime)
				endif
				call hunit.del(tempu,rebornTime)
			endif
			call hunit.rebornAtXY(u,GetUnitX(u),GetUnitY(u),rebornTime,5.00)
		endif
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

	// 选英雄
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
		call UnitAddAbility(u,'A043') // summon spring
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
        if(uid == 'H001')then //斩破
            call hattr.addAvoid(u,25,0)
            call hattr.addAttackHuntType(u,"wind",0)
            call hattrEffect.addAttackSpeedVal(u,3,0)
            call hattrEffect.addAttackSpeedDuring(u,15,0)
        endif
        if(uid == 'H00K')then //盗影猎手
            call hattrEffect.addToxicVal(u,0.4,0)
            call hattrEffect.addToxicDuring(u,3,0)
        endif
        if(uid == 'H00M')then //大魔法师
            call hattr.addManaBack(u,3.5,0)
			call hattrNatural.addWater(u,0.01,0)
        endif
		if(uid == 'H007')then //地穴领主
			call hattr.addResistance(u,10,0)
			call hattr.addHuntRebound(u,30,0)
		endif
		if(uid == 'H005')then //蝠王
			call hattr.addAttackHuntType(u,"dark",0)
			call hattr.addHemophagia(u,10,0)
			call hattr.addHemophagiaSkill(u,10,0)
		endif
		if(uid == 'H008')then //机械师
			call hattr.addDefend(u,30,0)
		endif
		if(uid == 'H00A')then //兽王
			call hattr.addLife(u,3000,0)
			call hattr.addKnocking(u,1000,0)
		endif
		if(uid == 'H004')then //死骑
			call hattr.addAttackHuntType(u,"ghost",0)
			call hattrEffect.addAttackPhysicalVal(u,3,0)
			call hattrEffect.addAttackPhysicalDuring(u,15,0)
			call hattrEffect.addColdVal(u,40,0)
			call hattrEffect.addColdDuring(u,15,0)
		endif
		if(uid == 'H003')then //先知
			call hattr.addAttackHuntType(u,"thunder",0)
		endif
		if(uid == 'H00I')then //赤血
            call hattr.addHemophagia(u,0.5,0)
			call hattrEffect.addSplitVal(u,5,0)
            call hattrEffect.addSplitDuring(u,7,0)
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
		if(uid == 'H00C')then //火焰巨魔
			call hattr.addAttackHuntType(u,"fire",0)
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
		if(uid == 'H00D')then //影刺客
			call hattr.addAim(u,40,0)
			call hattr.addAvoid(u,40,0)
			call hattrEffect.addAttackSpeedVal(u,15.0,0)
			call hattrEffect.addAttackSpeedDuring(u,5,0)
			call hattrEffect.addKnockingVal(u,250.0,0)
			call hattrEffect.addKnockingDuring(u,5,0)
		endif
		if(uid == 'H00S')then //黑游
			call hattr.addAttackHuntType(u,"dark",0)
		endif
		if(uid == 'H00R')then //炼金
			call hattr.addAttackHuntType(u,"metal",0)
			call hplayer.addGoldRatio(GetOwningPlayer(u),35,0)
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

	private static method win takes nothing returns nothing
		local integer i = player_max_qty
		loop
			exitwhen i<=0
				call hplayer.victory(players[i])
			set i = i-1
		endloop
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
		call SetUnitTimeScalePercent( u_timering, 10.00 )
		call EnumDestructablesInRectAll(rectBattle, function thistype.removeEnumDestructable )
		call henv.clearUnits()
		call SetTerrainType( GetRectCenterX(rectBattle) , GetRectCenterY(rectBattle), 'Agrd', -1, 28, 0 )
		if (rectWeathereffect != null) then
			call hweather.del(rectWeathereffect)
		endif
		call htime.setTimeout(30.00, function thistype.win)
		// 任务F9提醒
		call hmark.display(null,"war3mapImported\\mark_win.blp",1.0,10.0,100.0,100.0)
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
		local integer gold = 0
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        local integer uid = GetUnitTypeId(u)
		if(g_gp_mon != null)then
			call GroupRemoveUnit(g_gp_mon,u)
		endif
		if(g_gp_attack != null and IsUnitInGroup(u, g_gp_attack) == true)then
			call GroupRemoveUnit(g_gp_attack,u)
		endif
		set exp = R2I(I2R(g_wave) * (16+g_diff*20) * g_game_speed)
		set gold = R2I(I2R(g_wave) * 2.6 * g_game_speed) + g_diff * 3
		if(killer != null)then
			call haward.forUnit(killer,0,gold,0)
			call haward.forGroup(killer,exp,0,0)
		endif
		call hunit.del(u,2.00)
        // gold
		if (gold<1)then
			set gold = 1
		endif
		if(GetRandomInt(1,100) == 44)then
			call hitem.toXY(momentItems[1],gold*21,x,y,60.00)
			call hitem.toXY(momentItems[3],exp*23,x,y,60.00)
		endif
		set u = null
		set killer = null
	endmethod

	public static method createEnemy takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local integer i = htime.getInteger(t,1)
		local integer j = 0
		local integer ri = 0
		local integer ri_total = 0
		local location loc = null
		local unit u = null
		local real life = 0
		local real move = 0
		local real attack = 0
		if(i >= R2I(g_gp_max / g_game_speed))then
			call htime.delTimer(t)
			set t = null
			if(g_mon_isrunning)then
				if(g_wave >= g_max_wave)then
					call thistype.checkWin()
				else
					call thistype.nextWave()
				endif
			endif
			return
		endif
		if(hgroup.count(g_gp_mon) >= g_temp_mon_limit)then
			return
		endif
		if(g_wave <= 6)then
			set life = g_wave * (125 + g_diff * 60)
		elseif(g_wave < 12)then
			set life = g_wave * (225 + g_diff * 175)
		elseif(g_wave < 18)then
			set life = g_wave * (280 + g_diff * 235)
		elseif(g_wave < 24)then
			set life = g_wave * (360 + g_diff * 300)
		elseif(g_wave < 30)then
			set life = g_wave * (480 + g_diff * 380)
		elseif(g_wave < 36)then
			set life = g_wave * (600 + g_diff * 430)
		elseif(g_wave < 42)then
			set life = g_wave * (720 + g_diff * 550)
		elseif(g_wave < 48)then
			set life = g_wave * (840 + g_diff * 700)
		else
			set life = g_wave * (1100 + g_diff * 950)
		endif
		set move = 110 + g_wave * 4 + g_diff * 13
		set attack = g_wave * (7 + g_diff)
		set j = 1
		loop
			exitwhen j>spaceDegQty
				set ri = GetRandomInt(1,g_diff+1) // 随机1到(diff+1))个兵，加速并赋予趣味
				set ri_total = ri_total + ri
				loop
					exitwhen ri < 1
						set u = henemy.createUnitXY(g_mon[monRand],spaceDegX[j],spaceDegY[j])
						call GroupAddUnit(g_gp_mon,u)
						call TriggerRegisterUnitEvent( enemyDeadTg, u, EVENT_UNIT_DEATH )
						call hattr.setLife(u,life,0)
						call hattr.setMana(u,100,0)
						call hattr.setMove(u,move,0)
						call hattr.setAttackPhysical(u,attack,0)
						call SetUnitUserData(u,0)
					set ri = ri - 1
				endloop
				set j = j+1
		endloop
		set ri_total = ri_total / spaceDegQty
		call htime.setInteger(t,1,i+ri_total)
		set t = null
		set u = null
		set loc = null
	endmethod

	private static method onBossDead takes nothing returns nothing
		local unit u = GetTriggerUnit()
		local unit killer = hevent.getLastDamageUnit(u)
		local integer uid = GetUnitTypeId(u)
		local integer exp = 0
		local integer gold = 0
		local integer i = 0
		call hGlobals.bossDeadDrop(u)
		call hmedia.soundPlay(gg_snd_audio_gandepiaoliang)
		call hmsg.echo("|cffffff80"+GetUnitName(u)+"|r被狠狠地击倒了～|r")
		if(g_gp_mon != null)then
			call GroupRemoveUnit(g_gp_mon,u)
		endif
		if(g_gp_boss != null)then
			call GroupRemoveUnit(g_gp_boss,u)
		endif
		if(g_gp_attack != null and IsUnitInGroup(u, g_gp_attack) == true)then
			call GroupRemoveUnit(g_gp_attack,u)
		endif
		set exp = g_wave * 2400 + g_diff * 1750
		set gold = g_wave * (26+g_diff*3)
		if(killer!=null)then
			call haward.forUnit(killer,exp,0,0)
		endif
		call hitem.toXY(momentItems[2],1,GetUnitX(u),GetUnitY(u),90.00)
		set i = 1
		loop
			exitwhen i > player_current_qty * 22
				set hxy.x = GetUnitX(u)
        		set hxy.y = GetUnitY(u)
				set hxy = hlogic.polarProjection(hxy,i*20,i*15)
				call hitem.toXY(momentItems[1],gold,hxy.x,hxy.y,60.00)
				if(GetRandomInt(1,50) == 33)then
					call hitem.toXY(momentItems[3],g_wave*1000,hxy.x,hxy.y,60.00)
				endif
			set i = i+1
		endloop
		call hunit.del(u,5)
		if(g_wave < g_max_wave and hgroup.count(g_gp_boss) < 1)then
			call hmedia.bgm(musicBattle)
		endif
		// boss 技能
		if(uid == 'n062')then
			if(killer!=null)then
				call KillUnit(killer)
			endif
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
		local integer randIndex = 0
		local integer i = 0
		local real life = 0
		call htime.delTimer(t)
		if(g_wave < 6)then
			set life = g_wave * (10000 + 5000 * g_diff)
		elseif(g_wave < 12)then
			set life = g_wave * (15000 + 8000 * g_diff)
		elseif(g_wave < 18)then
			set life = g_wave * (18000 + 11000 * g_diff)
		elseif(g_wave < 24)then
			set life = g_wave * (22000 + 16500 * g_diff)
		elseif(g_wave < 30)then
			set life = g_wave * (27500 + 21000 * g_diff)
		elseif(g_wave < 30)then
			set life = g_wave * (31000 + 26000 * g_diff)
		elseif(g_wave < 36)then
			set life = g_wave * (35000 + 29500 * g_diff)
		elseif(g_wave < 42)then
			set life = g_wave * (40000 + 33000 * g_diff)
		elseif(g_wave < 48)then
			set life = g_wave * (48000 + 39000 * g_diff)
		else
			set life = g_wave * (60000 + 45000 * g_diff)
		endif
		set last_boss_uid = g_boss[bossIndex]
		//
		set i = 0
		loop
			exitwhen i >= g_diff
				set randIndex = rand + i
				if(randIndex > 4)then
					set randIndex = randIndex - 4
				endif
				set loc = Location(spaceDegX[randIndex],spaceDegY[randIndex])
				set u = henemy.createUnit(last_boss_uid,loc)
				call GroupAddUnit(g_gp_mon,u)
				call GroupAddUnit(g_gp_boss,u)
				call TriggerRegisterUnitEvent( bossDeadTg, u, EVENT_UNIT_DEATH )
				call hattr.setLife(u, life ,0)
				call hattr.setLifeBack(u, g_wave * 6 + g_diff * 30 ,0)
				call hattr.addMana(u,1000,0)
				call hattr.addManaBack(u,50,0)
				call hattr.setDefend(u, (g_wave+g_diff*30)*4 ,0)
				call hattr.addResistance(u,g_wave*0.75,0)
				call hattr.setMove(u, 200 + g_wave*5 + g_diff*8 ,0)
				call hattr.setAttackPhysical(u, g_wave*((40+player_current_qty*18) + g_diff*27)  ,0)
				call hattr.setAttackMagic(u, g_wave*((40+player_current_qty*18) + g_diff*27)  ,0)
				call hattr.setAttackSpeed(u, g_wave * 3 + g_diff * 4 ,0)
				call hattr.setAim(u,g_wave*0.8,0)
				call hattr.setAvoid(u,g_wave*0.8,0)
				call hattr.setSwimOppose(u,g_wave*0.6,0)
				call hattr.setSilentOppose(u,g_wave*0.9,0)
				call hattr.setUnarmOppose(u,g_wave*1.2,0)
				call hattr.setFetterOppose(u,g_wave*1.3,0)
				call hattr.setBombOppose(u,g_wave*0.6,0)
				call hattr.setKnockingOppose(u, g_wave * 40 + g_diff * 600,0)
				call hattr.setViolenceOppose(u, g_wave * 40 + g_diff * 600,0)
				call hattrEffect.setCrackFlyOdds(u,g_wave*0.25+g_diff*5,0)
				call hattrEffect.setCrackFlyVal(u,g_wave*(70 + g_diff),0)
				call hattrEffect.setCrackFlyHigh(u,150+g_wave*(4 + g_diff),0)
				call hattrEffect.setCrackFlyDistance(u,0,0)
				call hGlobals.bossBuilt(u)
				call PingMinimapLocForForceEx( GetPlayersAll(),loc,3, bj_MINIMAPPINGSTYLE_FLASHY, 100, 0, 0 ) // 警告
				call RemoveLocation(loc)
			set i = i + 1
		endloop
		if(g_wave >= 100)then
			call hmedia.bgm(gg_snd_boss_last)
		else
			call hmedia.bgm(gg_snd_boss)
		endif
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
		call hmedia.soundPlay(gg_snd_audio_effect_4)
		call SetUnitTimeScalePercent( u_timering, 100.00 )
		set t = htime.setInterval(g_game_mon_loop,function thistype.createEnemy)
		call htime.setInteger(t,1,0)
		if (hlogic.imod(g_wave,g_boss_mod) == 0) then
			set t = htime.setTimeout(g_game_mon_loop*0.5*(g_gp_max / g_game_speed),function thistype.createBoss)
			call hmedia.bgm(gg_snd_dangerComing)
		endif
		if(g_wave == 1)then
			call hmedia.bgm(musicBattle)
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
						call DzAPI_Map_StoreInteger(players[i], "wavelevel", g_diff*2*waveBoss )
						call DzAPI_Map_Stat_SetStat(players[i], "wavelevel", I2S(g_diff*2*waveBoss) )
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
			call hmsg.echo("|cffffff00Lv."+I2S(g_wave)+" 来袭！|r")
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
				call hmark.display(null,"war3mapImported\\mark_warning.blp",1.0,5.0,100.0,100.0)
				call hmedia.bgmStop()
				call htime.setDialog(g_timer_wave, "第"+I2S(g_wave)+"波※BOSS")
				call hmsg.echo("时空炸裂！！小心！|cffff8080BOSS|r 要来了～")
			else
				call htime.setDialog(g_timer_wave, "第"+I2S(g_wave)+"波")
				call hmsg.echo("时空震荡！！小心！敌人围剿啦～")
			endif
			//记录
			set i = player_max_qty
			loop
				exitwhen i<=0
					if(GetPlayerServerValueSuccess(players[i]) == true)then
						if(DzAPI_Map_GetStoredInteger(players[i], "wavelevel") < g_wave)then
							call DzAPI_Map_StoreInteger(players[i], "wavelevel", g_diff*2*g_wave )
							call DzAPI_Map_Stat_SetStat(players[i], "wavelevel", I2S(g_diff*2*g_wave) )
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
	
	public static method nextWave takes nothing returns nothing
		local integer i = 0
		local real holdon = 5
		if(g_mon_isrunning == false)then
			return
		endif

		set g_wave = g_wave+1
		if(hlogic.imod(g_wave,g_boss_mod) == 0)then
			set holdon = g_boss_ready_time
		endif

		// 测试胜利
		//call thistype.winEnv()
		//return
		
		call thistype.readyWave(holdon)
	endmethod

	public static method checkWinCall takes nothing returns nothing
		if(hgroup.count(g_gp_mon) < 1)then
			call htime.delTimer(GetExpiredTimer())
			call SetUnitInvulnerable(u_timering, true )
			call thistype.winEnv()
		endif
	endmethod

	public static method checkWin takes nothing returns nothing
		set g_wave = g_max_wave
		call htime.setInterval(2.00,function thistype.checkWinCall)
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

	private static method onSommonPoint takes nothing returns nothing
		if(GetIssuedOrderId() == 851971 or GetIssuedOrderId() == 851986)then
			call IssuePointOrderById( GetTriggerUnit(), 851983, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()) )
		endif
	endmethod

	private static method onConstructFinish takes nothing returns nothing
		call hGlobals.initSummon(GetTriggerUnit())
		call hGlobals.initSummonAbility(GetTriggerUnit(),null,null)
	endmethod

    public static method setInit takes nothing returns nothing
        local unit u = null
        local integer qty = 0
        set heroDeadTg = CreateTrigger()
        set sommonDeadTg = CreateTrigger()
		set sommonPointTg = CreateTrigger()
        set enemyDeadTg = CreateTrigger()
        set bossDeadTg = CreateTrigger()
        set sommonLevelupTg = CreateTrigger()
        call TriggerAddAction(enemyDeadTg,function thistype.onEnemyDead)
        call TriggerAddAction(bossDeadTg,function thistype.onBossDead)
        call TriggerAddAction(heroDeadTg,function thistype.onHeroDead)
        call TriggerAddAction(sommonDeadTg,function thistype.onSommonDead)
		call TriggerAddAction(sommonPointTg,function thistype.onSommonPoint)

        call hevent.onPickHero(function thistype.onHeroPick)

        // item
        call registerItemMonent()

		// build
		call hevent.onConstructFinish(function thistype.onConstructFinish)
		set u = null
    endmethod

endstruct
