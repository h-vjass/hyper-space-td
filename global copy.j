    public static method upgradeSummon takes unit u returns nothing
        local integer triggerUID = GetUnitTypeId(u)
		local integer lv = GetHeroLevel(u)
		local real diffLv = I2R(lv - hhero.getHeroPrevLevel(u))
        local player p = null
        local location loc = null
        local unit tempu = null
        local boolean isQuiet = false
		if(diffLv < 1)then
			return
		endif
        set p = GetOwningPlayer(u)
		if(GetUnitUserData(u) == 666)then
			call SetUnitUserData(u,0)
            set isQuiet = true
		endif
		call hattr.setStrWhite( u , GetHeroStr(u,false) , 0 )
		call hattr.setAgiWhite( u , GetHeroAgi(u,false) , 0 )
		call hattr.setIntWhite( u , GetHeroInt(u,false) , 0 )
        // call hconsole.warning("diffLv="+R2S(diffLv))
		if(triggerUID == 'H003')then // 民兵
			call hattr.addLife(u,diffLv * 4,0)
			call hattr.addAttackPhysical(u,diffLv * 1,0)
            if(lv >= 20 and GetUnitAbilityLevel(u,'A04I') < 1)then
                call UnitAddAbility(u,'A04I')
                call hattr.addLife(u,100,0)
                call upgradeSummonEcho(u,"民兵 - 习得『勇敢』",isQuiet)
            endif
            if(lv >= 60 and GetUnitAbilityLevel(u,'A04J') < 1)then
                call UnitAddAbility(u,'A04J')
                call hattr.addAttackSpeed(u,30,0)
                call upgradeSummonEcho(u,"民兵 - 习得『奉献』",isQuiet)
            endif
        elseif(triggerUID == 'H00Y')then // 凤凰蛋
            call hattr.addLife(u,diffLv * 8,0)
            if(lv >= 30 and GetUnitAbilityLevel(u,'A08D') < 1)then
                call UnitAddAbility(u,'A08D')
                call upgradeSummonEcho(u,"凤凰蛋 - 习得『火蛋』",isQuiet)
            endif
            if(lv >= 555 and (GetPlayerState(p,PLAYER_STATE_RESOURCE_FOOD_CAP)-GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_USED))>=2)then
                set loc = GetUnitLoc(u)
                call upgradeSummonEcho(u,"凤凰蛋 - 『孵化出来了』",isQuiet)
                set tempu = hunit.createUnit(p,'H011',loc)
                 call RemoveLocation(loc)
                set loc = null
                call hGlobals.initSummon(tempu)
                call hitem.copy(u,tempu)
                call SetHeroLevel(tempu, lv-554, true)
                call hattr.addLife(tempu,3000,0)
                call hattr.addStr(tempu,3*40,0)
                call hattr.addAgi(tempu,3*5,0)
                call hattr.addInt(tempu,3*9,0)
                call GroupRemoveUnit(g_gp_summon, u)
                call hunit.del(u,0)
            endif
        endif
		if(triggerUID == 'H004')then // 铁甲步兵
			call hattr.addLife(u,diffLv * 13,0)
			call hattr.addLifeBack(u,diffLv * 0.006,0)
			call hattr.addAttackPhysical(u,diffLv * 0.7,0)
			call hattr.addDefend(u,diffLv * 0.02,0)
			call hattr.addToughness(u,diffLv * 0.04,0)
            if(lv >= 25 and GetUnitAbilityLevel(u,'A04K') < 1)then
                call UnitAddAbility(u,'A04K')
                call hattr.addHuntRebound(u,15.0,0)
                call upgradeSummonEcho(u,"铁甲步兵 - 习得『尖针』",isQuiet)
            endif
            if(lv >= 100 and GetUnitAbilityLevel(u,'A04M') < 1)then
                call UnitAddAbility(u,'A04M')
                call hattr.addPunishOppose(u,20.0,0)
                call hattr.addSwimOppose(u,20.0,0)
                call hattrNatural.addFireOppose(u,25.0,0)
                call hattrNatural.addSoilOppose(u,25.0,0)
                call hattrNatural.addWaterOppose(u,25.0,0)
                call hattrNatural.addIceOppose(u,25.0,0)
                call hattrNatural.addWindOppose(u,25.0,0)
                call hattrNatural.addLightOppose(u,25.0,0)
                call hattrNatural.addDarkOppose(u,25.0,0)
                call hattrNatural.addWoodOppose(u,25.0,0)
                call hattrNatural.addThunderOppose(u,25.0,0)
                call hattrNatural.addPoisonOppose(u,25.0,0)
                call hattrNatural.addMetalOppose(u,25.0,0)
                call hattrNatural.addGhostOppose(u,25.0,0)
                call hattrNatural.addDragonOppose(u,25.0,0)
                call upgradeSummonEcho(u,"铁甲步兵 - 习得『铁壁』",isQuiet)
            endif
		elseif(triggerUID == 'H00W')then // 树人
			call hattr.addLife(u,diffLv * 10,0)
			call hattr.addLifeBack(u,diffLv * 0.01,0)
			call hattr.addAttackPhysical(u,diffLv * 0.8,0)
			call hattr.addDefend(u,diffLv * 0.01,0)
			call hattr.addToughness(u,diffLv * 0.03,0)
            if(lv >= 20)then
                if(GetUnitAbilityLevel(u,'A08A') < 1)then
                    call UnitAddAbility(u,'A08A')
                    call hattr.addAttackHuntType(u,"wood",0)
                    call hattr.addSwimOppose(u,100.0,0)
                    call hattrNatural.addWoodOppose(u,75.0,0)
                    call hattrEffect.addHemophagiaDuring(u,10,0)
                    call upgradeSummonEcho(u,"树人 - 习得『本质』",isQuiet)
                endif
                call hattrEffect.setHemophagiaVal(u,lv*0.03,0)
            endif
            if(lv >= 110 and GetUnitAbilityLevel(u,'A089') < 1)then
                call UnitAddAbility(u,'A089')
                call hattr.addHuntRebound(u,20.0,0)
                call upgradeSummonEcho(u,"树人 - 习得『木刺』",isQuiet)
            endif
        endif
		if(triggerUID == 'H005')then // 铁枪手
			call hattr.addLife(u,diffLv * 6,0)
			call hattr.addAttackPhysical(u,diffLv * 1.4,0)
			call hattr.addAttackSpeed(u,diffLv * 0.03,0)
            if(lv >= 30 and GetUnitAbilityLevel(u,'A04P') < 1)then
                call UnitAddAbility(u,'A04P')
                call hattr.addKnocking(u,7500.0,0)
                call upgradeSummonEcho(u,"铁枪手 - 习得『黑色火药』",isQuiet)
            endif
            if(lv >= 120 and GetUnitAbilityLevel(u,'A04Q') < 1)then
                call UnitAddAbility(u,'A04Q')
                call hattr.addAttackSpeed(u,75.0,0)
                call upgradeSummonEcho(u,"铁枪手 - 习得『扳机精通』",isQuiet)
            endif
		elseif(triggerUID == 'H012')then // 狂战猎手
			call hattr.addLife(u,diffLv * 3.5,0)
			call hattr.addAttackPhysical(u,diffLv * 3.1,0)
			call hattr.addAttackSpeed(u,diffLv * 0.04,0)
            if(lv >= 10 and GetUnitAbilityLevel(u,'A08V') < 1)then
                call UnitAddAbility(u,'A08V')
                call upgradeSummonEcho(u,"狂战猎手 - 怒得『丧病』",isQuiet)
            endif
            if(lv >= 135 and GetUnitAbilityLevel(u,'A08T') < 1)then
                call UnitAddAbility(u,'A08T')
                call hattr.addHemophagia(u,5.0,0)
                call hattr.addKnocking(u,6000.0,0)
                call upgradeSummonEcho(u,"狂战猎手 - 怒得『心狂』",isQuiet)
            endif
        endif
		if(triggerUID == 'H007')then // 迫击炮手
			call hattr.addLife(u,diffLv * 3.5,0)
			call hattr.addAttackPhysical(u,diffLv * 2.8,0)
            if(lv >= 20)then
                if(GetUnitAbilityLevel(u,'A04R') < 1)then
                    call UnitAddAbility(u,'A04R')
                    call hattrEffect.setBurnDuring(u,3,0)
                    call upgradeSummonEcho(u,"迫击炮手 - 习得『烈性炮弹』",isQuiet)
                endif
                call hattrEffect.setBurnVal(u,lv * 0.2,0)
            endif
            if(lv >= 110 and GetUnitAbilityLevel(u,'A04S') < 1)then
                call UnitAddAbility(u,'A04S')
                call hattr.addAttackHuntType(u,"fire",0)
                call hattrNatural.addFire(u,15.0,0)
                call upgradeSummonEcho(u,"迫击炮手 - 习得『火焰燃油』",isQuiet)
            endif
        endif
		if(triggerUID == 'H008')then // 牧师
			call hattr.addLife(u,diffLv * 10,0)
			call hattr.addMana(u,diffLv * 1.5,0)
			call hattr.addAttackMagic(u,diffLv * 1.5,0)
            if(lv >= 70 and GetUnitAbilityLevel(u,'A03V') >= 1 and GetUnitAbilityLevel(u,'A07J') < 1)then
                call UnitRemoveAbility(u,'A03V')
                call UnitAddAbility(u,'A07J')
                call IssueImmediateOrder(u, "healon")
                call hattr.addAttackHuntType(u,"light",0)
                call upgradeSummonEcho(u,"牧师 - 习得『光导医疗』",isQuiet)
            endif
            if(lv >= 130 and GetUnitAbilityLevel(u,'A04T') < 1)then
                call UnitAddAbility(u,'A04T')
                call upgradeSummonEcho(u,"牧师 - 习得『心灵之火』",isQuiet)
            endif
		elseif(triggerUID == 'H00T')then // 巫医
			call hattr.addLife(u,diffLv * 8,0)
			call hattr.addMana(u,diffLv * 1.5,0)
			call hattr.addAttackPhysical(u,diffLv * 0.8,0)
			call hattr.addAttackMagic(u,diffLv * 0.8,0)
            if(lv >= 15 and GetUnitAbilityLevel(u,'A07K') < 1)then
                call UnitAddAbility(u,'A07K')
                call IssueImmediateOrder(u, "bloodluston")
                call upgradeSummonEcho(u,"巫医 - 习得『邪术』",isQuiet)
            endif
            if(lv >= 65)then
                if(GetUnitAbilityLevel(u,'A07O') < 1)then
                    call UnitAddAbility(u,'A07O')
                    call hattrEffect.setToxicDuring(u,4.00,0)
                    call upgradeSummonEcho(u,"巫医 - 习得『荼毒』",isQuiet)
                endif
                call hattrEffect.setToxicVal(u,lv * 0.25,0)
            endif
        endif
		if(triggerUID == 'H009')then // 斗剑士
			call hattr.addLife(u,diffLv * 14,0)
			call hattr.addAttackPhysical(u,diffLv * 3.0,0)
			call hattr.addToughness(u,diffLv * 0.1,0)
            if(lv >= 10 and GetUnitAbilityLevel(u,'A03O') < 1 and GetUnitAbilityLevel(u,'A04W') < 1)then
                call UnitAddAbility(u,'A03O')
                call upgradeSummonEcho(u,"斗剑士 - 习得『斩铁式』",isQuiet)
            endif
            if(lv >= 55 and GetUnitAbilityLevel(u,'A04W') < 1)then
                call UnitRemoveAbility(u,'A03O')
                call UnitAddAbility(u,'A04W')
                call hattr.addAttackHuntType(u,"wind",0)
                call upgradeSummonEcho(u,"斗剑士 - 强化『斩铁式』并习得『风攻击』",isQuiet)
            endif
            if(lv >= 125 and GetUnitAbilityLevel(u,'A04U') < 1)then
                call UnitAddAbility(u,'A04U')
                call hattrEffect.addAttackSpeedVal(u,10,0)
                call hattrEffect.addAttackSpeedDuring(u,5.0,0)
                call hattrNatural.addWind(u,10,5)
                call upgradeSummonEcho(u,"斗剑士 - 习得『烈风式』",isQuiet)
            endif
        endif
		if(triggerUID == 'H00A')then // 精灵射手
			call hattr.addLife(u,diffLv * 14,0)
			call hattr.addAttackPhysical(u,diffLv * 3.0,0)
            if(lv >= 15 and GetUnitAbilityLevel(u,'A03T') < 1)then
                call UnitAddAbility(u,'A03T')
                call upgradeSummonEcho(u,"精灵射手 - 习得『4靶子』",isQuiet)
            endif
            if(lv >= 70)then
                if(GetUnitAbilityLevel(u,'A04X') < 1)then
                    call UnitAddAbility(u,'A04X')
                    call upgradeSummonEcho(u,"精灵射手 - 习得『强弓』",isQuiet)
                endif
                call hattr.addAttackPhysical(u,diffLv*3,0)
                call hattr.addKnocking(u,diffLv*20,0)
            endif
            if(lv >= 100 and GetUnitAbilityLevel(u,'A04Y') < 1)then
                call UnitAddAbility(u,'A04Y')
                call hattrEffect.addFetterOdds(u,35.0,0)
                call hattrEffect.addFetterDuring(u,1.0,0)
                call upgradeSummonEcho(u,"精灵射手 - 习得『缚足』",isQuiet)
            endif
        elseif(triggerUID == 'H00U')then // 黑暗精灵
            call hattr.addLife(u,diffLv * 9,0)
			call hattr.addAttackPhysical(u,diffLv * 1.7,0)
			call hattr.addAttackMagic(u,diffLv * 1.7,0)
            if(lv >= 40)then
                if(GetUnitAbilityLevel(u,'A07T') < 1)then
                    call UnitAddAbility(u,'A07T')
                    call hattr.addAttackHuntType(u,"dark",0)
                    call hattrEffect.setBombOdds(u,100,0)
                    call hattrEffect.setBombRange(u,75,0)
                    call hattrEffect.setBombModel(u,"war3mapImported\\ShadowBurn.mdl")
                    call upgradeSummonEcho(u,"黑暗精灵 - 习得『蔽日』",isQuiet)
                endif
                call hattrEffect.setBombVal(u,lv * 3,0)
            endif
            if(lv >= 80 and GetUnitAbilityLevel(u,'A07V') < 1)then
                call UnitAddAbility(u,'A07V')
                call hattrNatural.addDark(u,35.0,0)
                call hattrEffect.addDarkVal(u,5.0,0)
                call hattrEffect.addDarkDuring(u,5.0,0)
                call upgradeSummonEcho(u,"黑暗精灵 - 习得『魅刃』",isQuiet)
            endif
            if(lv >= 200 and GetUnitAbilityLevel(u,'A07U') < 1)then
                call UnitAddAbility(u,'A07U')
                call hattrNatural.addGhost(u,100.0,0)
                call upgradeSummonEcho(u,"黑暗精灵 - 习得『邪殇』",isQuiet)
            endif
        endif
		if(triggerUID == 'H00C')then // 露娜
			call hattr.addLife(u,diffLv * 18,0)
			call hattr.addAttackPhysical(u,diffLv * 4.0,0)
            if(lv >= 80)then
                if(GetUnitAbilityLevel(u,'A04Z') < 1)then
                    call UnitAddAbility(u,'A04Z')
                    call hattrEffect.setBombOdds(u,100,0)
                    call hattrEffect.setBombRange(u,75,0)
                    call hattrEffect.setBombModel(u,"Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl")
                    call upgradeSummonEcho(u,"露娜 - 习得『月光』",isQuiet)
                endif
                call hattrEffect.setBombVal(u,lv * 3,0)
            endif
            if(lv >= 180 and GetUnitAbilityLevel(u,'A050') < 1)then
                call UnitAddAbility(u,'A050')
                call hattrEffect.addUnarmOdds(u,30.0,0)
                call hattrEffect.addUnarmDuring(u,4.0,0)
                call upgradeSummonEcho(u,"露娜 - 习得『威吓』",isQuiet)
            endif
        elseif(triggerUID == 'H013')then // 投刃车
            call hattr.addLife(u,diffLv * 20,0)
			call hattr.addAttackPhysical(u,diffLv * 5.5,0)
            if(lv >= 100)then
                if(GetUnitAbilityLevel(u,'A091') < 1)then
                    call UnitAddAbility(u,'A091')
                    call hattr.addAttackHuntType(u,"poison",0)
                    call hattrEffect.setToxicDuring(u,4.00,0)
                    call upgradeSummonEcho(u,"投刃车 - 习得『毒刃』",isQuiet)
                endif
                call hattrEffect.setToxicVal(u,lv * 0.8,0)
            endif
        endif
		if(triggerUID == 'H00D')then // 牛头巨兽
			call hattr.addLife(u,diffLv * 24,0)
			call hattr.addAttackPhysical(u,diffLv * 4.8,0)
			call hattr.addToughness(u,diffLv * 0.2,0)
            if(lv >= 15)then
                if(GetUnitAbilityLevel(u,'A04A') < 1)then
                    call UnitAddAbility(u,'A04A')
                    call hattrEffect.setCrackFlyOdds(u,35,0)
                    call hattrEffect.setCrackFlyHigh(u,150,0)
                    call hattrEffect.setCrackFlyDistance(u,50,0)
                    call upgradeSummonEcho(u,"牛头巨兽 - 习得『粉碎』",isQuiet)
                endif
                call hattrEffect.setCrackFlyVal(u,lv * 5,0)
            endif
            if(lv >= 100 and GetUnitAbilityLevel(u,'A051') < 1)then
                call UnitAddAbility(u,'A051')
                call hattrEffect.setSwimOdds(u,35,0)
                call hattrEffect.setSwimDuring(u,1.0,0)
                call upgradeSummonEcho(u,"牛头巨兽 - 习得『践踏』",isQuiet)
            endif
            if(lv >= 150 and GetUnitAbilityLevel(u,'A065') < 1)then
                call UnitAddAbility(u,'A065')
                call upgradeSummonEcho(u,"牛头巨兽 - 习得『狂热』",isQuiet)
            endif
        endif
		if(triggerUID == 'H00E')then // 山岭巨人
			call hattr.addLife(u,diffLv * 20,0)
			call hattr.addAttackPhysical(u,diffLv * 5.3,0)
			call hattr.addKnocking(u,diffLv * 2,0)
            if(lv >= 20 and GetUnitAbilityLevel(u,'A052') < 1)then
                call UnitAddAbility(u,'A052')
                call upgradeSummonEcho(u,"山岭巨人 - 习得『嘲讽』",isQuiet)
            endif
            if(lv >= 50)then
                set loc = GetUnitLoc(u)
                set tempu = hunit.createUnit(p,'H00L',loc)
                call RemoveLocation(loc)
                set loc = null
                call hGlobals.initSummon(tempu)
                call SetHeroLevel(tempu, lv, true)
                call hitem.copy(u,tempu)
                call GroupRemoveUnit(g_gp_summon, u)
                call hunit.del(u,0)
            endif
		elseif(triggerUID == 'H00L')then // 山岭巨人·战棍
			call hattr.addLife(u,diffLv * 28,0)
			call hattr.addAttackPhysical(u,diffLv * 7.0,0)
			call hattr.addKnocking(u,diffLv * 3.5,0)
            call hattrEffect.setCrackFlyVal(u,lv * 7,0)
            if(GetUnitAbilityLevel(u,'A052') < 1)then // 嘲讽
                call UnitAddAbility(u,'A052')
            endif
            if(GetUnitAbilityLevel(u,'A04C') < 1)then // 战棍
                call UnitAddAbility(u,'A04C')
                call hattr.addAttackHuntType(u,"soil",0)
                call hattrNatural.addSoilOppose(u,75.0,0)
                call hattrEffect.setCrackFlyOdds(u,20,0)
                call hattrEffect.setCrackFlyHigh(u,250,0)
                call hattrEffect.setCrackFlyDistance(u,200,0)
                call upgradeSummonEcho(u,"山岭巨人 - 习得『战棍』",isQuiet)
            endif
            if(lv >= 100 and GetUnitAbilityLevel(u,'A04B') < 1)then
                call UnitAddAbility(u,'A04B')
                call hattrEffect.setAttackSpeedVal(u,10,0)
                call hattrEffect.setAttackSpeedDuring(u,5,0)
                call upgradeSummonEcho(u,"山岭巨人 - 习得『过激』",isQuiet)
            endif
            if(lv >= 200 and GetUnitAbilityLevel(u,'A03Y') < 1)then
                call UnitAddAbility(u,'A03Y')
                call upgradeSummonEcho(u,"山岭巨人 - 习得『大闹一番』",isQuiet)
            endif
        endif
		if(triggerUID == 'H00F')then // 参天树精
			call hattr.addLife(u,diffLv * 48,0)
			call hattr.addAttackPhysical(u,diffLv * 8.1,0)
            if(lv >= 15 and GetUnitAbilityLevel(u,'A053') < 1)then
                call UnitAddAbility(u,'A053')
                call hattr.addKnocking(u,2000,0)
                call upgradeSummonEcho(u,"参天树精 - 习得『投掷』",isQuiet)
            endif
            if(lv >= 80 and GetUnitAbilityLevel(u,'A054') < 1)then
                call UnitAddAbility(u,'A054')
                call hattrEffect.setSwimOdds(u,20,0)
                call hattrEffect.setSwimDuring(u,2.5,0)
                call upgradeSummonEcho(u,"参天树精 - 习得『余震』",isQuiet)
            endif
            if(lv >= 160 and GetUnitAbilityLevel(u,'A055') < 1)then
                call UnitAddAbility(u,'A055')
                call hattr.addAttackHuntType(u,"wood",0)
                call hattrNatural.addWoodOppose(u,50.0,0)
                call upgradeSummonEcho(u,"参天树精 - 习得『森林之怒』",isQuiet)
            endif
		elseif(triggerUID == 'H00G')then // 青蓝暴龙
			call hattr.addLife(u,diffLv * 44,0)
			call hattr.addAttackPhysical(u,diffLv * 6.5,0)
			call hattr.addKnocking(u,diffLv * 4.5,0)
            if(lv >= 25 and GetUnitAbilityLevel(u,'A056') < 1)then
                call UnitAddAbility(u,'A056')
                call hattr.addLife(u,1000,0)
                call upgradeSummonEcho(u,"青蓝暴龙 - 开始『忍耐』",isQuiet)
            endif
            if(lv >= 50)then
                set loc = GetUnitLoc(u)
                call upgradeSummonEcho(u,"青蓝暴龙 - 『腾飞』",isQuiet)
                set tempu = hunit.createUnit(p,'H00H',loc)
                 call RemoveLocation(loc)
                set loc = null
                call hGlobals.initSummon(tempu)
                call SetHeroLevel(tempu,lv-49,false)
                call hitem.copy(u,tempu)
                call GroupRemoveUnit(g_gp_summon, u)
                call hunit.del(u,0)
            endif
		elseif(triggerUID == 'H00H')then // 青焰飞狱龙
			call hattr.addLife(u,diffLv * 110,0)
			call hattr.addAttackMagic(u,diffLv * 15.5,0)
			call hattr.addViolence(u,diffLv * 9.0,0)
            call hattr.addToughness(u,diffLv * 0.4,0)
            call hattrEffect.setBurnVal(u,lv * 5,0)
            if(lv >= 10)then
                if(GetUnitAbilityLevel(u,'A057') < 1)then
                    call UnitAddAbility(u,'A057')
                    call hattr.addAttackHuntType(u,"fire",0)
                    call hattrEffect.setBurnDuring(u,4,0)
                    call upgradeSummonEcho(u,"青焰飞狱龙 - 习得『狱焰』",isQuiet)
                endif
                call hattrEffect.setBurnVal(u,lv*3,0)
            endif
            if(lv >= 45 and GetUnitAbilityLevel(u,'A058') < 1)then
                call UnitAddAbility(u,'A058')
                call hattr.addAttackHuntType(u,"poison",0)
                call hattrEffect.setCorrosionVal(u,2,0)
                call hattrEffect.setCorrosionDuring(u,5,0)
                call upgradeSummonEcho(u,"青焰飞狱龙 - 习得『龙息』",isQuiet)
            endif
            if(lv >= 110 and GetUnitAbilityLevel(u,'A059') < 1)then
                call UnitAddAbility(u,'A059')
                call hattr.addAttackHuntType(u,"dragon",0)
                call hattrEffect.setAttackPhysicalVal(u,30,0)
                call hattrEffect.setAttackPhysicalDuring(u,40,0)
                call hattrEffect.setKnockingVal(u,150,0)
                call hattrEffect.setKnockingDuring(u,40,0)
                call hattrEffect.setLifeBackVal(u,0.5,0)
                call hattrEffect.setLifeBackDuring(u,40,0)
                call upgradeSummonEcho(u,"青焰飞狱龙 - 习得『龙之怒』",isQuiet)
            endif
            if(lv >= 175 and GetUnitAbilityLevel(u,'A05A') < 1)then
                call UnitAddAbility(u,'A05A')
                call hattrEffect.setChaosVal(u,6,0)
                call hattrEffect.setChaosDuring(u,8,0)
                call upgradeSummonEcho(u,"青焰飞狱龙 - 习得『惨沼』",isQuiet)
            endif
		elseif(triggerUID == 'H00V')then // 冰骨之龙
			call hattr.addLife(u,diffLv * 75,0)
			call hattr.addAttackMagic(u,diffLv * 12.0,0)
			call hattr.addAttackSpeed(u,diffLv * 0.03,0)
			call hattrNatural.addIce(u,diffLv * 0.06,0)
            if(lv >= 15 and GetUnitAbilityLevel(u,'A07Y') < 1)then
                call UnitAddAbility(u,'A07Y')
                call hattr.addAttackHuntType(u,"iceghost",0)
                call hattrEffect.setColdVal(u,20,0)
                call hattrEffect.setColdDuring(u,5,0)
                call upgradeSummonEcho(u,"冰骨之龙 - 习得『冰心魂』",isQuiet)
            endif
            if(lv >= 90 and GetUnitAbilityLevel(u,'A080') < 1)then
                call UnitAddAbility(u,'A080')
                call upgradeSummonEcho(u,"冰骨之龙 - 习得『暴风雪』",isQuiet)
            endif
            if(lv >= 175 and GetUnitAbilityLevel(u,'A081') < 1)then
                call UnitAddAbility(u,'A081')
                call hattr.addAttackHuntType(u,"dragon",0)
                call hattrEffect.setBombRange(u,50,0)
                call hattrEffect.setBombModel(u,"Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
                call upgradeSummonEcho(u,"冰骨之龙 - 习得『傲骨龙域』",isQuiet)
            endif
		elseif(triggerUID == 'H00Z')then // 炽热之龙
			call hattr.addLife(u,diffLv * 100,0)
			call hattr.addAttackPhysical(u,diffLv * 5.5,0)
			call hattr.addAttackMagic(u,diffLv * 5.5,0)
			call hattrNatural.addFire(u,diffLv * 0.075,0)
            if(lv >= 10)then
                if(GetUnitAbilityLevel(u,'A08E') < 1)then
                    call UnitAddAbility(u,'A08E')
                    call hattr.addAttackHuntType(u,"firedragon",0)
                    call hattr.addDefend(u,10,0)
                    call hattrEffect.setBurnDuring(u,3,0)
                    call upgradeSummonEcho(u,"炽热之龙 - 习得『真龙火驱』",isQuiet)
                endif
                call hattrEffect.setBurnVal(u,lv*8,0)
            endif
            if(lv >= 40)then
                if(GetUnitAbilityLevel(u,'A08F') < 1)then
                    call UnitAddAbility(u,'A08F')
                    call hattrEffect.setBombOdds(u,100,0)
                    call hattrEffect.setBombRange(u,100,0)
                    call hattrEffect.setBombModel(u,"Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl")
                    call upgradeSummonEcho(u,"炽热之龙 - 习得『大爆炎』",isQuiet)
                endif
                call hattrEffect.setBombVal(u,lv*5,0)
            endif
            if(lv >= 150 and GetUnitAbilityLevel(u,'A08G') < 1)then
                call UnitAddAbility(u,'A08G')
                call upgradeSummonEcho(u,"炽热之龙 - 习得『大焚火』",isQuiet)
            endif
		elseif(triggerUID == 'H010' or triggerUID == 'H011')then // 火凤凰
			call hattr.addLife(u,diffLv * 110,0)
			call hattr.addAttackPhysical(u,diffLv * 7,0)
			call hattr.addToughness(u,diffLv * 0.2,0)
			call hattrNatural.addFire(u,diffLv * 0.2,0)
            if(lv >= 10 and GetUnitAbilityLevel(u,'A08M') < 1)then
                call UnitAddAbility(u,'A08M')
                call hattr.addAttackHuntType(u,"fire",0)
                call hattr.addDefend(u,10,0)
                call hattrNatural.addFireOppose(u,200,0)
                call hattrNatural.subWaterOppose(u,50,0)
                call upgradeSummonEcho(u,"火凤凰 - 习得『火鸟』",isQuiet)
            endif
            if(lv >= 50 and GetUnitAbilityLevel(u,'A08N') < 1)then
                call UnitAddAbility(u,'A08N')
                call upgradeSummonEcho(u,"火凤凰 - 习得『涅磐』",isQuiet)
            endif
            if(lv >= 150 and GetUnitAbilityLevel(u,'A08O') < 1)then
                call UnitAddAbility(u,'A08O')
                call upgradeSummonEcho(u,"火凤凰 - 习得『展翅』",isQuiet)
            endif
		endif
        call hhero.setHeroPrevLevel(u,lv)
        set p = null
        set loc = null
        set tempu = null
    endmethod