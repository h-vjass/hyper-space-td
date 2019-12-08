
globals

location Loc_C = Location(2048,2048)
location Loc_Ring = Location(2048,2048)
location Loc_JiuGuan = Location(1960,2128)
location Loc_JiuGuanBorn = Location(2061,1851)

string musicBattle = null

integer array H_MAP_LV
integer array H_MAP_LV_GIFT
integer g_gift_count = 0
real REBORN_HERO = 30
real REBORN_SUMMON = 90

integer g_diff = 1
string array g_diff_label
timer g_timer_wave = null
integer g_temp_mon_limit = 200
integer g_max_wave = 51
integer g_wave = 0
integer g_first_wave = 0
integer g_boss_mod = 3
real g_boss_ready_time = 60
real g_first_ready_time = 30.00
boolean g_waving = false
group g_crazy_boss = CreateGroup()
group g_crazy_be_boss = CreateGroup()

real g_game_speed = 1.00 //
real g_game_mon_loop = 2.70 // 每只怪出兵间隔
integer g_token_count = 0
integer g_building_count = 0
integer g_hero_count = 0
integer g_boss_count = 0
integer g_mon_count = 0
integer g_summon_count = 0

integer array g_token
integer array g_building
integer array g_hero
integer array g_boss
integer array g_mon
integer array g_summon

integer monRand = 1
integer bossRand = 1

boolean g_mon_isrunning = true
string array g_mon_label
real array g_mon_life
real array g_mon_defend
real array g_mon_move
real array g_mon_attackPhysical
string array g_boss_label
real array g_boss_life
real array g_boss_defend
real array g_boss_move
real array g_boss_attackPhysical
integer last_boss_uid = 0
boolean array g_summon_end
string array g_summon_glv
integer array g_summon_gold
real array g_summon_life
real array g_summon_mana
real array g_summon_manaback
real array g_summon_defend
real array g_summon_attackPhysical
real array g_summon_attackMagic
integer g_summon_ability_count = 0
integer array g_summon_ability
integer g_summon_count_e = 0
integer g_summon_count_d = 0
integer g_summon_count_c = 0
integer g_summon_count_b = 0
integer g_summon_count_a = 0
integer g_summon_count_s = 0
integer g_summon_count_ss = 0
integer g_summon_count_sss = 0
integer array g_summon_e
integer array g_summon_d
integer array g_summon_c
integer array g_summon_b
integer array g_summon_a
integer array g_summon_s
integer array g_summon_ss
integer array g_summon_sss

integer g_gp_max = 36
group g_gp_mon = CreateGroup()
group g_gp_boss = CreateGroup()
group g_gp_attack = CreateGroup()
group g_gp_summon = CreateGroup()
real g_ring_break_up = 0

real spaceDistance = 2304.00
real spaceInnerDistance = 640.00

integer spaceDegQty = 4
real array spaceDegX
real array spaceDegY
real array spaceDeg2X
real array spaceDeg2Y
real array spaceDeg3X
real array spaceDeg3Y
real array spaceDeg4X
real array spaceDeg4Y

rect rectSpaceDeg1_1 = null
rect rectSpaceDeg1_2 = null
rect rectSpaceDeg1_3 = null
rect rectSpaceDeg1_4 = null
rect rectSpaceDeg2_1 = null
rect rectSpaceDeg2_2 = null
rect rectSpaceDeg2_3 = null
rect rectSpaceDeg2_4 = null
rect rectSpaceDeg3_1 = null
rect rectSpaceDeg3_2 = null
rect rectSpaceDeg3_3 = null
rect rectSpaceDeg3_4 = null
rect rectSpaceDeg4_1 = null
rect rectSpaceDeg4_2 = null
rect rectSpaceDeg4_3 = null
rect rectSpaceDeg4_4 = null

rect rectHanabi = null
rect rectLeave = null
rect rectBattle = null
rect rectBattleInner = null


weathereffect rectWeathereffect = null
string rectWeatherString = null

integer momentItems_count = 0
integer array momentItems

unit u_kabei = null
unit u_timering = null
unit u_timering1 = null
unit u_timering2 = null
unit u_timering3 = null
unit u_zhanglao = null
integer array u_dead_timering
force playerForce = CreateForce()
player player_ally = null
boolean array player_isvip
integer array player_prolv


// 任务指示
quest q_into_space = null
quest q_quit_space = null
quest q_death_quest = null

// 技能
group sk_group_fusuzhiguang = null

// 排行榜
leaderboard g_leaderboard = null

// VIP
integer vipItempools_count = 0
integer array vipItempools

endglobals

struct hGlobals

    private static method registerToken takes nothing returns nothing
        set g_token_count = 36
        set g_token[1] = 'n002'
        set g_token[2] = 'n003'
        set g_token[3] = 'n004'
        set g_token[4] = 'n00K'
        set g_token[5] = 'n00J'
        set g_token[6] = 'n00H'
        set g_token[7] = 'n00I'
        set g_token[8] = 'n00U'
        set g_token[9] = 'n00L'
        set g_token[10] = 'n00M'
        set g_token[11] = 'n00T'
        set g_token[12] = 'n00V'
        set g_token[13] = 'n00O'
        set g_token[14] = 'n00P'
        set g_token[15] = 'n00Q'
        set g_token[16] = 'n00R'
        set g_token[17] = 'n00S'
        set g_token[18] = 'n00N'
        set g_token[19] = 'n00D'
        set g_token[20] = 'n00E'
        set g_token[21] = 'n00G'
        set g_token[22] = 'n00W'
        set g_token[23] = 'n00X'
        set g_token[24] = 'n00Y'
        set g_token[25] = 'n005'
        set g_token[26] = 'n007'
        set g_token[27] = 'n008'
        set g_token[28] = 'n009'
        set g_token[29] = 'n00A'
        set g_token[30] = 'n00B'
        set g_token[31] = 'n00C'
        set g_token[32] = 'n04U'
        set g_token[33] = 'n04R'
        set g_token[34] = 'n04W'
        set g_token[35] = 'n04Z'
        set g_token[36] = 'n050'
    endmethod

    private static method registerBuilding takes nothing returns nothing
        set g_building_count = 4
        set g_building[1] = 'n00Z'
        set g_building[2] = 'n04S'
        set g_building[3] = 'n010'
        set g_building[4] = 'n040'
    endmethod

    private static method registerGift takes nothing returns nothing
        set g_gift_count = 30
        set H_MAP_LV_GIFT[2] = 'R00E'
        set H_MAP_LV_GIFT[3] = 'R008'
        set H_MAP_LV_GIFT[4] = 'R003'
        set H_MAP_LV_GIFT[5] = 'R004'
        set H_MAP_LV_GIFT[6] = 'R005'
        set H_MAP_LV_GIFT[7] = 'R006'
        set H_MAP_LV_GIFT[8] = 'R007'
        set H_MAP_LV_GIFT[9] = 'R00F'
        set H_MAP_LV_GIFT[10] = 'R009'
        set H_MAP_LV_GIFT[11] = 'R00A'
        set H_MAP_LV_GIFT[12] = 'R00B'
        set H_MAP_LV_GIFT[13] = 'R00C'
        set H_MAP_LV_GIFT[14] = 'R00D'
        set H_MAP_LV_GIFT[15] = 'R00G'
        set H_MAP_LV_GIFT[16] = 'R00U'
        set H_MAP_LV_GIFT[17] = 'R00T'
        set H_MAP_LV_GIFT[18] = 'R00H'
        set H_MAP_LV_GIFT[19] = 'R00I'
        set H_MAP_LV_GIFT[20] = 'R00J'
        set H_MAP_LV_GIFT[21] = 'R00K'
        set H_MAP_LV_GIFT[22] = 'R00L'
        set H_MAP_LV_GIFT[23] = 'R00M'
        set H_MAP_LV_GIFT[24] = 'R00N'
        set H_MAP_LV_GIFT[25] = 'R00O'
        set H_MAP_LV_GIFT[26] = 'R00P'
        set H_MAP_LV_GIFT[27] = 'R00Q'
        set H_MAP_LV_GIFT[28] = 'R00R'
        set H_MAP_LV_GIFT[29] = 'R00S'
        set H_MAP_LV_GIFT[30] = 'R00V'
    endmethod

    private static method registerHero takes integer id,string typex,string avatar,real attackBaseSpace returns nothing
        set g_hero_count = g_hero_count + 1
        set g_hero[g_hero_count] = id
        call hhero.setHeroType(g_hero[g_hero_count],typex)
        call hunit.setAvatar(g_hero[g_hero_count],avatar)
        call hunit.setAttackSpeedBaseSpace(g_hero[g_hero_count],attackBaseSpace)
    endmethod

    public static method registerSummon takes integer uid,boolean isEnd,string glv,integer gold,real life,real mana,real manaback,real defend,real attackPhysical,real attackMagic,real attackSpeedBaseSpace returns nothing
        set g_summon_count = g_summon_count + 1
        set g_summon[g_summon_count] = uid
        set g_summon_glv[g_summon_count] = glv
        set g_summon_end[g_summon_count] = isEnd
        set g_summon_gold[g_summon_count] = gold
        set g_summon_life[g_summon_count] = life
        set g_summon_mana[g_summon_count] = mana
        set g_summon_manaback[g_summon_count] = manaback
        set g_summon_defend[g_summon_count] = defend
        set g_summon_attackPhysical[g_summon_count] = attackPhysical
        set g_summon_attackMagic[g_summon_count] = attackMagic
        call hunit.setAttackSpeedBaseSpace(g_summon[g_summon_count],attackSpeedBaseSpace)
        call SaveStr(hash_unit,uid,0,glv)
        if(glv == "SSS")then
            set g_summon_count_sss = g_summon_count_sss + 1
            set g_summon_sss[g_summon_count_sss] = uid
        elseif(glv == "SS")then
            set g_summon_count_ss = g_summon_count_ss + 1
            set g_summon_ss[g_summon_count_ss] = uid
        elseif(glv == "S")then
            set g_summon_count_s = g_summon_count_s + 1
            set g_summon_s[g_summon_count_s] = uid
        elseif(glv == "A")then
            set g_summon_count_a = g_summon_count_a + 1
            set g_summon_a[g_summon_count_a] = uid
        elseif(glv == "B")then
            set g_summon_count_b = g_summon_count_b + 1
            set g_summon_b[g_summon_count_b] = uid
        elseif(glv == "C")then
            set g_summon_count_c = g_summon_count_c + 1
            set g_summon_c[g_summon_count_c] = uid
        elseif(glv == "D")then
            set g_summon_count_d = g_summon_count_d + 1
            set g_summon_d[g_summon_count_d] = uid
        elseif(glv == "E")then
            set g_summon_count_e = g_summon_count_e + 1
            set g_summon_e[g_summon_count_e] = uid
        endif
    endmethod

    public static method registerSummonAbility takes integer uid,integer ablid returns nothing
        local integer i = 0
        set g_summon_ability_count = g_summon_ability_count + 1
        set g_summon_ability[g_summon_ability_count] = ablid
        if(LoadBoolean(hash_unit,uid,110) == false)then
            call SaveBoolean(hash_unit,uid,110,true)
            call SaveInteger(hash_unit,uid,120,0)
        endif
        set i = LoadInteger(hash_unit,uid,120) // 这种兵有几个技能
        call SaveInteger(hash_unit,uid,130+i,ablid)
        call SaveInteger(hash_unit,uid,120,i+1)
    endmethod

    public static method getSummonTargetUid takes integer triggerUID returns integer
        local integer targetUID = 0
        local integer array targetArr
        local string targetGlv = LoadStr(hash_unit,triggerUID,0)
        if(triggerUID == 'o009')then // 帐篷
            set targetArr[1] = 'o00A' // N 农场
            set targetArr[2] = 'o00M' // N 地穴
            set targetArr[3] = 'o01S' // N 月亮井
            set targetUID = targetArr[GetRandomInt(1,3)]
        elseif("SSS" == targetGlv)then
            return 0
        elseif("SS" == targetGlv)then
            set targetUID = g_summon_sss[GetRandomInt(1,g_summon_count_sss)]
        elseif("S" == targetGlv)then
            set targetUID = g_summon_ss[GetRandomInt(1,g_summon_count_ss)]
        elseif("A" == targetGlv)then
            set targetUID = g_summon_s[GetRandomInt(1,g_summon_count_s)]
        elseif("B" == targetGlv)then
            set targetUID = g_summon_a[GetRandomInt(1,g_summon_count_a)]
        elseif("C" == targetGlv)then
            set targetUID = g_summon_b[GetRandomInt(1,g_summon_count_b)]
        elseif("D" == targetGlv)then
            set targetUID = g_summon_c[GetRandomInt(1,g_summon_count_c)]
        elseif("E" == targetGlv)then
            set targetUID = g_summon_d[GetRandomInt(1,g_summon_count_d)]
        endif
        set targetGlv = null
        return targetUID
    endmethod

    public static method setSummonAbility takes unit u,integer abid returns nothing
        if(u == null or abid == 0)then
            return
        endif
        call UnitAddAbility(u,abid)
        call UnitMakeAbilityPermanent( u, true, abid)
        if(abid == 'A04K')then // N 地穴 - 尖针
            call hattr.addHuntRebound(u,35,0)
        elseif(abid == 'A056')then // C 民兵 - 勋章
            call hattrEffect.addAttackPhysicalVal(u,6,0)
            call hattrEffect.addAttackPhysicalDuring(u,7,0)
        elseif(abid == 'A04T')then // C 血精灵 - 心灵之火
            call hattrEffect.addAttackMagicVal(u,8,0)
            call hattrEffect.addAttackMagicDuring(u,5,0)
        elseif(abid == 'A09B')then // C 邪恶苦力 - 奋力
            call hattr.addKnocking(u,300,0)
        elseif(abid == 'A08A')then // C 树人 - 本质
            call hattr.addAttackHuntType(u,"wood",0)
            call hattr.addSwimOppose(u,10,0)
        elseif(abid == 'A09C')then // C 兽人大兵 - 斧力
            call hattr.addLife(u,300,0)
        elseif(abid == 'A09D')then // C 萨满牛祭司 - 净化
            // 攻击事件实现
        elseif(abid == 'A07O')then // C 巨魔巫医 - 荼毒
            call hattrEffect.addToxicVal(u,33,0)
            call hattrEffect.addToxicDuring(u,4,0)
        elseif(abid == 'A09E')then // C 暗夜弓手 - 穿透
            call hattrEffect.addKnockingVal(u,70,0)
            call hattrEffect.addKnockingDuring(u,10,0)
        elseif(abid == 'A09F')then // C 角鹰弓手 - 俯视穿透
            call hattrEffect.addCorrosionVal(u,2,0)
            call hattrEffect.addCorrosionDuring(u,6,0)
        elseif(abid == 'A054')then // C 德鲁伊 - 荆棘
            call hattrEffect.addTwineVal(u,10,0)
            call hattrEffect.addTwineDuring(u,3,0)
        endif
        if(abid == 'A04M')then // B 步兵 - 铁壁
            call hattr.addDefend(u,10.0,0)
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
        elseif(abid == 'A09H')then // B 灯提白牛 - 虚灵
            call hattr.addAttackHuntType(u,"ghost",0)
            // 攻击事件实现
        elseif(abid == 'A091')then // B 飞龙骑士 - 毒标
            call hattr.addAttackHuntType(u,"poison",0)
            call hattrEffect.addToxicVal(u,47,0)
            call hattrEffect.addToxicDuring(u,5,0)
        elseif(abid == 'A04W')then // B 精灵龙 - 魔焰
            call hattr.addAttackHuntType(u,"light",0)
            call hattrEffect.addLightningChainOdds(u,33.0,0)
            call hattrEffect.addLightningChainVal(u,120,0)
            call hattrEffect.addLightningChainQty(u,1,0)
            call hattrEffect.setLightningChainModel(u,lightningCode_molizhiyan)
        elseif(abid == 'A08V')then // B 巨魔枪士 - 丧心病狂
            // 攻击事件实现\施法事件实现
        elseif(abid == 'A089')then // B 狼骑 - 诱捕
            call hattrEffect.addFetterOdds(u,8.0,0)
            call hattrEffect.addFetterDuring(u,7,0)
        elseif(abid == 'A04Y')then // B 龙鹰骑士 - 缚足
            call hattrEffect.addFetterOdds(u,45.0,0)
            call hattrEffect.addFetterDuring(u,1.0,0)
        elseif(abid == 'A049')then // B 露娜 - 月刃
            call hattrEffect.addBombOdds(u,40,0)
            call hattrEffect.addBombVal(u,65,0)
            call hattrEffect.addBombRange(u,50,0)
            call hattrEffect.setBombModel(u,"Objects\\Spawnmodels\\Critters\\Albatross\\CritterBloodAlbatross.mdl")
        elseif(abid == 'A055')then // B 树妖 - 绿枪
            call hattr.addAttackHuntType(u,"wood",0)
            call hattrNatural.addWood(u,40,0)
        elseif(abid == 'A04Q')then // B 铁枪手 - 扳机精通
            call hattr.addAttackSpeed(u,35.0,0)
            call hattr.addKnocking(u,500.0,0)
        elseif(abid == 'A09G')then // B 邪恶兽人大兵 - 狂斧
            call hattr.addSplit(u,15.0,0)
            call hattr.addSplitRange(u,200.0,0)
        elseif(abid == 'A09K')then // B 熊战德鲁伊 - 咆哮
            // 攻击事件实现
        elseif(abid == 'A053')then // B 远古树精 - 投掷
            call hattrEffect.addKnockingVal(u,120,0)
            call hattrEffect.addKnockingDuring(u,30,0)
        elseif(abid == 'A03V')then // B 牧师 - 光导医疗
            // 施法事件实现
            call IssueImmediateOrder(u, "healon")
        elseif(abid == 'A07K')then // B 巫师 - 邪术
            // 施法事件实现
            call IssueImmediateOrder(u, "bloodluston")
        endif
        if(abid == 'A04U')then // A 剑士 - 刃风式
            call hattr.addAttackHuntType(u,"wind",0)
            call hattrEffect.addAttackSpeedVal(u,14,0)
            call hattrEffect.addAttackSpeedDuring(u,8,0)
        elseif(abid == 'A03O')then // A 骑士 - 斩铁式
            // 技能自带效果
        elseif(abid == 'A07V')then // A 黑暗精灵 - 魅刃
            call hattr.addAttackHuntType(u,"dark",0)
            call hattrEffect.addDarkDuring(u,5.0,0)
        elseif(abid == 'A07T')then // A 幻界飞龙 - 蔽日
            call hattrEffect.addBombOdds(u,80,0)
            call hattrEffect.addBombVal(u,175,0)
            call hattrEffect.addBombRange(u,200,0)
            call hattrEffect.setBombModel(u,"war3mapImported\\eff_ShadowBurn.mdl")
        elseif(abid == 'A04S')then // A 巨魔蝙蝠骑手 - 火焰燃油
            call hattr.addAttackHuntType(u,"fire",0)
            call hattrNatural.addFire(u,25.0,0)
        elseif(abid == 'A09M')then // A 科多骑手 - 吞噬
            // 攻击事件实现
        elseif(abid == 'A059')then // A 骷骨巫长 - 蛊虫
            call hattr.addAttackHuntType(u,"poison",0)
            call hattrEffect.addChaosVal(u,10,0)
            call hattrEffect.addChaosDuring(u,6,0)
            call hattrEffect.addToxicVal(u,86,0)
            call hattrEffect.addToxicDuring(u,6,0)
        elseif(abid == 'A09L')then // A 猛熊德鲁伊 - 猛熊之躯
            call hattr.addLife(u,1800,0)
            call hattr.addLifeBack(u,40,0)
        elseif(abid == 'A09J')then // A 魔导师 - 感应
            // 攻击事件实现
        elseif(abid == 'A08G')then // A 女巫 - 大焚火
            call hattr.addAttackHuntType(u,"fire",0)
        elseif(abid == 'A04P')then // A 迫击炮小队 - 黑色火药
            call hattrEffect.addBurnVal(u,60,0)
            call hattrEffect.addBurnDuring(u,20,0)
        elseif(abid == 'A052')then // A 山岭巨人 - 大喊
            // 攻击事件实现
        elseif(abid == 'A08D')then // A 狮鹫骑士 - 风暴战锤
            call hattr.addAttackHuntType(u,"thunder",0)
            call hattrEffect.addLightningChainOdds(u,10.0,0)
            call hattrEffect.addLightningChainVal(u,280,0)
            call hattrEffect.addLightningChainQty(u,5,0)
            call hattrEffect.setLightningChainModel(u,lightningCode_shandianlian_ci)
        elseif(abid == 'A051')then // A 图腾战牛 - 抨击
            call hattrEffect.addSwimOdds(u,35,0)
            call hattrEffect.addSwimDuring(u,1.0,0)
        elseif(abid == 'A09I')then // A 邪恶狼骑 - 掠夺
            // 攻击事件实现
        elseif(abid == 'A07J')then // A 邪恶巫师 - 痛苦链
            call hattrEffect.addLightningChainOdds(u,13.0,0)
            call hattrEffect.addLightningChainVal(u,345,0)
            call hattrEffect.addLightningChainQty(u,3,0)
            call hattrEffect.setLightningChainModel(u,lightningCode_siwangzhizhi)
        elseif(abid == 'A08Z')then // A 战争古树 - 林撼
            call hattr.addAttackHuntType(u,"wood",0)
            call hattrEffect.addSwimOdds(u,45,0)
            call hattrEffect.addSwimDuring(u,1.0,0)
        elseif(abid == 'A05A')then // A 秘迹古树 - 秘沼
            call hattr.addAttackHuntType(u,"water",0)
            call hattrEffect.addChaosVal(u,12,0)
            call hattrEffect.addChaosDuring(u,4,0)
            call hattrEffect.addTwineVal(u,25,0)
            call hattrEffect.addTwineDuring(u,4,0)
        elseif(abid == 'A04I')then // A 苍风古树 - 烈风
            call hattr.addAttackHuntType(u,"wind",0)
            call hattrEffect.addWindVal(u,3,0)
            call hattrEffect.addWindDuring(u,30.0,0)
        elseif(abid == 'A07Y')then // A 智慧古树 - 通明
            // 攻击事件实现
        elseif(abid == 'A04E')then // A 伐木机 - 齿轮割裂
            // 攻击事件实现
        elseif(abid == 'A08F')then // A 机关兵 - 灼热火焰
            call hattrEffect.addBurnVal(u,300,0)
            call hattrEffect.addBurnDuring(u,3,0)
        elseif(abid == 'A04X')then // A 精灵射手 - 强弓
            call hattrEffect.addAttackSpeedVal(u,20,0)
            call hattrEffect.addAttackSpeedDuring(u,3,0)
        elseif(abid == 'A09P')then // A 骷髅魔法师 - 深渊
            // 攻击事件实现
        elseif(abid == 'A08E')then // A 娜迦海兵 - 激浪
            // 攻击事件实现
        endif
        if(abid == 'A07X')then // S 飞行机器 - 机关枪
            // 攻击事件实现
        elseif(abid == 'A04R')then // S 坦克部队 - 烈性炮弹
            call hattr.addAttackHuntType(u,"fire",0)
            call hattrEffect.addBurnVal(u,235,0)
            call hattrEffect.addBurnDuring(u,3,0)
            call hattrEffect.addBombVal(u,400,0)
            call hattrEffect.addBombOdds(u,50,0)
            call hattrEffect.addBombRange(u,300,0)
            call hattrEffect.setBombModel(u,"war3mapImported\\eff_NewGroundEX.mdl")
        elseif(abid == 'A07U')then // S 邪恶科多骑手 - 邪殇
            call hattrNatural.addGhost(u,500.0,0)
        elseif(abid == 'A058')then // S 奇美拉 - 龙息
            call hattr.addAttackHuntType(u,"fire",0)
            call hattr.addAttackHuntType(u,"ice",0)
            call hattrEffect.addCorrosionVal(u,14,0)
            call hattrEffect.addCorrosionDuring(u,5,0)
        elseif(abid == 'A04C')then // S 山岭巨人·战棍 - 战棍
            call hattr.addAttackHuntType(u,"soil",0)
            call hattrNatural.addSoilOppose(u,75.0,0)
            call hattrEffect.addSwimOdds(u,60,0)
            call hattrEffect.addSwimDuring(u,1.0,0)
        elseif(abid == 'A03T')then // S 寒冰女巫 - 冰心魂
            call hattr.addAttackHuntType(u,"ice",0)
            call hattrEffect.addFreezeVal(u,35,0)
            call hattrEffect.addFreezeDuring(u,4,0)
            call hattrEffect.addColdVal(u,10,0)
            call hattrEffect.addColdDuring(u,4,0)
        elseif(abid == 'A080')then // S 冰魔怪 - 暴风雪
            // 施法事件实现
        elseif(abid == 'A081')then // S 冰魔灵 - 千里冰封
            // 施法事件实现
            call hattrEffect.addBombRange(u,100,0)
            call hattrEffect.setBombModel(u,"Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
        elseif(abid == 'A08O')then // S 火凤凰 - 涅磐
            // 重生系统实现
            // 攻击事件实现
        elseif(abid == 'A04A')then // S 牛头人酋长 - 粉碎
            call hattrEffect.addCorrosionVal(u,5,0)
            call hattrEffect.addCorrosionDuring(u,7,0)
            call hattrEffect.addSwimOdds(u,20,0)
            call hattrEffect.addSwimDuring(u,1.0,0)
        elseif(abid == 'A04Z')then // S 月之女祭司 - 星落
            call hattrEffect.addBombVal(u,600,0)
            call hattrEffect.addBombOdds(u,100,0)
            call hattrEffect.addBombRange(u,100,0)
            call hattrEffect.setBombModel(u,"Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl")
        elseif(abid == 'A09S')then // S 暗影猎手 - 毒手
            call hattr.addAttackHuntType(u,"poison",0)
            call hattrEffect.addToxicVal(u,127,0)
            call hattrEffect.addToxicDuring(u,5,0)
        elseif(abid == 'A03Y')then // S 黑暗游侠 - 黑羽箭
            call hattr.addAttackHuntType(u,"dark",0)
            call hattrEffect.addCorrosionVal(u,8,0)
            call hattrEffect.addCorrosionDuring(u,6,0)
        endif
        if(abid == 'A04B')then // SS 悟空 - 过激顽石
            call hattrEffect.addAttackSpeedVal(u,15,0)
            call hattrEffect.addAttackSpeedDuring(u,10,0)
            call hattrEffect.addKnockingVal(u,300,0)
            call hattrEffect.addKnockingDuring(u,10,0)
        elseif(abid == 'A08T')then // SS 牛头人武士 - 狂野
            call hattr.addHemophagia(u,20,0)
            call hattr.addKnocking(u,5000,0)
            call hattrEffect.addSwimOdds(u,60,0)
            call hattrEffect.addSwimDuring(u,1.0,0)
        elseif(abid == 'A050')then // SS 守望者 - 威吓
            call hattrEffect.addUnarmOdds(u,20.0,0)
            call hattrEffect.addUnarmDuring(u,5.0,0)
        elseif(abid == 'A08M')then // SS 熊猫酒仙 - 心火
            call hattr.addAttackHuntType(u,"fire",0)
            call hattrNatural.addFireOppose(u,100,0)
            call hattrNatural.subWaterOppose(u,50,0)
        elseif(abid == 'A09U')then // SS 恶魔猎手 - 旋环切割
            // 攻击事件实现
        elseif(abid == 'A065')then // SS 水魔灵 - 水体
            call hattr.addAttackHuntType(u,"water",0)
            call hattrNatural.addWater(u,100,0)
            call hattrNatural.addWaterOppose(u,100,0)
        elseif(abid == 'A09T')then // SS 小鹿 - 缠绕
            // 攻击事件实现
        elseif(abid == 'A09V')then // SS 逸风 - 致命一击
            call hattr.addAttackHuntType(u,"wind",0)
            call hattr.addHuntAmplitude(u,50,0)
        elseif(abid == 'A09W')then // SS 山丘之王 - 雷霆之怒
            // 攻击事件实现
        endif
        if(abid == 'A09X')then // SSS 潮汐巨人 - 重踏
            // 攻击事件实现
        elseif(abid == 'A08N')then // SSS 御龙骑士 - 龙神爪
            call hattr.addAttackHuntType(u,"dragonfire",0)
            call hattr.addAttackPhysical(u,3000,0)
            call hattr.addAttackMagic(u,3000,0)
        elseif(abid == 'A09Y')then // SSS 画笔仙女 - 笔墨一道
            // 攻击事件实现
        elseif(abid == 'A09Z')then // SSS 电气 - 哔哩哔哩
            call hattr.addAttackHuntType(u,"thunder",0)
            call hattr.addAttackSpeed(u,50,0)
            call hattrEffect.addLightningChainOdds(u,100.0,0)
            call hattrEffect.addLightningChainVal(u,3700,0)
            call hattrEffect.addLightningChainQty(u,3,0)
            call hattrEffect.setLightningChainModel(u,lightningCode_shandianlian_zhu)
        elseif(abid == 'A057')then // SSS 娜迦女王 - 腐蚀之液
            call hattr.addAttackHuntType(u,"poison",0)
            call hattrEffect.addToxicVal(u,2200,0)
            call hattrEffect.addToxicDuring(u,5,0)
            call hattrEffect.addCorrosionVal(u,20,0)
            call hattrEffect.addCorrosionDuring(u,5,0)
        elseif(abid == 'A0A0')then // SSS 圣人·阿德莱 - 天启
            // 攻击事件实现
        endif
    endmethod

    public static method initSummonAbility takes unit u,unit tplu1,unit tplu2 returns nothing
        local integer total = 0
        local integer i = 0
        local integer ki = 0
        local integer uid = 0
        if(u != null)then
            set uid = GetUnitTypeId(u)
            set i = LoadInteger(hash_unit,uid,120)
            if(i > 0)then
                loop
                    exitwhen i < 0
                        set ki = LoadInteger(hash_unit,uid,130+i)
                        if(GetUnitAbilityLevel(u,ki) <= 0)then
                            call thistype.setSummonAbility(u,ki)
                        endif
                    set i = i - 1
                endloop
            endif
            set i = g_summon_ability_count
            loop
                exitwhen (i < 1 or total >= 4)
                    if(GetUnitAbilityLevel(u,g_summon_ability[i]) > 0)then
                        set total = total + 1
                    endif
                set i = i - 1
            endloop
        endif
        if((tplu1 != null or tplu2 != null) and total < 4)then
            set i = g_summon_ability_count
            loop
                exitwhen (i < 1 or total >= 4)
                    if(GetUnitAbilityLevel(u,g_summon_ability[i]) <= 0 and (GetUnitAbilityLevel(tplu1,g_summon_ability[i]) > 0 or GetUnitAbilityLevel(tplu2,g_summon_ability[i]) > 0))then
                        call thistype.setSummonAbility(u,g_summon_ability[i])
                        set total = total + 1
                    endif
                set i = i - 1
            endloop
        endif
    endmethod
    
    public static method onSummonSkillHappen takes nothing returns nothing
		local unit triggerUnit = hevent.getTriggerUnit()
        local unit targetUnit = hevent.getTargetUnit()
        local integer triggerUID = 0
        local integer targetUID = 0
		local integer skillid = hevent.getTriggerSkill()
        local player p = null
        local real x = 0
        local real y = 0
		local location loc = null
		local hAttrHuntBean bean = 0
		local group g = null
		local unit u = null
        local timer t = null
		local integer gold = 0
		local integer i = 0
		local hFilter hf
        local texttag ttg = null
        // 单位
		if(skillid == 'A03Q')then // 解散
            set triggerUID = GetUnitTypeId(triggerUnit)
            set p = GetOwningPlayer(triggerUnit)
			set i = 1
			loop
				exitwhen i > g_summon_count
					if(triggerUID == g_summon[i])then
						set gold = R2I( g_summon_gold[i]  * 0.60 )
						call hplayer.addGold(p,gold)
						call DoNothing() YDNL exitwhen true//(  )
					endif
				set i = i+1
			endloop
			call hmsg.echoTo(p,"尘归尘，土归土，"+GetUnitName(triggerUnit)+"已化作时空碎片~ 回收金： |cffffff80"+I2S(gold)+" G|r",0)
			call heffect.toUnitLoc("war3mapImported\\eff_DreadAwe.mdx",triggerUnit,0)
			call hitem.drop(triggerUnit)
			call GroupRemoveUnit(g_gp_summon, triggerUnit)
			call hunit.del(triggerUnit,0)
        elseif(skillid == 'A06G')then // 建筑移动
            set loc = GetSpellTargetLoc()
            call SetUnitPositionLoc( triggerUnit, loc )
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
                call thistype.initSummon(u)
                call thistype.initSummonAbility(u,null,null)
                set u = null
            endif
            call RemoveLocation(loc)
            set loc = null
        elseif(skillid == 'A08X' or skillid == 'A04F' or skillid == 'A09N' or skillid == 'A09O')then // 四种符咒
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
						call hattr.subDefend(u,20,30)
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
        elseif(skillid == 'A04J')then // 升级连锁
            set p = GetOwningPlayer(triggerUnit)
            set triggerUID = GetUnitTypeId(triggerUnit)
            if(LoadStr(hash_unit,triggerUID,0) != LoadStr(hash_unit,GetUnitTypeId(targetUnit),0))then
                set ttg = hmsg.ttg2Unit(triggerUnit,"不同阶级的单位不可以进行连锁升级",7,"",0,1.70,60.00)
                call hmsg.style(ttg,"scale",0,0.1)
                set ttg = null
            elseif(p != GetOwningPlayer(targetUnit))then
                set ttg = hmsg.ttg2Unit(triggerUnit,"不是自己的单位暂时不能进行连锁升级",7,"",0,1.70,60.00)
                call hmsg.style(ttg,"scale",0,0.1)
                set ttg = null
            else
                call hlightning.unit2unit(lightningCode_linghun_suolian, targetUnit, triggerUnit, 0.6)
                set x = GetUnitX(triggerUnit)
                set y = GetUnitY(triggerUnit)
                set targetUID = thistype.getSummonTargetUid(triggerUID)
                if(targetUID != 0)then
                    call GroupRemoveUnit(g_gp_summon, triggerUnit)
                    call GroupRemoveUnit(g_gp_summon, targetUnit)
                    call ShowUnit(triggerUnit, false)
                    call ShowUnit(targetUnit, false)
                    set u = hunit.createUnitXY(p,targetUID, x, y)
                    set ttg = hmsg.ttg2Unit(u,GetUnitName(triggerUnit)+"成功连锁升级为 |cffffff80"+GetUnitName(u)+"|r",7,"",0,1.70,60.00)
                    call hmsg.style(ttg,"scale",0,0.1)
                    set ttg = null
                    call thistype.initSummon(u)
                    call thistype.initSummonAbility(u,triggerUnit,targetUnit)
                    call hitem.copy(triggerUnit,u)
                    call hitem.copy(targetUnit,u)
                    call RemoveUnit(triggerUnit)
                    call RemoveUnit(targetUnit)
                else
                    set ttg = hmsg.ttg2Unit(triggerUnit,"无法升级",7,"",0,1.70,60.00)
                    call hmsg.style(ttg,"scale",0,0.1)
                    set ttg = null
                endif
            endif
		elseif(skillid == 'A08V')then // B 巨魔枪士 - 丧心病狂
			call hunit.setUserData(triggerUnit,777,4.5)
			call hattr.addHuntReboundOppose(triggerUnit,100,4.5)
			call hattr.addUnarmOppose(triggerUnit,100,4.5)
		elseif(skillid == 'A03V' and targetUnit != null)then // B 牧师 - 光导医疗
			call hattr.addLifeBack(targetUnit,70,5.00)
        elseif(skillid == 'A07K' and targetUnit != null)then // B 巫师 - 邪术
			call hattr.addLifeBack(targetUnit,30,20)
            call hattr.addAttackSpeed(targetUnit,45,20)
        endif
        set triggerUnit = null
        set targetUnit = null
        set p = null
		set loc = null
		set g = null
		set u = null
        set t = null
	endmethod

    public static method onSummonAttack takes nothing returns nothing
		local unit triggerUnit = hevent.getTriggerUnit()
		local unit targetUnit = hevent.getTargetUnit()
        local integer uid = GetUnitTypeId(triggerUnit)
        local integer rand = GetRandomInt(1,30)
        local integer i = 0
		local location loc = null
        local hFilter filter
        local group g = null
        local unit u = null
        local hAttrHuntBean bean
        local real percent = 0.00
        local boolean isHuntHappen = false
        if(triggerUnit == null or targetUnit == null)then
            set triggerUnit = null
            set targetUnit = null
            return
        endif
        // glv
		if(triggerUnit != null)then
			// 等级升级
			if(GetUnitAbilityLevel(triggerUnit,'A09A') > 0 and GetRandomInt(1,3) == 1)then // LV0
				set percent = 1.00
				call UnitRemoveAbility(triggerUnit,'A09A')
				call UnitAddAbility(triggerUnit,'A03W')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A03W' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A03W') > 0 and GetRandomInt(1,4) == 1)then // LV1
				set percent = 2.00
				call UnitRemoveAbility(triggerUnit,'A03W')
				call UnitAddAbility(triggerUnit,'A044')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A044' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A044') > 0 and GetRandomInt(1,5) == 1)then // LV2
				set percent = 2.50
				call UnitRemoveAbility(triggerUnit,'A044')
				call UnitAddAbility(triggerUnit,'A07Z')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A07Z' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A07Z') > 0 and GetRandomInt(1,8) == 1)then // LV3
				set percent = 5.00
				call UnitRemoveAbility(triggerUnit,'A07Z')
				call UnitAddAbility(triggerUnit,'A088')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A088' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A088') > 0 and GetRandomInt(1,10) == 1)then // LV4
				set percent = 6.50
				call UnitRemoveAbility(triggerUnit,'A088')
				call UnitAddAbility(triggerUnit,'A08B')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A08B' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A08B') > 0 and GetRandomInt(1,12) == 1)then // LV5
				set percent = 8.00
				call UnitRemoveAbility(triggerUnit,'A08B')
				call UnitAddAbility(triggerUnit,'A08C')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A08C' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A08C') > 0 and GetRandomInt(1,14) == 1)then // LV6
				set percent = 10.00
				call UnitRemoveAbility(triggerUnit,'A08C')
				call UnitAddAbility(triggerUnit,'A08L')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A08L' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A08L') > 0 and GetRandomInt(1,16) == 1)then // LV7
				set percent = 12.00
				call UnitRemoveAbility(triggerUnit,'A08L')
				call UnitAddAbility(triggerUnit,'A08S')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A08S' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			elseif(GetUnitAbilityLevel(triggerUnit,'A08S') > 0 and GetRandomInt(1,20) == 1)then // LV8
				set percent = 16.00
				call UnitRemoveAbility(triggerUnit,'A08S')
				call UnitAddAbility(triggerUnit,'A090')
				call UnitMakeAbilityPermanent( triggerUnit, true, 'A090' )
                call heffect.toUnit("war3mapImported\\eff_HolyHit.mdl",triggerUnit,"origin",1.00)
			//elseif(GetUnitAbilityLevel(triggerUnit,'A090') > 0 and GetRandomInt(1,20) == 1)then // LV9
			endif
			if(percent > 0.00)then
				if(GetUnitAbilityLevel(triggerUnit,'A03U') > 0)then //E
					call hattr.addLife(triggerUnit,3*percent,0)
					call hattr.addAttackPhysical(triggerUnit,0.8*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A064') > 0)then //D
					call hattr.addLife(triggerUnit,5*percent,0)
					call hattr.addAttackPhysical(triggerUnit,1.4*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A066') > 0)then //C
					call hattr.addLife(triggerUnit,8*percent,0)
					call hattr.addAttackSpeed(triggerUnit,0.33*percent,0)
					call hattr.addAttackPhysical(triggerUnit,1.6*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A067') > 0)then //B
					call hattr.addLife(triggerUnit,13*percent,0)
					call hattr.addAttackSpeed(triggerUnit,0.67*percent,0)
					call hattr.addAttackPhysical(triggerUnit,1.8*percent,0)
					call hattr.addAttackMagic(triggerUnit,1.8*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A069') > 0)then //A
					call hattr.addLife(triggerUnit,18*percent,0)
					call hattr.addAttackSpeed(triggerUnit,1.00*percent,0)
					call hattr.addAttackPhysical(triggerUnit,3.4*percent,0)
					call hattr.addAttackMagic(triggerUnit,3.4*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A068') > 0)then //S
					call hattr.addLife(triggerUnit,25*percent,0)
					call hattr.addAttackSpeed(triggerUnit,1.33*percent,0)
					call hattr.addAttackPhysical(triggerUnit,6.4*percent,0)
					call hattr.addAttackMagic(triggerUnit,6.4*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A06A') > 0)then //SS
					call hattr.addLife(triggerUnit,36*percent,0)
					call hattr.addAttackSpeed(triggerUnit,1.67*percent,0)
					call hattr.addAttackPhysical(triggerUnit,12.2*percent,0)
					call hattr.addAttackMagic(triggerUnit,12.2*percent,0)
				elseif(GetUnitAbilityLevel(triggerUnit,'A06B') > 0)then //SSS
					call hattr.addLife(triggerUnit,48*percent,0)
					call hattr.addAttackSpeed(triggerUnit,2.00*percent,0)
					call hattr.addAttackPhysical(triggerUnit,25.0*percent,0)
					call hattr.addAttackMagic(triggerUnit,25.0*percent,0)
				endif
			endif
		endif
        if(hunit.getMana(triggerUnit) < 50)then
            return
        endif
        // 1/10几率
        if(rand<=3)then
            // A 邪恶狼骑 - 掠夺
            if(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09I') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call haward.forUnit(triggerUnit,0,g_wave * 5,0)
            // S 飞行机器 - 机关枪
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09D') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call hattr.addAttackSpeed(triggerUnit,75,4)
                call hattr.addKnocking(triggerUnit,1000,4)
                call heffect.toUnit("Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl",triggerUnit,"weapon",4.00)
            endif
        endif
        // 1/9几率
        if(rand<=3)then
            // A 魔导师 - 感应
            if(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09J') >= 1 and isHuntHappen == false)then
                set isHuntHappen = true
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("war3mapImported\\eff_StaticRemnant.mdl",targetUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(triggerUnit,300.0,function hFilter.get )
                call filter.destroy()
                set bean = hAttrHuntBean.create()
                set bean.damage = 325
                set bean.fromUnit = triggerUnit
                set bean.huntEff = "Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl"
                set bean.huntKind = "skill"
                set bean.huntType = "thunder"
                set i = 0
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 5)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        set bean.toUnit = u
                        call hattrHunt.huntUnit(bean)
                        set u = null
                        set i = i + 1
                endloop
                call bean.destroy()
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            endif
        endif
        // 1/6几率
        if(rand<=5)then
            if(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A08V') >= 1)then // B 巨魔枪士 - 丧心病狂
                call IssueImmediateOrder( triggerUnit, "avatar" )
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A080') >= 1)then // S 冰魔怪 - 暴风雪
                call IssuePointOrder( triggerUnit, "blizzard",GetUnitX(targetUnit),GetUnitY(targetUnit))
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A08G') >= 1)then // A 女巫 - 大焚火
                call IssuePointOrder( triggerUnit, "breathoffire",GetUnitX(targetUnit),GetUnitY(targetUnit))
            endif
        endif
        // 1/5几率
        if(rand<=6)then
            // C 萨满牛祭司 - 净化
            if(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09D') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call hattr.subMove(targetUnit,70,5)
                call hattr.subAttackSpeed(targetUnit,45,5)
                call heffect.toUnit("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl",targetUnit,"origin",1.00)
            // B 灯提白牛 - 虚灵
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09H') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("ReplaceableTextures\\CommandButtonsDisabled\\Dispersion.mdl",triggerUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isBuilding(false)
                call filter.isAlly(true,triggerUnit)
                call filter.isOwnerPlayer(false,players[12] )
                set g = hgroup.createByUnit(triggerUnit,600.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call hattr.addAvoid(u,12,10)
                        call heffect.toUnit("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl",u,"origin",1.00)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            //  B 熊战德鲁伊 - 咆哮
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09K') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl",triggerUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isBuilding(false)
                call filter.isAlly(true,triggerUnit)
                call filter.isOwnerPlayer(false,players[12] )
                set g = hgroup.createByUnit(triggerUnit,600.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call hattr.addAttackPhysical(u,35,10)
                        call hattr.addAttackSpeed(u,5,10)
                        call heffect.toUnit("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl",u,"origin",1.00)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            // A 山岭巨人 - 大喊
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A052') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("Abilities\\Spells\\NightElf\\Taunt\\TauntCaster.mdl",triggerUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isBuilding(false)
                call filter.isAlly(true,triggerUnit)
                call filter.isOwnerPlayer(false,players[12] )
                set g = hgroup.createByUnit(triggerUnit,300.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call hattr.addAttackHuntType(u,"soil",20)
                        call hattr.addAim(u,20,20)
                        call hattrEffect.addTortuaVal(u,250,20)
                        call hattrEffect.addTortuaDuring(u,10,20)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            // A 智慧古树 - 通明
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A07Y') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("war3mapImported\\eff_Energy_Spark.mdl",triggerUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isBuilding(false)
                call filter.isAlly(true,triggerUnit)
                call filter.isOwnerPlayer(false,players[12] )
                set g = hgroup.createByUnit(triggerUnit,700.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call hattr.addViolence(u,500,10)
                        call heffect.toUnit("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl",u,"origin",1.00)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            endif
        endif
        // 1/3几率
        if(rand<=10)then
            // A 娜迦海兵 - 激浪
            if(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A08E') >= 1)then
                call hunit.subMana(triggerUnit,50)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(triggerUnit,500.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call hattr.subDefend(u,3,5)
                        call heffect.toUnit("war3mapImported\\eff_Pillar_of_Flame_Blue.mdl",u,"origin",1.00)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            // SS 恶魔猎手 - 旋环切割
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09U') >= 1 and isHuntHappen == false)then
                set isHuntHappen = true
                call hunit.subMana(triggerUnit,75)
                call heffect.toUnit("war3mapImported\\eff_DustWindCirclefaster.mdl",triggerUnit,"origin",1.50)
                call heffect.toUnit("war3mapImported\\eff_light_speed_cutting.mdl",triggerUnit,"origin",1.50)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(targetUnit,800.0,function hFilter.get )
                call filter.destroy()
                set bean = hAttrHuntBean.create()
                set bean.damage = 0.55 * hattr.getAttackPhysical(triggerUnit)
                set bean.fromUnit = triggerUnit
                set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
                set bean.huntKind = "attack"
                set bean.huntType = "physical"
                set i = 0
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 6)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        set bean.toUnit = u
                        call hattrHunt.huntUnit(bean)
                        set u = null
                        set i = i+1
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            // SSS 画笔仙女 - 笔墨一道
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09Y') >= 1)then
                call hunit.subMana(triggerUnit,75)
                set u = hunit.createUnitXYFacing(GetOwningPlayer(triggerUnit),'n05T',GetUnitX(triggerUnit),GetUnitY(triggerUnit),hlogic.getDegBetweenUnit(triggerUnit,targetUnit))
                call SetUnitAnimation( u, "spell" )
                call hunit.del(u,1.16)
                set hxy.x = GetUnitX(triggerUnit)
                set hxy.y = GetUnitY(triggerUnit)
                set hxy = hlogic.polarProjection(hxy,700,hlogic.getDegBetweenUnit(u,targetUnit))
                set loc = Location(hxy.x,hxy.y)
                set bean = hAttrHuntBean.create()
                set bean.damage = 0.4*hattr.getAttackMagic(triggerUnit)
                set bean.fromUnit = triggerUnit
                set bean.huntKind = "skill"
                set bean.huntType = "realdark"
                call hskill.leap(u,loc,12,null,150,false,bean)
                call bean.destroy()
            // SSS 圣人·阿德莱 - 天启
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A0A0') >= 1)then
                call hunit.subMana(triggerUnit,100)
                call heffect.toUnit("war3mapImported\\eff_light_spin.mdl",triggerUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isBuilding(false)
                call filter.isAlly(true,triggerUnit)
                call filter.isOwnerPlayer(false,players[12] )
                set g = hgroup.createByUnit(triggerUnit,800.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call hattr.addAttackSpeed(u,35,5)
                        call hattr.addLifeBack(u,75,5)
                        call heffect.toUnit("war3mapImported\\eff_different_landing.mdl",u,"origin",1.00)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            endif
        endif
        // 1/2几率
        if(rand<=15)then
            // A 科多骑手 - 吞噬
            if(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09M') >= 1)then
                call hunit.subMana(triggerUnit,50)
                call hattr.addAttackPhysical(triggerUnit,25,10)
                call hattr.subMove(targetUnit,50,5)
                call heffect.toUnit("Abilities\\Spells\\Orc\\Devour\\DevourEffectArt.mdl",targetUnit,"origin",1.00)
            // A 伐木机 - 齿轮割裂
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A04E') >= 1 and isHuntHappen == false)then
                set isHuntHappen = true
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("war3mapImported\\eff_round_dance4.mdl",targetUnit,"origin",1.00)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(targetUnit,250.0,function hFilter.get )
                call filter.destroy()
                set bean = hAttrHuntBean.create()
                set bean.damage = 425
                set bean.fromUnit = triggerUnit
                set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
                set bean.huntKind = "skill"
                set bean.huntType = "metal"
                set i = 0
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 5)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        set bean.toUnit = u
                        call hattrHunt.huntUnit(bean)
                        set u = null
                        set i = i+1
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            // A 骷髅魔法师 - 深渊
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09P') >= 1)then
                call hunit.subMana(triggerUnit,50)
                set u = hunit.createUnitXY(GetOwningPlayer(triggerUnit),'n05S',GetUnitX(targetUnit),GetUnitY(targetUnit))
                call hunit.kill(u,6)
                call hattr.setAttackPhysical(u,0.5*hattr.getAttackMagic(triggerUnit),0)
                set u = null
            // SS 山丘之王 - 雷霆之怒
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09W') >= 1 and isHuntHappen == false)then
                set isHuntHappen = true
                call hunit.subMana(triggerUnit,75)
                call heffect.toUnit("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl",triggerUnit,"origin",1.50)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(targetUnit,400.0,function hFilter.get )
                call filter.destroy()
                set bean = hAttrHuntBean.create()
                set bean.damage = 0.30 * hattr.getAttackPhysical(triggerUnit)
                set bean.fromUnit = triggerUnit
                set bean.huntEff = "war3mapImported\\eff_thunderbolt.mdl"
                set bean.huntKind = "skill"
                set bean.huntType = "thunder"
                set i = 0
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        if(i < 6)then
                            set bean.toUnit = u
                            call hattrHunt.huntUnit(bean)
                        endif
                        call hattr.subMove(u,150,3)
                        set u = null
                        set i = i+1
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            // SSS 潮汐巨人 - 重踏
            elseif(GetRandomInt(1,2) == 1 and GetUnitAbilityLevel(triggerUnit,'A09X') >= 1 and isHuntHappen == false)then
                set isHuntHappen = true
                call hunit.subMana(triggerUnit,100)
                call heffect.toUnit("war3mapImported\\eff_lava_burst2.mdl",triggerUnit,"origin",1.50)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(targetUnit,400.0,function hFilter.get )
                call filter.destroy()
                set bean = hAttrHuntBean.create()
                set bean.damage = 0.60 * hattr.getAttackPhysical(triggerUnit)
                set bean.fromUnit = triggerUnit
                set bean.huntEff = "war3mapImported\\eff_red_flame_flash.mdl"
                set bean.huntKind = "skill"
                set bean.huntType = "fire"
                set i = 0
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        if(i < 6)then
                            set bean.toUnit = u
                            call hattrHunt.huntUnit(bean)
                        endif
                        call hability.swim(u,1)
                        set u = null
                        set i = i+1
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            endif
        endif
        // 100%触发
        if(GetUnitAbilityLevel(triggerUnit,'A08V') >= 1 and hunit.getUserData(triggerUnit) == 777)then
            // B 巨魔枪士 - 丧心病狂
            call hattr.subLifeBack(triggerUnit,30,4.5)
            call hattr.addAttackSpeed(triggerUnit,70,4.5)
            call hattr.addAttackPhysical(triggerUnit,10,4.5)
            call heffect.toUnit("war3mapImported\\eff_BloodElementalMissile.mdl",triggerUnit,"origin",1.00)
        endif
        // S 冰魔灵 - 千里冰封
        if(GetUnitAbilityLevel(triggerUnit,'A081') >= 1)then
            set i = GetUnitUserData(triggerUnit)
            if(i<0)then
                set i = 0
            endif
            if(i>=5)then
                call hunit.subMana(triggerUnit,50)
                call heffect.toUnit("war3mapImported\\eff_Enchantment.mdl",triggerUnit,"origin",1.00)
                call hattrEffect.addBombVal(triggerUnit,700,3)
                call SetUnitUserData(triggerUnit,0)
            else
                call SetUnitUserData(triggerUnit,i+1)
            endif
        endif
        // S 火凤凰 - 涅磐
        if(GetUnitAbilityLevel(triggerUnit,'A08O') >= 1)then
            set i = GetUnitUserData(triggerUnit)
            if(i<0)then
                set i = 0
            endif
            if(i>=5)then
                call hunit.subMana(triggerUnit,50)
                set u = hunit.createUnitXYFacing(GetOwningPlayer(triggerUnit),'n050',GetUnitX(triggerUnit),GetUnitY(triggerUnit),hlogic.getDegBetweenUnit(triggerUnit,targetUnit))
                call SetUnitVertexColor( u, 255, 255, 255, 150 )
                call SetUnitAnimation( u, "spell" )
                call hunit.del(u,0.7)
                set hxy.x = GetUnitX(triggerUnit)
                set hxy.y = GetUnitY(triggerUnit)
                set hxy = hlogic.polarProjection(hxy,800,hlogic.getDegBetweenUnit(u,targetUnit))
                set loc = Location(hxy.x,hxy.y)
                set bean = hAttrHuntBean.create()
                set bean.damage = 1000
                set bean.fromUnit = triggerUnit
                set bean.huntKind = "skill"
                set bean.huntType = "realfire"
                call hskill.leap(u,loc,20,null,150,false,bean)
                call bean.destroy()
                call SetUnitUserData(triggerUnit,0)
            else
                call SetUnitUserData(triggerUnit,i+1)
            endif
        endif
        set triggerUnit = null
        set targetUnit = null
		set loc = null
        set g = null
        set u = null
	endmethod

    public static method initSummon takes unit u returns nothing
        local integer triggerUID = GetUnitTypeId(u)
		local integer i = 0
		set i = 1
        call hattr.setMove(u,0,0)
		loop
			exitwhen i > g_summon_count
				if(triggerUID == g_summon[i])then
                    if(IsUnitInGroup(u, g_gp_summon) == true)then
                        call hattr.resetSkill(u)
                        call UnitRemoveType(u,UNIT_TYPE_MECHANICAL)
                        call hplayer.adjustGold(GetOwningPlayer(u))
                        call hattr.setLife(u,g_summon_life[i],0)
                        call hattr.setMana(u,g_summon_mana[i],0)
                        call hattr.setManaBack(u,g_summon_manaback[i],0)
                        call hattr.setDefend(u,g_summon_defend[i],0)
                        call hattr.setAttackPhysical(u,g_summon_attackPhysical[i],0)
                        call hattr.setAttackMagic(u,g_summon_attackMagic[i],0)
                    else
                        call GroupAddUnit(g_gp_summon, u)
                        call hplayer.adjustGold(GetOwningPlayer(u))
                        call hattr.setLife(u,g_summon_life[i],0)
                        call hattr.setMana(u,g_summon_mana[i],0)
                        call hattr.setManaBack(u,g_summon_manaback[i],0)
                        call hattr.setDefend(u,g_summon_defend[i],0)
                        call hattr.setAttackPhysical(u,g_summon_attackPhysical[i],0)
                        call hattr.setAttackMagic(u,g_summon_attackMagic[i],0)
                        call UnitAddAbility(u,ITEM_ABILITY)
                        call hitem.initUnit(u)
                        call UnitAddAbility(u,'A03Q')
                        call UnitAddAbility(u,'A045') // reborn
                        call UnitAddAbility(u,'A06G') // moveup
                        call UnitMakeAbilityPermanent( u, true, 'A03Q' )
                        call UnitMakeAbilityPermanent( u, true, 'A045' )
                        call UnitMakeAbilityPermanent( u, true, 'A06G' )
                        if(g_summon_glv[i] != "N")then
                            call UnitAddAbility(u,'A09A') // lv0
                            call UnitMakeAbilityPermanent( u, true, 'A09A' )
                        endif
                        // 如果不是终结单位，则赋予升级的权利
                        if(g_summon_end[i] == false)then
                            call UnitAddAbility(u,'A04J') // link
                            call UnitMakeAbilityPermanent( u, true, 'A04J' )
                        endif
                        // glv
                        if(g_summon_glv[i] == "E")then
                            call UnitAddAbility(u,'A03U')
                            call UnitMakeAbilityPermanent( u, true, 'A03U' )
                        elseif(g_summon_glv[i] == "D")then
                            call UnitAddAbility(u,'A064')
                            call UnitMakeAbilityPermanent( u, true, 'A064' )
                        elseif(g_summon_glv[i] == "C")then
                            call UnitAddAbility(u,'A066')
                            call UnitMakeAbilityPermanent( u, true, 'A066' )
                        elseif(g_summon_glv[i] == "B")then
                            call UnitAddAbility(u,'A067')
                            call UnitMakeAbilityPermanent( u, true, 'A067' )
                        elseif(g_summon_glv[i] == "A")then
                            call UnitAddAbility(u,'A069')
                            call UnitMakeAbilityPermanent( u, true, 'A069' )
                        elseif(g_summon_glv[i] == "S")then
                            call UnitAddAbility(u,'A068')
                            call UnitMakeAbilityPermanent( u, true, 'A068' )
                        elseif(g_summon_glv[i] == "SS")then
                            call UnitAddAbility(u,'A06A')
                            call UnitMakeAbilityPermanent( u, true, 'A06A' )
                        elseif(g_summon_glv[i] == "SSS")then
                            call UnitAddAbility(u,'A06B')
                            call UnitMakeAbilityPermanent( u, true, 'A06B' )
                        elseif(g_summon_glv[i] == "N")then
                            call UnitAddAbility(u,'A06C')
                            call UnitMakeAbilityPermanent( u, true, 'A06C' )
                        endif
                        call TriggerRegisterUnitEvent( sommonDeadTg, u, EVENT_UNIT_DEATH )
                        call TriggerRegisterUnitEvent( sommonPointTg, u, EVENT_UNIT_ISSUED_POINT_ORDER )
                        call hevent.onSkillHappen(u,function thistype.onSummonSkillHappen)
                        call hevent.onAttack(u,function thistype.onSummonAttack)
                    endif

					call DoNothing() YDNL exitwhen true//(  )
				endif
			set i = i+1
		endloop
    endmethod

    private static method deadSummonCall takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local integer uid = htime.getInteger(t,1)
        local integer lv = htime.getInteger(t,2)
        local real x = htime.getReal(t,3)
        local real y = htime.getReal(t,4)
        local boolean isDrop = htime.getBoolean(t,5)
        local player p = htime.getPlayer(t,6)
        local unit tempu = htime.getUnit(t,7)
        local unit u = null
        call htime.delTimer(t)
        if(g_mon_isrunning == true)then
            set u = hunit.createUnitXY(p,uid,x,y)
            call initSummon(u)
            call thistype.initSummonAbility(u,tempu,null)
            call heffect.toUnit("Abilities\\Spells\\Other\\Awaken\\Awaken.mdl",u,"origin",0.80)
            call hitem.copy(tempu,u)
            call hunit.del(tempu,0)
        endif
        set t = null
        set p = null
        set tempu = null
        set u = null
    endmethod
    public static method deadSummon takes unit u returns nothing
		local unit killer = hevent.getLastDamageUnit(u)
		local real rebornTime = 0
        local integer uid = GetUnitTypeId(u)
        local integer lv = GetUnitLevel(u)
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        local boolean isDrop = true
        local player p = GetOwningPlayer(u)
        local string name = GetUnitName(u)
        local timer t = null
        local unit tempu = null
        local unit deathShadow = null
        if(g_mon_isrunning == true)then
            // 死亡时间计算
            set rebornTime = 10.00
            if(GetUnitAbilityLevel(u,'A09A') > 0)then // LV0
                set rebornTime = rebornTime + 1
            elseif(GetUnitAbilityLevel(u,'A03W') > 0)then // LV1
                set rebornTime = rebornTime + 2
            elseif(GetUnitAbilityLevel(u,'A044') > 0)then // LV2
                set rebornTime = rebornTime + 3
            elseif(GetUnitAbilityLevel(u,'A07Z') > 0)then // LV3
                set rebornTime = rebornTime + 4
            elseif(GetUnitAbilityLevel(u,'A088') > 0)then // LV4
                set rebornTime = rebornTime + 5
            elseif(GetUnitAbilityLevel(u,'A08B') > 0)then // LV5
                set rebornTime = rebornTime + 6
            elseif(GetUnitAbilityLevel(u,'A08C') > 0)then // LV6
                set rebornTime = rebornTime + 7
            elseif(GetUnitAbilityLevel(u,'A08L') > 0)then // LV7
                set rebornTime = rebornTime + 8
            elseif(GetUnitAbilityLevel(u,'A08S') > 0)then // LV8
                set rebornTime = rebornTime + 9
            elseif(GetUnitAbilityLevel(u,'A090') > 0)then // LV9
                set rebornTime = rebornTime + 10
            endif
            if("SSS" == LoadStr(hash_unit,uid,0))then
                set rebornTime = rebornTime + 40
            elseif("SS" == LoadStr(hash_unit,uid,0))then
                set rebornTime = rebornTime + 30
            elseif("S" == LoadStr(hash_unit,uid,0))then
                set rebornTime = rebornTime + 20
            elseif("A" == LoadStr(hash_unit,uid,0))then
                set rebornTime = rebornTime + 10
            elseif("N" == LoadStr(hash_unit,uid,0))then
                set rebornTime = rebornTime + 25
            endif
            // 假死亡
            if(hgroup.isIn(u,sk_group_fusuzhiguang) == true)then
                set rebornTime = 0
                set isDrop = false
                call hunit.rebornAtXY(u,x,y,0,0.00)
                set killer = null
                set p = null
                set name = null
                return
            endif
            // 正常死亡
            if(GetUnitAbilityLevel(u,'A08O') >= 1)then // 火凤凰 - 涅磐
                set rebornTime = rebornTime * 0.5
            endif
            if(his.ownItem(u,'I00H'))then // 拥有 SSS 时空之轮精粹
                set rebornTime = rebornTime * 0.25
            endif
            set tempu = hunit.createUnitXYFacing(p,u_dead_timering[GetUnitFoodUsed(u)],x,y,270)
            call SetUnitVertexColor(tempu, 255, 255, 255, 200)
            call hunit.shadow(uid,x+15,y+15,270,50,0,75,120,rebornTime)
            if(rebornTime>0)then
                call SetUnitTimeScalePercent(tempu, 1000.0 / rebornTime)
            endif
            call hitem.copy(u,tempu)
            call thistype.initSummonAbility(tempu,u,null)
            call GroupRemoveUnit(g_gp_summon, u)
            call hunit.del(u,0)
            set t = htime.setTimeout(rebornTime,function thistype.deadSummonCall)
            call htime.setInteger(t,1,uid)
            call htime.setInteger(t,2,lv)
            call htime.setReal(t,3,x)
            call htime.setReal(t,4,y)
            call htime.setBoolean(t,5,isDrop)
            call htime.setPlayer(t,6,p)
            call htime.setUnit(t,7,tempu)
        endif
        set killer = null
        set p = null
        set name = null
        set t = null
        set tempu = null
        set deathShadow = null
    endmethod

    private static method itemUseAction takes nothing returns nothing
        local unit u = hevent.getTriggerUnit()
        local item it = hevent.getTriggerItem()
        local integer itid = hevent.getId()
        local player p = GetOwningPlayer(u)
        local string txt = null
        if(itid == 'I00H')then
            call hattr.addLifeBack(u,20.0,60.0)
            call hattr.addManaBack(u,3.0,60.0)
        endif
        set u = null
        set it = null
        set p = null
        set txt = null
    endmethod

    //
    public static method registerItem0 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        //--------------------
        set hitembean = hItemBean.create() // N 时空之轮碎片
		set hitembean.item_id = 'I001'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // SSS 时空之轮精粹
		set hitembean.item_id = 'I00H'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        // mix
        call hitemMix.newFormula('I00H',1) // 时空之轮精粹
		call hitemMix.addFlag('I00H','I001',9) // 时空之轮碎片
    endmethod

    //[商店]杂货
    public static method registerItem1 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        //--------------------
        set hitembean = hItemBean.create() // E 铁皮树枝
		set hitembean.item_id = 'I018'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 25
		set hitembean.attackMagic = 25
		set hitembean.knocking = 50
		set hitembean.violence = 50
		set hitembean.avoid = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // E 铁锹
		set hitembean.item_id = 'I00I'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 70
		set hitembean.attackSpeed = -3
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // E 铁铲
		set hitembean.item_id = 'I00E'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 105
		set hitembean.attackSpeed = -5
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // E 锈迹的铁圈木盾
		set hitembean.item_id = 'I002'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.defend = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // E 银色的钥匙
		set hitembean.item_id = 'I00K'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.aim = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // E 鲜血色的钥匙
		set hitembean.item_id = 'I00G'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.hemophagia = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // E 瓶装水
		set hitembean.item_id = 'I00D'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.water = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // D 可爱的玩偶
		set hitembean.item_id = 'I00F'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackMagic = 180
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // D 诅咒的玩偶
		set hitembean.item_id = 'I00C'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 180
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() //  D 优秀望远镜
		set hitembean.item_id = 'I01K'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.sight = 500
		call hitem.format(hitembean)
		call hitembean.destroy()
    endmethod

    //[商店]营地
    public static method registerItem2 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        //--------------------
        set hitembean = hItemBean.create() // D 破烂的短剑
		set hitembean.item_id = 'I000'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 250
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // D 蛊惑之鼓
		set hitembean.item_id = 'I012'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.avoid = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // D 侵蚀的铁圈木盾
		set hitembean.item_id = 'I00X'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.defend = 6
        set hitembean.toughness = 30
        set hitembean.corrosionVal = 2
        set hitembean.corrosionDuring = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // D 无用的水晶球
		set hitembean.item_id = 'I01I'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 生命护身符
		set hitembean.item_id = 'I016'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 3
		set hitembean.life = 1000
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 魔法护身符
		set hitembean.item_id = 'I017'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.mana = 500
        set hitembean.resistance = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 恢复指环
		set hitembean.item_id = 'I013'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.lifeBack = 50
        set hitembean.toughness = 50
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 魔法指环
		set hitembean.item_id = 'I014'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.fireOppose = 5
        set hitembean.soilOppose = 5
        set hitembean.waterOppose = 5
        set hitembean.iceOppose = 5
        set hitembean.windOppose = 5
        set hitembean.lightOppose = 5
        set hitembean.darkOppose = 5
        set hitembean.woodOppose = 5
        set hitembean.thunderOppose = 5
        set hitembean.poisonOppose = 5
        set hitembean.ghostOppose = 5
        set hitembean.metalOppose = 5
        set hitembean.dragonOppose = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 小美头环
		set hitembean.item_id = 'I00L'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.huntAmplitude = 6
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 全知全能之书
		set hitembean.item_id = 'I01J'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.expRatio = 45
		call hitem.format(hitembean)
		call hitembean.destroy()
    endmethod

    //[商店]磨坊
    public static method registerItem3 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // B 水
		set hitembean.item_id = 'I00J'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.water = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 铁制之爪
		set hitembean.item_id = 'I00Z'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 650
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 优越之戒
		set hitembean.item_id = 'I015'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.defend = 9
        set hitembean.life = 500
		set hitembean.knockingOppose = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 神秘腰带
		set hitembean.item_id = 'I019'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.resistance = 35
		set hitembean.violence = 600
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 加速手套
		set hitembean.item_id = 'I010'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.attackSpeed = 25
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 小柔的红宝石
		set hitembean.item_id = 'I00W'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.hemophagia = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 闪避护符
		set hitembean.item_id = 'I029'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.avoid = 13
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 专注护符
		set hitembean.item_id = 'I02A'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.aim = 30
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // B 吸血面具
		set hitembean.item_id = 'I02B'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.hemophagia = 5
        set hitembean.hemophagiaSkill = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        //--------------------
        set hitembean = hItemBean.create() // C 速度之靴
		set hitembean.item_id = 'I02J'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.avoid = 7
        set hitembean.move = 200
		call hitem.format(hitembean)
		call hitembean.destroy()
    endmethod

    //[商店]铁铺
    public static method registerItem4 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // A 坚固的盾牌
		set hitembean.item_id = 'I00B'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.defend = 25
        set hitembean.toughness = 200
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 清醒的钻石
		set hitembean.item_id = 'I01L'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.swimOppose = 30
		set hitembean.crackFlyOppose = 30
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 残暴之爪
		set hitembean.item_id = 'I011'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 900
        set hitembean.corrosionVal = 7
        set hitembean.corrosionDuring = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 精红球
		set hitembean.item_id = 'I01A'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.lifeBack = 150
        set hitembean.hemophagia = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 烈焰之剑
		set hitembean.item_id = 'I01M'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.burnVal = 180
        set hitembean.burnDuring = 6
        set hitembean.knocking = 950
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 冰原之剑
		set hitembean.item_id = 'I01R'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.freezeVal = 10
        set hitembean.freezeDuring = 6
        set hitembean.violence = 1000
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 侠盗短剑
		set hitembean.item_id = 'I028'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackPhysical = 1100
        set hitembean.attackSpeed = 45
        set hitembean.knocking = 400
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 赤炼斧
		set hitembean.item_id = 'I02C'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.split = 25
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // A 大木棍
		set hitembean.item_id = 'I02D'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.knocking = 1500
		call hitem.format(hitembean)
		call hitembean.destroy()
    endmethod

    //[商店]奇异宝店
    public static method registerItem5 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // S 恶魔的紫色血浆
		set hitembean.item_id = 'I00Y'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SS 恶魔的灵魂
		set hitembean.item_id = 'I01G'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.bluntVal = 75
        set hitembean.muggleVal = 75
        set hitembean.tortuaVal = 65
        set hitembean.silentOdds = 5
        set hitembean.unarmOdds = 5
        set hitembean.fetterOdds = 5
        set hitembean.bluntDuring = 3
        set hitembean.muggleDuring = 3
        set hitembean.tortuaDuring = 3
        set hitembean.silentDuring = 3
        set hitembean.unarmDuring = 3
        set hitembean.fetterDuring = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SS 毒液根
		set hitembean.item_id = 'I01C'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.poison = 155
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SS 骸骨灵魂
		set hitembean.item_id = 'I01Q'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.attackHuntType = "ghost"
		set hitembean.ghost = 70
        set hitembean.dark = 50
        set hitembean.corrosionVal = 20
        set hitembean.corrosionDuring = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SS 寒霜玉
		set hitembean.item_id = 'I01E'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.attackHuntType = "icewater"
		set hitembean.ice = 30
        set hitembean.water = 30
        set hitembean.corrosionVal = 10
        set hitembean.corrosionDuring = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SS 烈焰珠
		set hitembean.item_id = 'I01d'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.fire = 195
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SS 灵光爆
		set hitembean.item_id = 'I01H'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.light = 120
		set hitembean.resistance = 50
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
		set hitembean = hItemBean.create() // SS 闪电球
		set hitembean.item_id = 'I01B'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.thunder = 120
        set hitembean.lightningChainOdds = 50
        set hitembean.lightningChainQty = 3
        set hitembean.lightningChainVal = 7500
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
		set hitembean = hItemBean.create() // SS 影子球
		set hitembean.item_id = 'I01F'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.dark = 165
		call hitem.format(hitembean)
		call hitembean.destroy()
        // 合成
        call hitemMix.newFormula('I01G',1) // SS 恶魔的灵魂
		call hitemMix.addFlag('I01G','I01I',1) // D 无用的水晶球
        call hitemMix.addFlag('I01G','I00Y',1) // S 恶魔的紫色血浆
    endmethod

    //[商店]黑科技
    public static method registerItem6 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // SSS 刺虫之壳
		set hitembean.item_id = 'I01O'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.huntRebound = 200
        set hitembean.huntAmplitude = 20
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
		set hitembean = hItemBean.create() // SSS 蓄风的叶子
		set hitembean.item_id = 'I01P'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.wind = 200
		set hitembean.avoid = 30
		call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
		set hitembean = hItemBean.create() // SSS 雷神之锤
		set hitembean.item_id = 'I01N'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.attackHuntType = "thunder"
		set hitembean.thunder = 180
		set hitembean.attackSpeed = 75
        call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
		set hitembean = hItemBean.create() // SSS 生命宝珠
		set hitembean.item_id = 'I01W'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.life = 10000
        call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SSS 否决神杖
		set hitembean.item_id = 'I01X'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		set hitembean.unarmOdds = 12.5
		set hitembean.unarmDuring = 2.5
        call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SSS 天神法杖
		set hitembean.item_id = 'I022'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
        set hitembean.silentOdds = 16.0
		set hitembean.unarmOdds = 16.0
        set hitembean.silentDuring = 3.5
		set hitembean.unarmDuring = 3.5
        call hitem.format(hitembean)
		call hitembean.destroy()
        // --------------------------------------
        set hitembean = hItemBean.create() // SSS 光辉刀锋
		set hitembean.item_id = 'I02E'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.attackPhysical = 5000
		set hitembean.attackMagic = 5000
        call hitem.format(hitembean)
		call hitembean.destroy()
    endmethod

    public static method onBossSkillHappen takes nothing returns nothing
		local unit triggerUnit = hevent.getTriggerUnit()
		local integer skillid = hevent.getTriggerSkill()
		local location loc = null
		local location loc2 = null
		local hAttrHuntBean bean = 0
		local group g = null
		local unit u = null
		local integer i = 0
		local hFilter hf
		if(skillid == 'A05R')then // BOSS 飞天石像鬼 穿梭
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = g_wave * 15
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Abilities\\Spells\\Undead\\Sleep\\SleepSpecialArt.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physicalwind"
            call hskill.shuttleToUnit(triggerUnit,hevent.getTargetUnit(),400,10,30,5,50,null,"attack",'A06L',bean)
            call bean.destroy()
		elseif(skillid == 'A062')then // BOSS 白毛猛犸王
            set hxy.x = GetUnitX(triggerUnit)
            set hxy.y = GetUnitY(triggerUnit)
            set hxy = hlogic.polarProjection(hxy,500,hlogic.getDegBetweenUnit(triggerUnit,hevent.getTargetUnit()))
            set loc = Location(hxy.x,hxy.y)
			set bean = hAttrHuntBean.create()
            set bean.damage = g_wave * 20
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_DarkSwirl.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physical"
            call hskill.leap(triggerUnit,loc,55,"Objects\\Spawnmodels\\Undead\\ImpaleTargetDust\\ImpaleTargetDust.mdl",150,false,bean)
            call bean.destroy()
		elseif(skillid == 'A060')then // BOSS 旋风女皇 穿梭
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = g_wave * 15
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Abilities\\Spells\\Other\\Tornado\\TornadoElementalSmall.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physicalwind"
            call hskill.shuttleToUnit(triggerUnit,hevent.getTargetUnit(),500,13,30,5,50,null,"attack",'A06M',bean)
            call bean.destroy()
		elseif(skillid == 'A061')then // BOSS 赐死鹿 穿梭
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = g_wave * 14
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\eff_DarkSwirl.mdl"
            set bean.huntKind = "skill"
            set bean.huntType = "realdark"
            call hskill.shuttleToUnit(triggerUnit,hevent.getTargetUnit(),500,16,30,5,350,null,"attack",'A087',bean)
            call bean.destroy()
		endif
        set triggerUnit = null
		set loc = null
		set loc2 = null
		set g = null
		set u = null
	endmethod
    public static method onBossAttack takes nothing returns nothing
		local unit triggerUnit = hevent.getTriggerUnit()
		local unit targetUnit = hevent.getTargetUnit()
        local integer uid = GetUnitTypeId(triggerUnit)
        local integer rand = GetRandomInt(1,10)
		local location loc = null
        if(triggerUnit == null or targetUnit == null)then
            set triggerUnit = null
            set targetUnit = null
            set loc = null
            return
        endif
        // BOSS开始发狂！
        if(hgroup.isIn(triggerUnit,g_crazy_boss) == true and hunit.getLifePercent(triggerUnit) < 40.0)then
            call GroupRemoveUnit(g_crazy_boss,triggerUnit)
            call heffect.toUnit("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl",triggerUnit,"origin",9)
            call heffect.toUnit("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl",triggerUnit,"head",9)
            call heffect.toUnit("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl",triggerUnit,"lefthand",9)
            call heffect.toUnit("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl",triggerUnit,"righthand",9)
            call heffect.toUnit("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl",triggerUnit,"weapon",9)
            call hmsg.style(hmsg.ttg2Unit(triggerUnit,"BOSS开始发狂！",8,"e04240",0,1.70,40.00),"scale",0,0.15)
            call hattr.addLifeBack(triggerUnit,I2R(g_wave) * 0.011 * hattr.getLife(triggerUnit),9)
            call hattr.addAttackPhysical(triggerUnit,I2R(g_wave) * 5,20)
            call hattr.addAttackMagic(triggerUnit,I2R(g_wave) * 5,20)
            call hattr.addAttackSpeed(triggerUnit,100,0)
            call hattr.addMove(triggerUnit,150,0)
            call hattr.addToughness(triggerUnit,I2R(g_wave) * 6,30)
        endif
        if(rand < 7)then
            if(uid == 'n048')then // BOSS 飞天石像鬼
                call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
            elseif(uid == 'n049')then // BOSS 食人魔统领
                call IssueImmediateOrder( triggerUnit, "stomp" )
            elseif(uid == 'n05R')then // BOSS 剧毒龙虾
                call IssueTargetOrder( triggerUnit, "shadowstrike", targetUnit )
            endif
            if(uid == 'n04B')then // BOSS Panda
                call IssueImmediateOrder( triggerUnit, "stomp" )
            elseif(uid == 'n04C')then // BOSS 沙蝎之王
                call IssueTargetOrder( triggerUnit, "impale", targetUnit )
            elseif(uid == 'n04K')then // BOSS 寒冰巨龙
                call IssuePointOrder( triggerUnit, "blizzard", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n04O')then // BOSS 人马可汗
                call IssueImmediateOrder( triggerUnit, "stomp" )
            elseif(uid == 'n04L')then // BOSS 疾风隐刺
                call hattrNatural.addDark(triggerUnit,2.0,10.0)
            elseif(uid == 'n04Q')then // BOSS 猎足之蛛
                if(GetRandomInt(1,10) < 5)then
                    call IssueImmediateOrder( triggerUnit, "mirrorimage" )
                else
                    call IssueTargetOrder( triggerUnit, "magicleash", targetUnit )
                endif
            elseif(uid == 'n04M')then // BOSS 白毛猛犸王
                if(GetRandomInt(1,10) < 5)then
                    call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
                else
                    call IssueImmediateOrder( triggerUnit, "roar" )
                endif
            elseif(uid == 'n04J')then // BOSS 奇美拉
                call IssuePointOrder( triggerUnit, "clusterrockets", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n04D')then // BOSS 龙卵领主
                call IssueTargetOrder( triggerUnit, "forkedlightning", targetUnit )
            elseif(uid == 'n04I')then // BOSS 旋风女皇
                call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
            endif
            if(uid == 'n04E')then // BOSS 毁灭炎尊
                call IssuePointOrder( triggerUnit, "rainoffire", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n04H')then // BOSS 赐死鹿
                call hattrEffect.addBombVal(triggerUnit,135,20)
                if(GetRandomInt(1,10) < 5)then
                    call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
                else
                    call IssueImmediateOrder( triggerUnit, "stomp" )
                endif
            elseif(uid == 'n052')then // BOSS 机车人
                call IssueImmediateOrder( triggerUnit, "whirlwind" )
            elseif(uid == 'n05B')then // BOSS 钻石巨人
               call IssuePointOrder( triggerUnit, "clusterrockets", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n05H')then // BOSS 寒春龙神
               call IssuePointOrder( triggerUnit, "stampede", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            endif
        endif
        set triggerUnit = null
        set targetUnit = null
        set loc = null
	endmethod

    public static method onBossBeAttack takes nothing returns nothing
        local unit triggerUnit = hevent.getTriggerUnit()
		local unit attacker = hevent.getAttacker()
        local integer uid = GetUnitTypeId(triggerUnit)
        local integer i = 0
        local hAttrHuntBean bean
        local hFilter filter
        local group g = null
        local unit u = null
        // BOSS开始发狂！
        if(hgroup.isIn(triggerUnit,g_crazy_be_boss) == true and hunit.getLifePercent(triggerUnit) < 40.0)then
            call GroupRemoveUnit(g_crazy_be_boss,triggerUnit)
            call heffect.toUnit("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl",triggerUnit,"origin",9)
            call heffect.toUnit("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl",triggerUnit,"head",9)
            call heffect.toUnit("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl",triggerUnit,"lefthand",9)
            call heffect.toUnit("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl",triggerUnit,"righthand",9)
            call heffect.toUnit("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl",triggerUnit,"weapon",9)
            call hmsg.style(hmsg.ttg2Unit(triggerUnit,"BOSS开始发狂！",8,"e04240",0,1.70,40.00),"scale",0,0.15)
            call hattr.addLifeBack(triggerUnit,I2R(g_wave) * 0.007 * hattr.getLife(triggerUnit),9)
            call hattr.addMove(triggerUnit,150,9)
            call hattr.addAvoid(triggerUnit,10,9)
        endif
        if(his.silent(triggerUnit) == false and GetRandomInt(1,10) < 3)then
            if(uid == 'n046')then // 巨龙海龟
                call hattr.addDefend(triggerUnit,g_wave*0.1,5)
            elseif(uid == 'n047')then // BOSS 岩石龙虾
                call hattr.addDefend(triggerUnit,g_wave*0.1,5)
            elseif(uid == 'n04A')then // BOSS 冰电魔法师
                call hattr.subAttackSpeed(attacker,25,3)
                call heffect.toUnit("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl",attacker,"origin",1.00)
            elseif(uid == 'n04N')then // BOSS 灭却龙
                call hattr.subLife(attacker,g_wave * 5,3)
                call heffect.toUnit("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl",attacker,"origin",3.00)
            elseif(uid == 'n063')then // BOSS 镰刀破灭
                call heffect.toUnit("war3mapImported\\eff_DustWindCirclefaster.mdl",triggerUnit,"origin",1.50)
                call heffect.toUnit("war3mapImported\\eff_round_dance2.mdl",triggerUnit,"origin",1.50)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                set g = hgroup.createByUnit(triggerUnit,500.0,function hFilter.get )
                call filter.destroy()
                set bean = hAttrHuntBean.create()
                set bean.damage = 60+g_wave
                set bean.fromUnit = triggerUnit
                set bean.huntEff = "Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl"
                set bean.huntKind = "skill"
                set bean.huntType = "physical"
                set i = 0
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true or i > 6)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        set bean.toUnit = u
                        call hattrHunt.huntUnit(bean)
                        set u = null
                        set i = i+1
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            elseif(uid == 'n064')then // BOSS 冰晶凌妖
                call hattr.subAttackSpeed(attacker,13,3)
                call heffect.toUnit("Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl",attacker,"origin",3.00)
            elseif(uid == 'n065')then // BOSS 歌之海妖
                call hattr.subAttackPhysical(attacker,75,3)
            endif
        endif
        set triggerUnit = null
        set attacker = null
    endmethod

    public static method bossBuilt takes unit mon returns nothing
        local integer uid = GetUnitTypeId(mon)
        call GroupAddUnit(g_crazy_boss,mon)
        call GroupAddUnit(g_crazy_be_boss,mon)
        if(uid == 'n046')then // 巨龙海龟
            call hattrNatural.addWaterOppose(mon,40.0,0)
            call hattr.addHuntRebound(mon,15.0,0)
            call hattr.addDefend(mon,10,0)
        elseif(uid == 'n047')then // 岩石龙虾
            call hattrNatural.addWaterOppose(mon,50.0,0)
        elseif(uid == 'n05R')then // 剧毒龙虾
            call hattrNatural.addPoisonOppose(mon,100.0,0)
            call hattrEffect.addToxicVal(mon,g_wave*5.0,0)
            call hattrEffect.addToxicDuring(mon,5.0,0)
        elseif(uid == 'n048')then // 飞天食尸鬼
            call hattr.addHemophagia(mon,15.0,0)
            call heffect.toUnit("war3mapImported\\eff_DarkSwirl.mdl",mon,"origin",0.60)
        elseif(uid == 'n049')then // 食人魔统领
            call hattr.addSplit(mon,15.0,0)
            call hattr.addDefend(mon,15,0)
        elseif(uid == 'n04A')then // 冰电魔法师
            call hattr.addAttackHuntType(mon,"icethunder",0)
            call hattrNatural.addIceOppose(mon,50.0,0)
            call hattrNatural.addThunderOppose(mon,25.0,0)
            call hattrEffect.addLightningChainOdds(mon,50.0,0)
            call hattrEffect.addLightningChainVal(mon,g_wave*65,0)
            call hattrEffect.addLightningChainQty(mon,3,0)
            call hattrEffect.addFreezeVal(mon,3.0,0)
            call hattrEffect.addFreezeDuring(mon,8.0,0)
            call hattrEffect.addSilentOdds(mon,15.0,0)
            call hattrEffect.addSilentDuring(mon,3.0,0)
        elseif(uid == 'n04B')then // 熊猫Panda
            call hattrEffect.addAttackPhysicalVal(mon,g_wave*5.0,0)
            call hattrEffect.addAttackPhysicalDuring(mon,10.0,0)
            call hattrEffect.addAttackSpeedVal(mon,g_wave*0.5,0)
            call hattrEffect.addAttackSpeedDuring(mon,10.0,0)
            call hattrEffect.addKnockingVal(mon,g_wave*50,0)
            call hattrEffect.addKnockingDuring(mon,7.0,0)
        elseif(uid == 'n04C')then // 沙蝎之王
            call hattr.addAttackHuntType(mon,"soil",0)
            call hattrNatural.addSoilOppose(mon,40.0,0)
            call hattrNatural.addPoisonOppose(mon,40.0,0)
            call hattrNatural.subFireOppose(mon,20.0,0)
            call hattrEffect.addToxicVal(mon,5.0,0)
            call hattrEffect.addToxicDuring(mon,10.0,0)
            call hattrEffect.addCorrosionVal(mon,3.0,0)
            call hattrEffect.addCorrosionDuring(mon,10.0,0)
            call hattrEffect.addFreezeVal(mon,5.0,0)
            call hattrEffect.addFreezeDuring(mon,10.0,0)
        elseif(uid == 'n04K')then // 寒冰巨龙
            call hattr.addAttackHuntType(mon,"water",0)
            call hattr.addAttackHuntType(mon,"ice",0)
            call hattrNatural.addIceOppose(mon,80.0,0)
            call hattrEffect.addFreezeVal(mon,7.5,0)
            call hattrEffect.addFreezeDuring(mon,11.0,0)
            call hattrEffect.addUnarmOdds(mon,16.0,0)
            call hattrEffect.addUnarmDuring(mon,3.0,0)
        elseif(uid == 'n04O')then // 人马可汗
            call hattr.addLifeBack(mon,100,0)
            call hattr.addToughness(mon,200.0,0)
        elseif(uid == 'n04L')then // 疾风隐刺
            call hattr.addAttackHuntType(mon,"dark",0)
            call hattrNatural.addDarkOppose(mon,50.0,0)
            call hattrEffect.addAttackSpeedVal(mon,10.0,0)
            call hattrEffect.addAttackSpeedDuring(mon,6.0,0)
            call hattrEffect.addKnockingVal(mon,2000.0,0)
            call hattrEffect.addKnockingDuring(mon,10.0,0)
            call hattrEffect.addViolenceVal(mon,500.0,0)
            call hattrEffect.addViolenceDuring(mon,10.0,0)
        elseif(uid == 'n04P')then // 潮汐巨人
            call hattr.addAttackHuntType(mon,"water",0)
            call hattrNatural.addWaterOppose(mon,70.0,0)
            call hattrEffect.addSwimOdds(mon,25.0,0)
            call hattrEffect.addSwimDuring(mon,1,0)
            call hattrEffect.addCrackFlyOdds(mon,5.0,0)
        elseif(uid == 'n04N')then // 灭却龙
            call hattr.addAttackHuntType(mon,"poison",0)
            call hattrNatural.addPoison(mon,25.0,0)
            call hattrNatural.addPoisonOppose(mon,60.0,0)
            call hattrEffect.addToxicVal(mon,25.0,0)
            call hattrEffect.addToxicDuring(mon,5.0,0)
            call hattrEffect.addCorrosionVal(mon,3.0,0)
            call hattrEffect.addCorrosionDuring(mon,10.0,0)
        elseif(uid == 'n04Q')then // 猎足蜘蛛
            call hattr.addAttackHuntType(mon,"poison",0)
            call hattrNatural.addPoisonOppose(mon,30.0,0)
            call hattrNatural.subFireOppose(mon,10.0,0)
        elseif(uid == 'n04M')then // 白毛猛犸王
            call hattr.addSplit(mon,17.0,0)
            call hattrEffect.addCrackFlyOdds(mon,7.0,0)
        elseif(uid == 'n04J')then // 奇美拉
            call hattr.addAttackHuntType(mon,"poison",0)
            call hattrNatural.addPoison(mon,25.0,0)
            call hattrNatural.addPoisonOppose(mon,78.0,0)
            call hattrEffect.addToxicVal(mon,35.0,0)
            call hattrEffect.addToxicDuring(mon,6.0,0)
        elseif(uid == 'n04D')then // 龙卵领主
            call hattr.addAttackHuntType(mon,"thunderwater",0)
            call hattrNatural.addThunderOppose(mon,35.0,0)
            call hattr.addAttackPhysical(mon,200.0,0)
            call hattr.addAttackMagic(mon,200.0,0)
            call hattr.addKnocking(mon,10000.0,0)
            call hattrEffect.addLightningChainOdds(mon,45.0,0)
            call hattrEffect.addLightningChainVal(mon,g_wave*55.0,0)
            call hattrEffect.addLightningChainQty(mon,3,0)
        elseif(uid == 'n04I')then // 旋风女皇
            call hattr.addAttackHuntType(mon,"wind",0)
            call hattrNatural.addWindOppose(mon,80.0,0)
            call hattr.addAttackSpeed(mon,100.0,0)
            call hattrEffect.addSwimOdds(mon,22.0,0)
            call hattrEffect.addSwimDuring(mon,0.5,0)
        elseif(uid == 'n04F')then // 斧帝
            call hattr.addHuntRebound(mon,25.0,0)
        elseif(uid == 'n04G')then // 深渊地狱火
            call hattr.addAttackHuntType(mon,"fire",0)
            call hattrNatural.addFireOppose(mon,80.0,0)
            call hattrEffect.addBurnVal(mon,6+g_wave,0)
            call hattrEffect.addBurnDuring(mon,10.0,0)
        endif
        if(uid == 'n04E')then // 毁灭炎尊
            call hattr.addAttackHuntType(mon,"firemetal",0)
            call hattrNatural.addPoisonOppose(mon,80.0,0)
            call hattrNatural.addFireOppose(mon,80.0,0)
            call hattrEffect.addBurnVal(mon,7+g_wave,0)
            call hattrEffect.addBurnDuring(mon,10.0,0)
        elseif(uid == 'n04H')then // 赐死鹿
            call hattr.addAttackHuntType(mon,"dark",0)
            call hattrNatural.addDarkOppose(mon,30.0,0)
            call hattrNatural.addPoisonOppose(mon,90.0,0)
            call hattrNatural.addFireOppose(mon,30.0,0)
            call hattrEffect.addCorrosionVal(mon,4.0,0)
            call hattrEffect.addCorrosionDuring(mon,10.0,0)
            call hattrEffect.addToxicVal(mon,6.0,0)
            call hattrEffect.addToxicDuring(mon,7.5,0)
            call hattrEffect.addSilentOdds(mon,5.0,0)
            call hattrEffect.addSilentDuring(mon,3.0,0)
            call hattrEffect.addUnarmOdds(mon,10.0,0)
            call hattrEffect.addUnarmDuring(mon,3.0,0)
            call hattrEffect.setBombOdds(mon,10,0)
            call hattrEffect.setBombVal(mon,g_wave*3,0)
            call hattrEffect.setBombRange(mon,125,0)
            call hattrEffect.setBombModel(mon,"war3mapImported\\eff_Arcane_Nova.mdl")
        elseif(uid == 'n052')then // 机车人
            call hattr.addAttackHuntType(mon,"metal",0)
            call hattrNatural.addMetalOppose(mon,80.0,0)
            call hattrEffect.addAttackSpeedVal(mon,5,0)
            call hattrEffect.addAttackSpeedDuring(mon,10,0)
            call hattrEffect.addSwimOdds(mon,25.0,0)
            call hattrEffect.addSwimDuring(mon,0.5,0)
        elseif(uid == 'n05B')then // 钻石巨人
            call hattr.addHuntRebound(mon,20.0,0)
            call hattr.addAttackHuntType(mon,"soilmetal",0)
            call hattrNatural.addFireOppose(mon,70.0,0)
            call hattrNatural.addSoilOppose(mon,70.0,0)
            call hattrNatural.addMetalOppose(mon,75.0,0)
            call hattrEffect.addSwimOdds(mon,16.0,0)
            call hattrEffect.addSwimDuring(mon,1.5,0)
        elseif(uid == 'n05H')then // 寒春龙神
            call hattr.addAttackHuntType(mon,"icedragon",0)
            call hattrNatural.addIceOppose(mon,50.0,0)
            call hattrNatural.addDragonOppose(mon,75.0,0)
            call hattrEffect.addAttackSpeedVal(mon,10,0)
            call hattrEffect.addAttackSpeedDuring(mon,5,0)
            call hattrEffect.addSwimOdds(mon,14.0,0)
            call hattrEffect.addSwimDuring(mon,2.0,0)
        endif
        if(uid == 'n062')then // BOSS 死神
            call hattr.addAttackHuntType(mon,"ghost",0)
            call hattr.addAvoid(mon,10,0)
        elseif(uid == 'n063')then // BOSS 镰刀破灭神
            call hattr.addAttackHuntType(mon,"real",0)
            call hattr.addResistance(mon,100,0)
        elseif(uid == 'n064')then // BOSS 冰晶凌妖
            call hattr.addAttackHuntType(mon,"ice",0)
            call hattrNatural.addIceOppose(mon,100.0,0)
        elseif(uid == 'n064')then // BOSS 歌之海妖
            call hattr.addAttackHuntType(mon,"water",0)
            call hattr.addUnarmOppose(mon,50,0)
        endif
        call hevent.onSkillHappen(mon,function thistype.onBossSkillHappen)
        call hevent.onAttack(mon,function thistype.onBossAttack)
        call hevent.onBeAttack(mon,function thistype.onBossBeAttack)
    endmethod
    public static method bossDeadDrop takes unit mon returns nothing
        local integer total = 0
        local integer array itempools
        if(g_wave <=6)then
            set total = 7
            set itempools[1] = 'I00D'
            set itempools[2] = 'I00E'
            set itempools[3] = 'I018'
            set itempools[4] = 'I00I'
            set itempools[5] = 'I00G'
            set itempools[6] = 'I002'
            set itempools[7] = 'I00K'
        elseif(g_wave <=15)then
            set total = 9
            set itempools[1] = 'I00D'
            set itempools[2] = 'I00K'
            set itempools[3] = 'I00C'
            set itempools[4] = 'I00F'
            set itempools[5] = 'I012'
            set itempools[6] = 'I000'
            set itempools[7] = 'I00X'
            set itempools[8] = 'I01K'
            set itempools[9] = 'I00C'
        elseif(g_wave <=24)then
            set total = 7
            set itempools[1] = 'I01K'
            set itempools[2] = 'I013'
            set itempools[3] = 'I017'
            set itempools[4] = 'I014'
            set itempools[5] = 'I01J'
            set itempools[6] = 'I016'
            set itempools[7] = 'I00L'
        elseif(g_wave <=39)then
            set total = 12
            set itempools[1] = 'I00L'
            set itempools[2] = 'I01J'
            set itempools[3] = 'I010'
            set itempools[4] = 'I029'
            set itempools[5] = 'I019'
            set itempools[6] = 'I00J'
            set itempools[7] = 'I00Z'
            set itempools[8] = 'I02B'
            set itempools[9] = 'I00W'
            set itempools[10] = 'I015'
            set itempools[11] = 'I02A'
            set itempools[12] = 'I02J'
        else
            set total = 20
            set itempools[1] = 'I02A'
            set itempools[2] = 'I01J'
            set itempools[3] = 'I010'
            set itempools[4] = 'I029'
            set itempools[5] = 'I019'
            set itempools[6] = 'I00J'
            set itempools[7] = 'I00Z'
            set itempools[8] = 'I02B'
            set itempools[9] = 'I00W'
            set itempools[10] = 'I015'
            set itempools[11] = 'I02J'
            set itempools[12] = 'I011'
            set itempools[13] = 'I02C'
            set itempools[14] = 'I02D'
            set itempools[15] = 'I00B'
            set itempools[16] = 'I01A'
            set itempools[17] = 'I01M'
            set itempools[18] = 'I01L'
            set itempools[19] = 'I028'
            set itempools[20] = 'I01R'
        endif
        call hitem.toXY(itempools[GetRandomInt(1,total)],1,GetUnitX(mon),GetUnitY(mon),120.0)
        call hitem.toXY(itempools[GetRandomInt(1,total)],1,GetUnitX(mon),GetUnitY(mon),120.0)
    endmethod



    private static method gotoRectSpaceDeg takes unit u,integer lv, real x,real y, real x2,real y2 returns nothing
        local integer i = 0
        local location loc = null
        if(IsUnitAlly(u, Player(10)) != true or IsUnitInGroup(u, g_gp_attack) == true)then
            set u = null
            return
        endif
        set i = GetUnitUserData(u) + 1
        if(i >= 5)then
            call SetUnitUserData(u,0)
            if(lv == 4)then
                call IssuePointOrder( u, "attack", GetLocationX(Loc_Ring), GetLocationY(Loc_Ring) )
                call GroupAddUnit(g_gp_attack,u)
                set loc = GetUnitLoc(u)
                call PingMinimapLocForForceEx( playerForce,loc,1, bj_MINIMAPPINGSTYLE_FLASHY, 100, 0, 0 )
                call RemoveLocation(loc)
                set loc = null
            else
                call SetUnitPosition(u, x2, y2)
            endif    
        else
            call SetUnitUserData(u,i)
            call IssuePointOrder( u, "move", x, y )
        endif
        set u = null
    endmethod
    private static method gotoRectSpaceDeg11 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),1,spaceDegX[2],spaceDegY[2],spaceDeg2X[1],spaceDeg2Y[1])
	endmethod
    private static method gotoRectSpaceDeg12 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),1,spaceDegX[3],spaceDegY[3],spaceDeg2X[2],spaceDeg2Y[2])
	endmethod
    private static method gotoRectSpaceDeg13 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),1,spaceDegX[4],spaceDegY[4],spaceDeg2X[3],spaceDeg2Y[3])
	endmethod
    private static method gotoRectSpaceDeg14 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),1,spaceDegX[1],spaceDegY[1],spaceDeg2X[4],spaceDeg2Y[4])
	endmethod
    private static method gotoRectSpaceDeg21 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),2,spaceDeg2X[4],spaceDeg2Y[4],spaceDeg3X[1],spaceDeg3Y[1])
	endmethod
    private static method gotoRectSpaceDeg22 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),2,spaceDeg2X[1],spaceDeg2Y[1],spaceDeg3X[2],spaceDeg3Y[2])
	endmethod
    private static method gotoRectSpaceDeg23 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),2,spaceDeg2X[2],spaceDeg2Y[2],spaceDeg3X[3],spaceDeg3Y[3])
	endmethod
    private static method gotoRectSpaceDeg24 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),2,spaceDeg2X[3],spaceDeg2Y[3],spaceDeg3X[4],spaceDeg3Y[4])
	endmethod
    private static method gotoRectSpaceDeg31 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),3,spaceDeg3X[2],spaceDeg3Y[2],spaceDeg4X[1],spaceDeg4Y[1])
	endmethod
    private static method gotoRectSpaceDeg32 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),3,spaceDeg3X[3],spaceDeg3Y[3],spaceDeg4X[2],spaceDeg4Y[2])
	endmethod
    private static method gotoRectSpaceDeg33 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),3,spaceDeg3X[4],spaceDeg3Y[4],spaceDeg4X[3],spaceDeg4Y[3])
	endmethod
    private static method gotoRectSpaceDeg34 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),3,spaceDeg3X[1],spaceDeg3Y[1],spaceDeg4X[4],spaceDeg4Y[4])
	endmethod
    private static method gotoRectSpaceDeg41 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),4,spaceDeg4X[4],spaceDeg4Y[4],0,0)
	endmethod
    private static method gotoRectSpaceDeg42 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),4,spaceDeg4X[1],spaceDeg4Y[1],0,0)
	endmethod
    private static method gotoRectSpaceDeg43 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),4,spaceDeg4X[2],spaceDeg4Y[2],0,0)
	endmethod
    private static method gotoRectSpaceDeg44 takes nothing returns nothing
        call thistype.gotoRectSpaceDeg(GetTriggerUnit(),4,spaceDeg4X[3],spaceDeg4Y[3],0,0)
	endmethod

    public static method do takes nothing returns nothing
        local integer i = 0
        local trigger tg = null

        set g_diff_label[1] = "|cff00ff00简单|r"
        set g_diff_label[2] = "|cffffff80普通|r"
        set g_diff_label[3] = "|cffff6600困难|r"
        set g_diff_label[4] = "|cffff0000地狱|r"

        // 设置玩家组
        set i = 1
        loop
            exitwhen i > player_max_qty
            call ForceAddPlayer(playerForce, players[i])
            set i = i + 1
        endloop
        set player_ally =  players[12]
        
        set rectHanabi = hrect.createInLoc(GetLocationX(Loc_Ring),GetLocationY(Loc_Ring),spaceDistance,spaceDistance)
        set rectBattle = hrect.createInLoc(GetLocationX(Loc_Ring),GetLocationY(Loc_Ring),spaceDistance,spaceDistance)
        set rectBattleInner = hrect.createInLoc(GetLocationX(Loc_Ring),GetLocationY(Loc_Ring),spaceInnerDistance,spaceInnerDistance)

        // hero 英雄
        call thistype.registerHero('H00M',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNHeroArchMage.blp",2.00) // t01 大魔法师
        call thistype.registerHero('H00K',HERO_TYPE_INT,"war3mapImported\\BTNHeroVoljin.blp",2.00) // t01 盗影猎手
        call thistype.registerHero('H001',HERO_TYPE_AGI,"war3mapImported\\HIcon_08.blp",2.00) // t01 斩破
        call thistype.registerHero('H003',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNHeroFarseer.blp",2.00) // t01 先知
        call thistype.registerHero('H004',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp",2.00) // t01 死骑
        call thistype.registerHero('H005',HERO_TYPE_AGI,"ReplaceableTextures\\CommandButtons\\BTNHeroDreadLord.blp",2.00) // t01 蝠王
        call thistype.registerHero('H007',HERO_TYPE_AGI,"ReplaceableTextures\\CommandButtons\\BTNHeroCryptLord.blp",2.00) // t01 地穴领主
        call thistype.registerHero('H008',HERO_TYPE_AGI,"ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp",2.00) // t01 机械师
        call thistype.registerHero('H00A',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNBeastMaster.blp",2.00) // t01 兽王
        call thistype.registerHero('H00I',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNChaosBlademaster.blp",2.00) // t02 赤血
        call thistype.registerHero('H00N',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp",2.00) // t02 圣骑士
        call thistype.registerHero('H00O',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNArthas.blp",2.00) // t03 魔剑士
        call thistype.registerHero('H00C',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNHeroAvatarOfFlame.blp",2.00) // t03 火焰巨魔
        call thistype.registerHero('H00P',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNKeeperOfTheGrove.blp",2.00) // t04 森林老鹿
        call thistype.registerHero('H00Q',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp",2.00) // t05 巫妖
        call thistype.registerHero('H00X',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp",2.00) // t06 操火师
        call thistype.registerHero('H009',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNNagaSeaWitch.blp",2.00) // t07 美杜莎
        call thistype.registerHero('H00D',HERO_TYPE_AGI,"war3mapImported\\BTNArcaneHuntress.blp",2.00) // t08 影刺客
        call thistype.registerHero('H00S',HERO_TYPE_AGI,"war3mapImported\\HIcon_03.blp",2.00) // t10 深渊游侠
        call thistype.registerHero('H00R',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNHeroAlchemist.blp",2.00) // t20 炼金

        call htime.setTimeout(0.65,function thistype.registerItem0)
        call htime.setTimeout(0.70,function thistype.registerItem1)
        call htime.setTimeout(0.75,function thistype.registerItem2)
        call htime.setTimeout(0.80,function thistype.registerItem3)
        call htime.setTimeout(0.85,function thistype.registerItem4)
        call htime.setTimeout(0.90,function thistype.registerItem5)
        call htime.setTimeout(0.95,function thistype.registerItem6)

        call thistype.registerToken()
        call thistype.registerBuilding()
        call thistype.registerGift()

        set g_boss_count = 29
        set g_boss[1]  = 'n046'
        set g_boss[2]  = 'n047'
        set g_boss[3]  = 'n048'
        set g_boss[4]  = 'n049'
        set g_boss[5]  = 'n04A'
        set g_boss[6]  = 'n04B'
        set g_boss[7]  = 'n04C'
        set g_boss[8]  = 'n04K'
        set g_boss[9]  = 'n04O'
        set g_boss[10] = 'n04L'
        set g_boss[11] = 'n04P'
        set g_boss[12] = 'n04N'
        set g_boss[13] = 'n04Q'
        set g_boss[14] = 'n04M'
        set g_boss[15] = 'n04J'
        set g_boss[16] = 'n04D'
        set g_boss[17] = 'n04I'
        set g_boss[18] = 'n04F'
        set g_boss[19] = 'n04G'
        set g_boss[20] = 'n04E'
        set g_boss[21] = 'n04H'
        set g_boss[22] = 'n052'
        set g_boss[23] = 'n05B'
        set g_boss[24] = 'n05H'
        set g_boss[25] = 'n05R'
        set g_boss[26] = 'n062'
        set g_boss[27] = 'n063'
        set g_boss[28] = 'n064'
        set g_boss[29] = 'n065'

        set g_mon_count = 120
        set g_mon[1] = 'n011'
        set g_mon[2] = 'n013'
        set g_mon[3] = 'n014'
        set g_mon[4] = 'n015'
        set g_mon[5] = 'n016'
        set g_mon[6] = 'n017'
        set g_mon[7] = 'n01E'
        set g_mon[8] = 'n01F'
        set g_mon[9] = 'n01Y'
        set g_mon[10] = 'n01G'
        set g_mon[11] = 'n01H'
        set g_mon[12] = 'n01I'
        set g_mon[13] = 'n01J'
        set g_mon[14] = 'n01K'
        set g_mon[15] = 'n01L'
        set g_mon[16] = 'n01M'
        set g_mon[17] = 'n01N'
        set g_mon[18] = 'n01O'
        set g_mon[19] = 'n01P'
        set g_mon[20] = 'n01Q'
        set g_mon[21] = 'n01R'
        set g_mon[22] = 'n01S'
        set g_mon[23] = 'n01T'
        set g_mon[24] = 'n01U'
        set g_mon[25] = 'n01V'
        set g_mon[26] = 'n01W'
        set g_mon[27] = 'n01X'
        set g_mon[28] = 'n03X'
        set g_mon[29] = 'n03W'
        set g_mon[30] = 'n03V'
        set g_mon[31] = 'n03U'
        set g_mon[32] = 'n03T'
        set g_mon[33] = 'n03Y'
        set g_mon[34] = 'n03S'
        set g_mon[35] = 'n01Z'
        set g_mon[36] = 'n020'
        set g_mon[37] = 'n021'
        set g_mon[38] = 'n022'
        set g_mon[39] = 'n023'
        set g_mon[40] = 'n024'
        set g_mon[41] = 'n025'
        set g_mon[42] = 'n026'
        set g_mon[43] = 'n027'
        set g_mon[44] = 'n028'
        set g_mon[45] = 'n029'
        set g_mon[46] = 'n02A'
        set g_mon[47] = 'n02B'
        set g_mon[48] = 'n02C'
        set g_mon[49] = 'n02D'
        set g_mon[50] = 'n02E'
        set g_mon[51] = 'n02F'
        set g_mon[52] = 'n02G'
        set g_mon[53] = 'n02H'
        set g_mon[54] = 'n02I'
        set g_mon[55] = 'n02J'
        set g_mon[56] = 'n02K'
        set g_mon[57] = 'n02L'
        set g_mon[58] = 'n02M'
        set g_mon[59] = 'n02N'
        set g_mon[60] = 'n02O'
        set g_mon[61] = 'n02P'
        set g_mon[62] = 'n02Q'
        set g_mon[63] = 'n02R'
        set g_mon[64] = 'n02S'
        set g_mon[65] = 'n02T'
        set g_mon[66] = 'n02U'
        set g_mon[67] = 'n02V'
        set g_mon[68] = 'n02W'
        set g_mon[69] = 'n02X'
        set g_mon[70] = 'n02Y'
        set g_mon[71] = 'n02Z'
        set g_mon[72] = 'n030'
        set g_mon[73] = 'n031'
        set g_mon[74] = 'n032'
        set g_mon[75] = 'n033'
        set g_mon[76] = 'n034'
        set g_mon[77] = 'n035'
        set g_mon[78] = 'n036'
        set g_mon[79] = 'n037'
        set g_mon[80] = 'n038'
        set g_mon[81] = 'n039'
        set g_mon[82] = 'n03A'
        set g_mon[83] = 'n03B'
        set g_mon[84] = 'n03C'
        set g_mon[85] = 'n03D'
        set g_mon[86] = 'n03E'
        set g_mon[87] = 'n03F'
        set g_mon[88] = 'n03G'
        set g_mon[89] = 'n03H'
        set g_mon[90] = 'n03I'
        set g_mon[91] = 'n03J'
        set g_mon[92] = 'n03K'
        set g_mon[93] = 'n03L'
        set g_mon[94] = 'n03M'
        set g_mon[95] = 'n03N'
        set g_mon[96] = 'n03O'
        set g_mon[97] = 'n03P'
        set g_mon[98] = 'n03Q'
        set g_mon[99] = 'n03R'
        set g_mon[100] = 'n03Z'
        set g_mon[101] = 'n044'
        set g_mon[102] = 'n041'
        set g_mon[103] = 'n042'
        set g_mon[104] = 'n043'
        set g_mon[105] = 'n045'
        set g_mon[106] = 'n053'
        set g_mon[107] = 'n054'
        set g_mon[108] = 'n055'
        set g_mon[109] = 'n056'
        set g_mon[110] = 'n051'
        set g_mon[111] = 'n05F'
        set g_mon[112] = 'n05G'
        set g_mon[113] = 'n05E'
        set g_mon[114] = 'n05D'
        set g_mon[115] = 'n05C'
        set g_mon[116] = 'n05J'
        set g_mon[117] = 'n05K'
        set g_mon[118] = 'n05L'
        set g_mon[119] = 'n05M'
        set g_mon[120] = 'n05I'

        // uid, gold, life, mana, manaback, defend, attackPhysical, attackMagic,attackSpeedBaseSpace
        
        call thistype.registerSummon('o009',false,"N",1500,1000,    100,10,20,     0,0,0.00) // 帐篷
        call thistype.registerSummon('o00A',true,"N",3000,4000,     100,10,30,     0,0,0.00) // 农场
        call thistype.registerSummon('o00M',true,"N",3000,3000,     100,10,30,     750,0,0.80) // 地穴
        call thistype.registerSummon('o01S',true,"N",3000,3000,     100,10,30,     0,0,0.00) // 月亮井

        call thistype.registerSummon('o00J',false,"D",500,260,      200,3,0,      20,20,1.95) // 小精灵
        call thistype.registerSummon('o00B',false,"D",500,220,      200,3,0,      45,0,1.80) // 农民
        call thistype.registerSummon('o00I',false,"D",500,280,      200,3,0,      50,0,2.30) // 苦力

        call thistype.registerSummon('o008',false,"C",1000,400,     400,4,1,    100,0,1.80) // 民兵
        call thistype.registerSummon('o00E',false,"C",1000,380,     400,4,0,    50,60,1.90) // 血精灵
        call thistype.registerSummon('o00R',false,"C",1000,500,     400,4,1,    130,0,2.30) // 兽人大兵
        call thistype.registerSummon('o00S',false,"C",1000,480,     400,4,1,    120,0,2.20) // 邪恶苦力
        call thistype.registerSummon('o00W',false,"C",1000,420,     400,4,0,    0,95,2.20) // 巨魔巫医
        call thistype.registerSummon('o016',false,"C",1000,440,     400,4,0,    20,90,2.20) // 萨满牛祭司
        call thistype.registerSummon('o01F',false,"C",1000,600,     400,4,0,    95,0,2.10) // 树人
        call thistype.registerSummon('o01V',false,"C",1000,360,     400,4,0,    100,0,1.90) // 暗夜弓手
        call thistype.registerSummon('o01W',false,"C",1000,360,     400,4,0,    110,0,1.90) // 角鹰弓手
        call thistype.registerSummon('o022',false,"C",1000,360,     400,4,0,    35,70,2.10) // 德鲁伊

        call thistype.registerSummon('o00C',false,"B",2000,1200,    600,6,3,    190,0,1.80) // 步兵
        call thistype.registerSummon('o00L',false,"B",2000,700,     600,6,2,    180,0,1.90) // 牧师
        call thistype.registerSummon('o00K',false,"B",2000,900,     600,6,2,    200,0,1.70) // 铁抢手
        call thistype.registerSummon('o00Z',false,"B",2000,1000,    600,6,1,    210,0,1.90) // 龙鹰骑士
        call thistype.registerSummon('o017',false,"B",2000,1200,    600,6,1,    240,0,2.20) // 灯提白牛
        call thistype.registerSummon('o00T',false,"B",2000,1200,    600,6,1,    230,0,2.10) // 狼骑
        call thistype.registerSummon('o00G',false,"B",2000,1100,    600,6,0,    225,0,2.40) // 巨魔枪士
        call thistype.registerSummon('o00V',false,"B",2000,1300,    600,6,2,    260,0,2.40) // 邪恶兽人大兵
        call thistype.registerSummon('o014',false,"B",2000,1000,    600,6,0,    210,0,1.90) // 飞龙骑士
        call thistype.registerSummon('o019',false,"B",2000,900,     600,6,0,    0,220,2.30) // 巫师
        call thistype.registerSummon('o020',false,"B",2000,700,     600,6,0,    70,100,2.00) // 精灵龙
        call thistype.registerSummon('o01Z',false,"B",2000,860,     600,6,1,    140,0,2.20) // 露娜
        call thistype.registerSummon('o01U',false,"B",2000,1200,    600,6,1,    225,0,2.10) // 树妖
        call thistype.registerSummon('o023',false,"B",2000,1400,    600,6,3,    250,0,1.90) // 熊战德鲁伊
        call thistype.registerSummon('o01G',false,"B",2000,1700,    600,6,4,    300,0,2.90) // 远古树精

        call thistype.registerSummon('o00D',false,"A",4000,2500,    800,8,7,   460,0,1.80) // 剑士
        call thistype.registerSummon('o00N',false,"A",4000,2400,    800,8,6,    490,0,2.20) // 骑士
        call thistype.registerSummon('o00X',false,"A",4000,2100,    800,8,4,    770,0,3.50) // 迫击炮小队
        call thistype.registerSummon('o00P',false,"A",4000,1700,    800,8,3,    0,490,1.80) // 女巫
        call thistype.registerSummon('o00O',false,"A",4000,1900,    800,8,3,    110,400,1.80) // 魔导师
        call thistype.registerSummon('o010',false,"A",4000,2200,    800,8,4,    500,30,1.80) // 狮鹫骑士
        call thistype.registerSummon('o027',false,"A",4000,1900,    800,8,2,    500,0,2.00) // 精灵射手
        call thistype.registerSummon('o015',false,"A",4000,1800,    800,8,2,    470,0,1.80) // 幻界飞龙
        call thistype.registerSummon('o00H',false,"A",4000,2050,    800,8,2,    490,0,1.90) // 巨魔蝙蝠骑手
        call thistype.registerSummon('o01C',false,"A",4000,2700,    800,8,4,    540,0,2.00) // 科多骑手
        call thistype.registerSummon('o01B',false,"A",4000,2200,    800,8,2,    35,465,2.00) // 骷骨巫长
        call thistype.registerSummon('o018',false,"A",4000,3000,    800,8,5,    580,0,2.40) // 图腾战牛
        call thistype.registerSummon('o00U',false,"A",4000,2300,    800,8,3,    555,0,1.80) // 邪恶狼骑
        call thistype.registerSummon('o01A',false,"A",4000,2100,    800,8,1,    0,600,2.00) // 邪恶巫师
        call thistype.registerSummon('o024',false,"A",4000,2500,    800,8,4,    625,0,2.10) // 猛熊德鲁伊
        call thistype.registerSummon('o021',false,"A",4000,1600,    800,8,2,    200,270,1.90) // 黑暗精灵
        call thistype.registerSummon('o01X',false,"A",4000,2900,    800,8,3,    680,0,2.50) // 山岭巨人
        call thistype.registerSummon('o01J',false,"A",4000,2700,    800,8,5,    680,0,2.80) // 战争古树
        call thistype.registerSummon('o01R',false,"A",4000,2700,    800,8,5,    300,380,2.80) // 秘迹古树
        call thistype.registerSummon('o01Q',false,"A",4000,2700,    800,8,5,    540,170,2.80) // 苍风古树
        call thistype.registerSummon('o01L',false,"A",4000,2700,    800,8,5,    0,570,2.80) // 智慧古树
        call thistype.registerSummon('o02B',false,"A",4000,2200,    800,8,4,    520,0,2.10) // 伐木机
        call thistype.registerSummon('o02C',false,"A",4000,2000,    800,8,3,    540,0,1.90) // 机关兵
        call thistype.registerSummon('o029',false,"A",4000,1700,    800,8,2,    100,450,2.10) // 骷髅魔法师
        call thistype.registerSummon('o02A',false,"A",4000,1800,    800,8,4,    530,0,2.00) // 娜迦海兵

        call thistype.registerSummon('o028',false,"S",8000,3800,    1000,10,7,    660,660,1.80) // 暗影猎手
        call thistype.registerSummon('o02F',false,"S",8000,3900,    1000,10,8,    1100,160,2.10) // 冰魔怪
        call thistype.registerSummon('o02N',false,"S",8000,3700,    1000,10,6,    700,660,1.90) // 黑暗游侠
        call thistype.registerSummon('o00Y',false,"S",8000,4000,    1000,10,7,    1160,0,1.80) // 飞行机器
        call thistype.registerSummon('o012',false,"S",8000,4500,    1000,10,10,    1700,0,3.50) // 坦克部队
        call thistype.registerSummon('o01D',false,"S",8000,4500,    1000,10,10,    1380,0,1.90) // 邪恶科多骑手
        call thistype.registerSummon('o01E',false,"S",8000,4100,    1000,10,9,   1300,0,1.80) // 牛头人酋长
        call thistype.registerSummon('o00Q',false,"S",8000,3500,    1000,10,8,    0,880,1.80) // 寒冰女巫
        call thistype.registerSummon('o013',false,"S",8000,4100,    1000,10,9,    630,570,1.60) // 火凤凰
        call thistype.registerSummon('o026',false,"S",8000,3700,    1000,10,7,   1150,0,1.50) // 月之女祭司
        call thistype.registerSummon('o01Y',false,"S",8000,4300,    1000,10,9,  1600,0,2.30) // 山岭巨人·战棍
        call thistype.registerSummon('o02V',false,"S",8000,3700,    1000,10,8,    0,1450,2.20) // 冰魔灵
        call thistype.registerSummon('o025',false,"S",8000,3800,    1000,10,7,    520,640,1.90) // 奇美拉

        call thistype.registerSummon('o02R',false,"SS",16000,8000,  1200,12,13,  3600,0,1.70) // 恶魔猎手
        call thistype.registerSummon('o02K',false,"SS",16000,8400,  1200,12,15,  3800,0,2.00) // 牛头人武士
        call thistype.registerSummon('o02P',false,"SS",16000,8200,  1200,12,14,  3500,0,2.00) // 山丘之王
        call thistype.registerSummon('o02S',false,"SS",16000,7600,  1200,12,12,  3700,0,1.80) // 守望者
        call thistype.registerSummon('o02D',false,"SS",16000,8500,  1200,12,13,  1200,2600,2.10) // 水魔灵
        call thistype.registerSummon('o02L',false,"SS",16000,8100,  1200,12,13,  3700,500,2.10) // 悟空
        call thistype.registerSummon('o02M',false,"SS",16000,7500,  1200,12,11,  1900,1500,1.90) // 小鹿
        call thistype.registerSummon('o02T',false,"SS",16000,8600,  1200,12,14,  3600,500,1.90) // 熊猫酒仙
        call thistype.registerSummon('o02Q',false,"SS",16000,7900,  1200,12,12,  3700,0,1.70) // 逸风

        call thistype.registerSummon('o02I',false,"SSS",32000,15000,  1500,15,15,  0,7600,1.80) // 画笔仙女
        call thistype.registerSummon('o02H',false,"SSS",32000,20000,  1500,15,26,  7500,0,1.90) // 潮汐巨人
        call thistype.registerSummon('o02G',false,"SSS",32000,14000,  1500,15,16,  4500,3000,1.60) // 电气
        call thistype.registerSummon('o02J',false,"SSS",32000,17000,  1500,15,19,  7400,0,1.70) // 娜迦女王
        call thistype.registerSummon('o02O',false,"SSS",32000,16000,  1500,15,16,  500,7200,1.80) // 圣人·阿德莱
        call thistype.registerSummon('o02E',false,"SSS",32000,18000,  1500,15,21,  7800,0,1.70) // 御龙骑士


        call thistype.registerSummonAbility('o00M','A04K') // N 地穴 - 尖针
        call thistype.registerSummonAbility('o01S','A07S') // N 月亮井 - 治疗之泉
        call thistype.registerSummonAbility('o01S','A0AT') // N 月亮井 - 治疗之泉 
        call thistype.registerSummonAbility('o008','A056') // C 民兵 - 勋章
        call thistype.registerSummonAbility('o00E','A04T') // C 血精灵 - 心灵之火
        call thistype.registerSummonAbility('o00S','A09B') // C 邪恶苦力 - 奋力
        call thistype.registerSummonAbility('o01F','A08A') // C 树人 - 本质
        call thistype.registerSummonAbility('o00R','A09C') // C 兽人大兵 - 斧力
        call thistype.registerSummonAbility('o016','A09D') // C 萨满牛祭司 - 净化
        call thistype.registerSummonAbility('o00W','A07O') // C 巨魔巫医 - 荼毒
        call thistype.registerSummonAbility('o01V','A09E') // C 暗夜弓手 - 穿透
        call thistype.registerSummonAbility('o01W','A09F') // C 角鹰弓手 - 俯视穿透
        call thistype.registerSummonAbility('o022','A054') // C 德鲁伊 - 荆棘
        call thistype.registerSummonAbility('o00C','A04M') // B 步兵 - 铁壁
        call thistype.registerSummonAbility('o017','A09H') // B 灯提白牛 - 虚灵
        call thistype.registerSummonAbility('o014','A091') // B 飞龙骑士 - 毒标
        call thistype.registerSummonAbility('o020','A04W') // B 精灵龙 - 魔焰
        call thistype.registerSummonAbility('o00G','A08V') // B 巨魔枪士 - 丧心病狂
        call thistype.registerSummonAbility('o00T','A089') // B 狼骑 - 诱捕
        call thistype.registerSummonAbility('o00Z','A04Y') // B 龙鹰骑士 - 缚足
        call thistype.registerSummonAbility('o01Z','A049') // B 露娜 - 月刃
        call thistype.registerSummonAbility('o01U','A055') // B 树妖 - 绿枪
        call thistype.registerSummonAbility('o00K','A04Q') // B 铁枪手 - 扳机精通
        call thistype.registerSummonAbility('o00V','A09G') // B 邪恶兽人大兵 - 狂斧
        call thistype.registerSummonAbility('o023','A09K') // B 熊战德鲁伊 - 咆哮
        call thistype.registerSummonAbility('o01G','A053') // B 远古树精 - 投掷
        call thistype.registerSummonAbility('o00L','A03V') // B 牧师 - 光导医疗
        call thistype.registerSummonAbility('o019','A07K') // B 巫师 - 邪术
        call thistype.registerSummonAbility('o00D','A04U') // A 剑士 - 刃风式
        call thistype.registerSummonAbility('o00N','A03O') // A 骑士 - 斩铁式
        call thistype.registerSummonAbility('o021','A07V') // A 黑暗精灵 - 魅刃
        call thistype.registerSummonAbility('o015','A07T') // A 幻界飞龙 - 蔽日
        call thistype.registerSummonAbility('o01H','A04S') // A 巨魔蝙蝠骑手 - 火焰燃油
        call thistype.registerSummonAbility('o01B','A059') // A 骷骨巫长 - 蛊虫
        call thistype.registerSummonAbility('o024','A09L') // A 猛熊德鲁伊 - 猛熊之躯
        call thistype.registerSummonAbility('o00O','A09J') // A 魔导师 - 感应
        call thistype.registerSummonAbility('o00P','A08G') // A 女巫 - 大焚火
        call thistype.registerSummonAbility('o00X','A04P') // A 迫击炮小队 - 黑色火药
        call thistype.registerSummonAbility('o01C','A09M') // A 科多骑手 - 吞噬
        call thistype.registerSummonAbility('o01X','A052') // A 山岭巨人 - 嘲讽
        call thistype.registerSummonAbility('o010','A08D') // A 狮鹫骑士 - 风暴战锤
        call thistype.registerSummonAbility('o018','A051') // A 图腾战牛 - 抨击
        call thistype.registerSummonAbility('o00U','A09I') // A 邪恶狼骑 - 掠夺
        call thistype.registerSummonAbility('o01A','A07J') // A 邪恶巫师 - 痛苦链
        call thistype.registerSummonAbility('o01J','A08Z') // A 战争古树 - 林撼
        call thistype.registerSummonAbility('o01R','A05A') // A 秘迹古树 - 秘沼
        call thistype.registerSummonAbility('o01Q','A04I') // A 苍风古树 - 烈风
        call thistype.registerSummonAbility('o01L','A07Y') // A 智慧古树 - 通明
        call thistype.registerSummonAbility('o02B','A04E') // A 伐木机 - 齿轮割裂
        call thistype.registerSummonAbility('o02C','A08F') // A 机关兵 - 灼热火焰
        call thistype.registerSummonAbility('o027','A04X') // A 精灵射手 - 强弓
        call thistype.registerSummonAbility('o029','A09P') // A 骷髅魔法师 - 深渊
        call thistype.registerSummonAbility('o02A','A08E') // A 娜迦海兵 - 激浪
        call thistype.registerSummonAbility('o00Y','A07X') // S 飞行机器 - 机关枪
        call thistype.registerSummonAbility('o012','A04R') // S 坦克部队 - 烈性炮弹
        call thistype.registerSummonAbility('o01D','A07U') // S 邪恶科多骑手 - 邪殇
        call thistype.registerSummonAbility('o025','A058') // S 奇美拉 - 龙息
        call thistype.registerSummonAbility('o028','A09S') // S 暗影猎手 - 毒手
        call thistype.registerSummonAbility('o00Q','A03T') // S 寒冰女巫 - 冰心魂
        call thistype.registerSummonAbility('o02F','A080') // S 冰魔怪 - 暴风雪
        call thistype.registerSummonAbility('o02V','A081') // S 冰魔灵 - 千里冰封
        call thistype.registerSummonAbility('o013','A08O') // S 火凤凰 - 涅磐
        call thistype.registerSummonAbility('o01Y','A04C') // S 山岭巨人·战棍 - 战棍
        call thistype.registerSummonAbility('o01E','A04A') // S 牛头人酋长 - 粉碎
        call thistype.registerSummonAbility('o026','A04Z') // S 月之女祭司 - 星落
        call thistype.registerSummonAbility('o02N','A03Y') // S 黑暗游侠 - 黑羽箭

        call thistype.registerSummonAbility('o02K','A08T') // SS 牛头人武士 - 狂野
        call thistype.registerSummonAbility('o02L','A04B') // SS 悟空 - 过激顽石
        call thistype.registerSummonAbility('o02D','A065') // SS 水魔灵 - 水体
        call thistype.registerSummonAbility('o02S','A050') // SS 守望者 - 威吓
        call thistype.registerSummonAbility('o02T','A08M') // SS 熊猫酒仙 - 心火
        call thistype.registerSummonAbility('o02M','A09T') // SS 小鹿 - 缠绕
        call thistype.registerSummonAbility('o02R','A09U') // SS 恶魔猎手 - 旋环切割
        call thistype.registerSummonAbility('o02Q','A09V') // SS 逸风 - 致命一击
        call thistype.registerSummonAbility('o02P','A09W') // SS 山丘之王 - 雷霆之怒

        call thistype.registerSummonAbility('o02H','A09X') // SSS 潮汐巨人 - 重踏
        call thistype.registerSummonAbility('o02E','A08N') // SSS 御龙骑士 - 龙神爪
        call thistype.registerSummonAbility('o02I','A09Y') // SSS 画笔仙女 - 笔墨一道
        call thistype.registerSummonAbility('o02G','A09Z') // SSS 电气 - 哔哩哔哩
        call thistype.registerSummonAbility('o02J','A057') // SSS 娜迦女王 - 腐蚀之液
        call thistype.registerSummonAbility('o02O','A0A0') // SSS 圣人·阿德莱 - 天启

        // vip 物品
        set vipItempools_count = 15
        set vipItempools[1] = 'I013'
        set vipItempools[2] = 'I017'
        set vipItempools[3] = 'I02A'
        set vipItempools[4] = 'I01J'
        set vipItempools[5] = 'I016'
        set vipItempools[6] = 'I00L'
        set vipItempools[7] = 'I00F'
        set vipItempools[8] = 'I012'
        set vipItempools[9] = 'I000'
        set vipItempools[10] = 'I00X'
        set vipItempools[11] = 'I00D'
        set vipItempools[12] = 'I01K'
        set vipItempools[13] = 'I010'
        set vipItempools[14] = 'I00B'
        set vipItempools[15] = 'I01M'

        // 瞬时物品
        set momentItems_count = 6
        set momentItems[1]= 'o002'
        set momentItems[2]= 'o003'
        set momentItems[3]= 'o004'
        set momentItems[4]= 'o005'
        set momentItems[5]= 'o006'
        set momentItems[6]= 'o007'

        //
		set spaceDegX[1] = 34
		set spaceDegY[1] = 4072
		set spaceDegX[2] = 4069
		set spaceDegY[2] = 4058
		set spaceDegX[3] = 4085
		set spaceDegY[3] = 38
		set spaceDegX[4] = 52
		set spaceDegY[4] = 45
		set spaceDeg2X[1] = 585
		set spaceDeg2Y[1] = 3535
		set spaceDeg2X[2] = 3535
		set spaceDeg2Y[2] = 3535
		set spaceDeg2X[3] = 3535
		set spaceDeg2Y[3] = 588
		set spaceDeg2X[4] = 588
		set spaceDeg2Y[4] = 588
        set spaceDeg3X[1] = 1100
		set spaceDeg3Y[1] = 3020
		set spaceDeg3X[2] = 3020
		set spaceDeg3Y[2] = 3020
		set spaceDeg3X[3] = 3020
		set spaceDeg3Y[3] = 1100
		set spaceDeg3X[4] = 1100
		set spaceDeg3Y[4] = 1100
        set spaceDeg4X[1] = 1580
		set spaceDeg4Y[1] = 2490
		set spaceDeg4X[2] = 2490
		set spaceDeg4Y[2] = 2490
		set spaceDeg4X[3] = 2490
		set spaceDeg4Y[3] = 1580
		set spaceDeg4X[4] = 1580
		set spaceDeg4Y[4] = 1580

        set rectSpaceDeg1_1 = hrect.createInLoc(spaceDegX[1], spaceDegY[1], 128,128)
        set rectSpaceDeg1_2 = hrect.createInLoc(spaceDegX[2], spaceDegY[2], 128,128)
        set rectSpaceDeg1_3 = hrect.createInLoc(spaceDegX[3], spaceDegY[3], 128,128)
        set rectSpaceDeg1_4 = hrect.createInLoc(spaceDegX[4], spaceDegY[4], 128,128)
        set rectSpaceDeg2_1 = hrect.createInLoc(spaceDeg2X[1],spaceDeg2Y[1],128,128)
        set rectSpaceDeg2_2 = hrect.createInLoc(spaceDeg2X[2],spaceDeg2Y[2],128,128)
        set rectSpaceDeg2_3 = hrect.createInLoc(spaceDeg2X[3],spaceDeg2Y[3],128,128)
        set rectSpaceDeg2_4 = hrect.createInLoc(spaceDeg2X[4],spaceDeg2Y[4],128,128)
        set rectSpaceDeg3_1 = hrect.createInLoc(spaceDeg3X[1],spaceDeg3Y[1],128,128)
        set rectSpaceDeg3_2 = hrect.createInLoc(spaceDeg3X[2],spaceDeg3Y[2],128,128)
        set rectSpaceDeg3_3 = hrect.createInLoc(spaceDeg3X[3],spaceDeg3Y[3],128,128)
        set rectSpaceDeg3_4 = hrect.createInLoc(spaceDeg3X[4],spaceDeg3Y[4],128,128)
        set rectSpaceDeg4_1 = hrect.createInLoc(spaceDeg4X[1],spaceDeg4Y[1],128,128)
        set rectSpaceDeg4_2 = hrect.createInLoc(spaceDeg4X[2],spaceDeg4Y[2],128,128)
        set rectSpaceDeg4_3 = hrect.createInLoc(spaceDeg4X[3],spaceDeg4Y[3],128,128)
        set rectSpaceDeg4_4 = hrect.createInLoc(spaceDeg4X[4],spaceDeg4Y[4],128,128)

        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg1_1 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg11)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg1_2 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg12)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg1_3 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg13)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg1_4 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg14)

        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg2_1 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg21)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg2_2 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg22)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg2_3 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg23)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg2_4 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg24)
        
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg3_1 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg31)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg3_2 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg32)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg3_3 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg33)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg3_4 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg34)

        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg4_1 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg41)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg4_2 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg42)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg4_3 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg43)
        set tg = CreateTrigger()
		call TriggerRegisterEnterRectSimple( tg, rectSpaceDeg4_4 )
		call TriggerAddAction(tg, function thistype.gotoRectSpaceDeg44)

    endmethod

endstruct
