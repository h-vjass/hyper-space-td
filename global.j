
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
integer g_temp_mon_limit = 360
integer g_max_wave = 100
integer g_wave = 0
integer g_first_wave = 0
integer g_boss_mod = 5
real g_boss_ready_time = 90
real g_first_ready_time = 30.00
boolean g_waving = false
group g_crazy_boss = CreateGroup()

real g_game_speed = 1.00 //
real g_game_mon_loop = 2.00 // 每只怪出兵间隔
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
integer g_summon_ability_count
integer array g_summon_ability

integer g_gp_max = 50
group g_gp_mon = CreateGroup()
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
    endmethod

    public static method registerSummonAbility takes integer ablid returns nothing
        set g_summon_ability_count = g_summon_ability_count + 1
        set g_summon_ability[g_summon_count] = ablid
    endmethod

    public static method getSummonTargetUid takes integer triggerUID returns integer
        local integer targetUID = 0
        local integer targetCount = 0
        local integer array targetArr
        if(triggerUID == 'o009')then // 帐篷
            set targetCount = 3
            set targetArr[1] = 'o00A' // N 农场
            set targetArr[2] = 'o00M' // N 地穴
            set targetArr[3] = 'o01S' // N 月亮井
        endif
        if(triggerUID == 'o00B')then // D 农民
            set targetCount = 2
            set targetArr[1] = 'o008' // C 民兵
            set targetArr[2] = 'o00E' // C 血妖精
        endif
        if(triggerUID == 'o00I')then // D 苦力
            set targetCount = 4
            set targetArr[1] = 'o00S' // C 邪恶苦力
            set targetArr[2] = 'o00R' // C 兽人大兵
            set targetArr[3] = 'o016' // C 萨满牛祭司
            set targetArr[4] = 'o00W' // C 巨魔巫医
        endif
        if(triggerUID == 'o00J')then // D 小精灵
            set targetCount = 9
            set targetArr[1] = 'o01F' // C 树人
            set targetArr[2] = 'o01F' // C 树人
            set targetArr[3] = 'o01V' // C 暗夜弓手
            set targetArr[4] = 'o01V' // C 暗夜弓手
            set targetArr[5] = 'o01W' // C 角鹰弓手
            set targetArr[6] = 'o01W' // C 角鹰弓手
            set targetArr[7] = 'o022' // C 德鲁伊
            set targetArr[8] = 'o022' // C 德鲁伊
            set targetArr[9] = 'o020' // B 精灵龙
        endif
        // ---------------------------------------------
        if(triggerUID == 'o008')then // C 民兵
            set targetCount = 2
            set targetArr[1] = 'o00K' // B 铁枪手
            set targetArr[2] = 'o00C' // B 步兵
        endif
        if(triggerUID == 'o00E')then // C 血妖精
            set targetCount = 2
            set targetArr[1] = 'o00L' // B 牧师
            set targetArr[2] = 'o00Z' // B 龙鹰骑士
        endif
        if(triggerUID == 'o00S')then // C 邪恶苦力
            set targetCount = 2
            set targetArr[1] = 'o00V' // B 邪恶兽人大兵
            set targetArr[2] = 'o014' // B 飞龙骑士
        endif
        if(triggerUID == 'o00R')then // C 兽人大兵
            set targetCount = 3
            set targetArr[1] = 'o00T' // B 狼骑
            set targetArr[2] = 'o019' // B 巫师
            set targetArr[3] = 'o00V' // B 邪恶兽人大兵
            set targetArr[1] = 'o014' // B 飞龙骑士
        endif
        if(triggerUID == 'o016')then // C 萨满牛祭司
            set targetCount = 1
            set targetArr[1] = 'o017' // B 灯提白牛
        endif
        if(triggerUID == 'o00W')then // C 巨魔巫医
            set targetCount = 2
            set targetArr[1] = 'o00G' // B 巨魔枪士
            set targetArr[2] = 'o019' // B 巫师
        endif
        if(triggerUID == 'o01F')then // C 树人
            set targetCount = 2
            set targetArr[1] = 'o01U' // B 树妖
            set targetArr[2] = 'o01G' // B 远古树精
        endif
        if(triggerUID == 'o01V' or triggerUID == 'o01W')then // C 暗夜弓手 | C 角鹰弓手
            set targetCount = 1
            set targetArr[1] = 'o01Z' // B 露娜
        endif
        if(triggerUID == 'o022')then // C 德鲁伊
            set targetCount = 1
            set targetArr[1] = 'o023' // B 熊战德鲁伊
        endif
        // ---------------------------------------------
        if(triggerUID == 'o00K')then // B 铁枪手
            set targetCount = 3
            set targetArr[1] = 'o00X' // A 迫击炮小队
            set targetArr[2] = 'o012' // A 坦克部队
            set targetArr[3] = 'o00Y' // A 飞行机器
        endif
        if(triggerUID == 'o00C')then // B 步兵
            set targetCount = 3
            set targetArr[1] = 'o00D' // A 剑士
            set targetArr[2] = 'o00N' // A 骑士
            set targetArr[3] = 'o010' // A 狮鹫骑士
        endif
        if(triggerUID == 'o00L')then // B 牧师
            set targetCount = 2
            set targetArr[1] = 'o00P' // A 女巫
            set targetArr[2] = 'o00O' // A 魔导师
        endif
        if(triggerUID == 'o00Z')then // B 龙鹰骑士
            set targetCount = 1
            set targetArr[1] = 'o010' // A 狮鹫骑士
        endif
        if(triggerUID == 'o00T')then // B 狼骑
            set targetCount = 2
            set targetArr[1] = 'o00U' // A 邪恶狼骑
            set targetArr[1] = 'o01C' // A 科多骑手
        endif
        if(triggerUID == 'o019')then // B 巫师
            set targetCount = 2
            set targetArr[1] = 'o01A' // A 邪恶巫师
            set targetArr[2] = 'o01B' // A 骷骨巫长
        endif
        if(triggerUID == 'o00V')then // B 邪恶兽人大兵
            set targetCount = 2
            set targetArr[1] = 'o00U' // A 邪恶狼骑
            set targetArr[1] = 'o01A' // A 邪恶巫师
        endif
        if(triggerUID == 'o014')then // B 飞龙骑士
            set targetCount = 1
            set targetArr[1] = 'o015' // A 幻界飞龙
        endif
        if(triggerUID == 'o017')then // B 灯提白牛
            set targetCount = 1
            set targetArr[1] = 'o018' // A 图腾战牛
        endif
        if(triggerUID == 'o00G')then // B 巨魔枪士
            set targetCount = 1
            set targetArr[1] = 'o00H' // A 巨魔蝙蝠骑手
        endif
        if(triggerUID == 'o01U')then // B 树妖
            set targetCount = 1
            set targetArr[1] = 'o01X' // A 山岭巨人
        endif
        if(triggerUID == 'o01U')then // B 远古树精
            set targetCount = 4
            set targetArr[1] = 'o01J' // A 战争古树
            set targetArr[2] = 'o01L' // A 智慧古树
            set targetArr[3] = 'o01R' // A 秘迹古树
            set targetArr[4] = 'o01Q' // A 苍风古树
        endif
        if(triggerUID == 'o01Z')then // B 露娜
            set targetCount = 1
            set targetArr[1] = 'o021' // A 黑暗精灵
        endif
        if(triggerUID == 'o023')then // B 熊战德鲁伊
            set targetCount = 1
            set targetArr[1] = 'o024' // A 猛熊德鲁伊
        endif
        if(triggerUID == 'o020')then // B 精灵龙
            set targetCount = 1
            set targetArr[1] = 'o025' // A 奇美拉
        endif
        // ---------------------------------------------
        if(triggerUID == 'o01C')then // A 科多骑手
            set targetCount = 1
            set targetArr[1] = 'o01D' // S 邪恶科多骑手
        endif
        if(triggerUID == 'o01X')then // A 山岭巨人
            set targetCount = 1
            set targetArr[1] = 'o01Y' // S 山岭巨人·战棍
        endif
        // ---------------------------------------------
        if(targetCount == 1)then
            set targetUID = targetArr[1]
        else
            set targetUID = targetArr[GetRandomInt(1,targetCount)]
        endif
        return targetUID
    endmethod

    public static method setSummonAbility takes unit u,integer abid returns nothing
        if(u == null)then
            return
        endif
        if(GetUnitAbilityLevel(u,'A04K') > 0)then // N 地穴 - 尖针
            call hattr.addHuntRebound(u,35,0)
        elseif(uid == 'A056')then // C 民兵 - 勋章
            call hattrEffect.addAttackPhysicalVal(u,2,0)
            call hattrEffect.addAttackPhysicalDuring(u,7,0)
        elseif(uid == 'A04T')then // C 血精灵 - 心灵之火
            call hattrEffect.addAttackMagicVal(u,4,0)
            call hattrEffect.addAttackMagicDuring(u,5,0)
        elseif(uid == 'A04M')then // B 步兵 - 铁壁
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
        elseif(uid == 'A04U')then // A 剑士 - 刃风式
            call hattr.addAttackHuntType(u,"wind",0)
            call hattrEffect.addAttackSpeedVal(u,10,0)
            call hattrEffect.addAttackSpeedDuring(u,5.0,0)
            call hattrEffect.addWindVal(u,10,0)
            call hattrEffect.addWindDuring(u,5.0,0)
        endif
        call thistype.registerSummonAbility('A04K') // N 地穴 - 尖针
        call thistype.registerSummonAbility('A056') // C 民兵 - 勋章
        call thistype.registerSummonAbility('A04T') // C 血精灵 - 心灵之火
        call thistype.registerSummonAbility('A09B') // C 邪恶苦力 - 奋力
        call thistype.registerSummonAbility('A08A') // C 树人 - 本质
        call thistype.registerSummonAbility('A09C') // C 兽人大兵 - 斧力
        call thistype.registerSummonAbility('A09D') // C 萨满牛祭司 - 净化
        call thistype.registerSummonAbility('A07O') // C 巨魔巫医 - 荼毒
        call thistype.registerSummonAbility('A09E') // C 暗夜弓手 - 穿透
        call thistype.registerSummonAbility('A09F') // C 角鹰弓手 - 俯视穿透
        call thistype.registerSummonAbility('A054') // C 德鲁伊 - 荆棘
        call thistype.registerSummonAbility('A04M') // B 步兵 - 铁壁
        call thistype.registerSummonAbility('A09H') // B 灯提白牛 - 虚灵
        call thistype.registerSummonAbility('A091') // B 飞龙骑士 - 毒标
        call thistype.registerSummonAbility('A04W') // B 精灵龙 - 魔焰
        call thistype.registerSummonAbility('A08V') // B 巨魔枪士 - 丧心病狂
        call thistype.registerSummonAbility('A089') // B 狼骑 - 诱捕
        call thistype.registerSummonAbility('A04Y') // B 龙鹰骑士 - 缚足
        call thistype.registerSummonAbility('A049') // B 露娜 - 月刃
        call thistype.registerSummonAbility('A055') // B 树妖 - 绿枪
        call thistype.registerSummonAbility('A04Q') // B 铁枪手 - 扳机精通
        call thistype.registerSummonAbility('A09G') // B 邪恶兽人大兵 - 狂斧
        call thistype.registerSummonAbility('A09K') // B 熊战德鲁伊 - 咆哮
        call thistype.registerSummonAbility('A053') // B 远古树精 - 投掷
        call thistype.registerSummonAbility('A03V') // B 牧师 - 光导医疗
        call thistype.registerSummonAbility('A07K') // B 巫师 - 邪术
        call thistype.registerSummonAbility('A04U') // A 剑士 - 刃风式
        call thistype.registerSummonAbility('A03O') // A 骑士 - 斩铁式
        call thistype.registerSummonAbility('A07X') // A 飞行机器 - 机关枪
        call thistype.registerSummonAbility('A07V') // A 黑暗精灵 - 魅刃
        call thistype.registerSummonAbility('A07T') // A 幻界飞龙 - 蔽日
        call thistype.registerSummonAbility('A04S') // A 巨魔蝙蝠骑手 - 火焰燃油
        call thistype.registerSummonAbility('A059') // A 骷骨巫长 - 蛊虫
        call thistype.registerSummonAbility('A09L') // A 猛熊德鲁伊 - 猛熊之躯
        call thistype.registerSummonAbility('A09J') // A 魔导师 - 感应
        call thistype.registerSummonAbility('A08G') // A 女巫 - 大焚火
        call thistype.registerSummonAbility('A04P') // A 迫击炮小队 - 黑色火药
        call thistype.registerSummonAbility('A09M') // A 科多骑手 - 吞噬
        call thistype.registerSummonAbility('A058') // A 奇美拉 - 龙息
        call thistype.registerSummonAbility('A052') // A 山岭巨人 - 嘲讽
        call thistype.registerSummonAbility('A08D') // A 狮鹫骑士 - 风暴战锤
        call thistype.registerSummonAbility('A04R') // A 坦克部队 - 烈性炮弹
        call thistype.registerSummonAbility('A051') // A 图腾战牛 - 抨击
        call thistype.registerSummonAbility('A09I') // A 邪恶狼骑 - 掠夺
        call thistype.registerSummonAbility('A07J') // A 邪恶巫师 - 痛苦链
        call thistype.registerSummonAbility('A04I') // A 苍风古树 - 烈风
        call thistype.registerSummonAbility('A05A') // A 秘迹古树 - 秘沼
        call thistype.registerSummonAbility('A08Z') // A 战争古树 - 林撼
        call thistype.registerSummonAbility('A07Y') // A 智慧古树 - 通明
        call thistype.registerSummonAbility('A03T') // S 寒冰女巫 - 冰心魂
        call thistype.registerSummonAbility('A080') // S 寒冰女巫 - 暴风雪
        call thistype.registerSummonAbility('A081') // S 寒冰女巫 - 千里冰封
        call thistype.registerSummonAbility('A08M') // S 火凤凰 - 火鸟
        call thistype.registerSummonAbility('A08N') // S 火凤凰 - 涅磐
        call thistype.registerSummonAbility('A08O') // S 火凤凰 - 展翅
        call thistype.registerSummonAbility('A065') // S 牛头人酋长 - 狂热
        call thistype.registerSummonAbility('A04A') // S 牛头人酋长 - 粉碎
        call thistype.registerSummonAbility('A08T') // S 牛头人酋长 - 心狂
        call thistype.registerSummonAbility('A04B') // S 山岭巨人·战棍 - 过激
        call thistype.registerSummonAbility('A04C') // S 山岭巨人·战棍 - 战棍
        call thistype.registerSummonAbility('A03Y') // S 山岭巨人·战棍 - 大闹一番
        call thistype.registerSummonAbility('A07U') // S 邪恶科多骑手 - 邪殇
        call thistype.registerSummonAbility('A04X') // S 月之女祭司 - 强弓
        call thistype.registerSummonAbility('A050') // S 月之女祭司 - 威吓
        call thistype.registerSummonAbility('A04Z') // S 月之女祭司 - 月光
    endmethod

    public static method initSummonAbility takes unit u,unit tplu returns nothing
        local integer total = 0
        local integer i = 0
        set i = g_summon_ability_count
        if(u != null)then
            loop
                exitwhen (i < 1 or total >= 4)
                    if(GetUnitAbilityLevel(u,g_summon_ability[i]) > 0)then
                        call thistype.setSummonAbility(u,g_summon_ability[i])
                    endif
                set i = i - 1
            endloop
        endif
        set i = g_summon_ability_count
        if(u != null and tplu != null and total < 4)then
            loop
                exitwhen (i < 1 or total >= 4)
                    if(GetUnitAbilityLevel(u,g_summon_ability[i]) <= 0 and GetUnitAbilityLevel(tplu,g_summon_ability[i]) > 0)then
                        call thistype.setSummonAbility(u,g_summon_ability[i])
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
			call heffect.toUnitLoc("war3mapImported\\DreadAwe.mdx",triggerUnit,0)
			call hitem.drop(triggerUnit)
			call GroupRemoveUnit(g_gp_summon, triggerUnit)
			call hunit.del(triggerUnit,0)
        elseif(skillid == 'A06G')then // 建筑移动
            call RemoveUnit(GetSpellTargetUnit())
            set loc = GetSpellTargetLoc()
            call SetUnitPositionLoc( triggerUnit, loc )
            call RemoveLocation(loc)
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
                call GroupRemoveUnit(g_gp_summon, triggerUnit)
                call GroupRemoveUnit(g_gp_summon, targetUnit)
                call RemoveUnit(targetUnit)
                call RemoveUnit(triggerUnit)
                set targetUID = thistype.getSummonTargetUid(GetUnitTypeId(triggerUnit))
                if(targetUID != 0)then
                    set targetUnit = hunit.createUnitXY(p,targetUID, x, y)
                    set ttg = hmsg.ttg2Unit(targetUnit,"成功连锁升级为 |cffffff80"+GetUnitName(targetUnit)+"|r",7,"",0,1.70,60.00)
                    call hmsg.style(ttg,"scale",0,0.1)
                    set ttg = null
                    call thistype.initSummon(targetUnit)
                endif
            endif
		elseif(skillid == 'A08V')then // 丧病
			call hunit.setUserData(triggerUnit,777,3.5)
			call hattr.addHuntReboundOppose(triggerUnit,100,3.5)
			call hattr.addUnarmOppose(triggerUnit,100,3.5)
		elseif(skillid == 'A03V' and targetUnit != null)then // 治疗
			call hattr.addLifeBack(targetUnit,20 + I2R(GetHeroLevel(triggerUnit)) * 0.10,3.00)
			if(GetUnitAbilityLevel(triggerUnit,'A04T') >= 1)then // 心灵之火
				call hattr.addAttackSpeed(targetUnit,4.0,3.00)
			endif
		elseif(skillid == 'A07J' and targetUnit != null)then // 治疗＃远距离
			call hattr.addLifeBack(targetUnit,40 + I2R(GetHeroLevel(triggerUnit)) * 0.15,3.00)
			if(GetUnitAbilityLevel(triggerUnit,'A04T') >= 1)then // 心灵之火
				call hattr.addAttackSpeed(targetUnit,4.0,3.00)
			endif
        elseif(skillid == 'A07K' and targetUnit != null)then // 邪术
			call hattr.addLifeBack(targetUnit,I2R(GetHeroLevel(triggerUnit)) * 0.5,20.00)
            call hattr.addAttackSpeed(targetUnit,45.0,20.00)
        elseif(skillid == 'A03Y')then // 山岭巨人·战棍 大闹一番
            call hattr.addHuntAmplitude(triggerUnit,I2R(GetUnitLevel(triggerUnit)) * 1, 10)
			call hattrEffect.setSwimOdds(triggerUnit,50,10)
            call hattrEffect.setSwimDuring(triggerUnit,0.5,10)
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
        if(triggerUnit == null or targetUnit == null)then
            set triggerUnit = null
            set targetUnit = null
            return
        endif
        // 1/10几率
        if(rand<=3)then
            if(uid == 'H00E' or uid == 'H00L')then // 山岭巨人/山岭巨人·战棍 嘲讽
                call heffect.toUnit("Abilities\\Spells\\NightElf\\Taunt\\TauntCaster.mdl",triggerUnit,"origin",1.00)
                call hattrEffect.addCrackFlyOdds(triggerUnit,50.0,4.00)
                call hattr.addToughness(triggerUnit,50.0,0)
                set filter = hFilter.create()
                call filter.isAlive(true)
                call filter.isEnemy(true,triggerUnit)
                call filter.isBuilding(false)
                set g = hgroup.createByUnit(triggerUnit,300.0,function hFilter.get )
                call filter.destroy()
                loop
                    exitwhen(IsUnitGroupEmptyBJ(g) == true)
                        set u = FirstOfGroup(g)
                        call GroupRemoveUnit(g,u)
                        call IssueTargetOrder(u, "attack", triggerUnit)
                        set u = null
                endloop
                call GroupClear(g)
                call DestroyGroup(g)
                set g = null
            endif
        endif
        // 1/6几率
        if(rand<=5)then
            if(uid == 'H012' and GetUnitAbilityLevel(triggerUnit,'A08V') >= 1)then // 狂战猎手 - 丧病
                call IssueImmediateOrder( triggerUnit, "avatar" )
            elseif(uid == 'H00L' and GetUnitAbilityLevel(triggerUnit,'A03Y') >= 1)then // 山岭巨人·战棍 - 大闹一番
                call IssueImmediateOrder( triggerUnit, "whirlwind" )
            elseif(uid == 'H00V' and GetUnitAbilityLevel(triggerUnit,'A080') >= 1)then // 冰骨之龙 - 暴风雪
                call IssuePointOrder( triggerUnit, "blizzard",GetUnitX(targetUnit),GetUnitY(targetUnit))
            elseif(uid == 'H00Z' and GetUnitAbilityLevel(triggerUnit,'A08G') >= 1)then // 炽焰之龙 - 大焚火
                call IssuePointOrder( triggerUnit, "breathoffire",GetUnitX(targetUnit),GetUnitY(targetUnit))
            endif
        endif
        // 100%触发
        if(uid == 'H012')then // 狂战猎手
            if(GetUnitAbilityLevel(triggerUnit,'A08V') >= 1 and hunit.getUserData(triggerUnit) == 777)then
                call hattr.subLifeBack(triggerUnit,1.2*GetUnitLevel(triggerUnit),3.5)
                call hattr.addAttackSpeed(triggerUnit,70,3.5)
                call hattr.addAttackPhysical(triggerUnit,2.5*GetUnitLevel(triggerUnit),3.5)
                call heffect.toUnit("war3mapImported\\BloodElementalMissile.mdl",triggerUnit,"origin",1.00)
            endif
        elseif(uid == 'H00F')then // 参天树精
            if(GetUnitAbilityLevel(triggerUnit,'A053') >= 1)then
                call hattr.subMove(targetUnit,10,5)
                call hattr.subAttackSpeed(targetUnit,15,5)
            endif
        elseif(uid == 'H00V')then // 冰骨之龙
            if(GetUnitAbilityLevel(triggerUnit,'A07Y') >= 1)then
                call hattrNatural.subIceOppose(targetUnit,5.0,5)
                call hattrNatural.subGhostOppose(targetUnit,5.0,5)
            endif
            if(GetUnitAbilityLevel(triggerUnit,'A081') >= 1)then
                set i = GetUnitUserData(triggerUnit)
                if(i<0)then
                    set i = 0
                endif
                if(i>=10)then
                    call heffect.toUnit("war3mapImported\\Enchantment.mdl",triggerUnit,"origin",1.00)
                    call hattrEffect.addBombVal(triggerUnit,I2R(GetUnitLevel(triggerUnit))*8,3)
                    call SetUnitUserData(triggerUnit,0)
                else
                    call SetUnitUserData(triggerUnit,i+1)
                endif
            endif
        elseif(uid == 'H010' or uid == 'H011')then // 火凤凰 - 展翅
            if(GetUnitAbilityLevel(triggerUnit,'A08O') >= 1)then
                set i = GetUnitUserData(triggerUnit)
                if(i<0)then
                    set i = 0
                endif
                if(i>=10)then
                    set u = hunit.createUnitXYFacing(GetOwningPlayer(triggerUnit),'n050',GetUnitX(triggerUnit),GetUnitY(triggerUnit),hlogic.getDegBetweenUnit(triggerUnit,targetUnit))
                    call SetUnitVertexColor( u, 255, 255, 255, 150 )
                    call SetUnitAnimation( u, "spell" )
                    call hunit.del(u,0.7)
                    set hxy.x = GetUnitX(triggerUnit)
                    set hxy.y = GetUnitY(triggerUnit)
                    set hxy = hlogic.polarProjection(hxy,750,hlogic.getDegBetweenUnit(u,targetUnit))
                    set loc = Location(hxy.x,hxy.y)
                    set bean = hAttrHuntBean.create()
                    set bean.damage = 20 * GetUnitLevel(triggerUnit)
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
                        call hevent.onSkillHappen(u,function thistype.onSummonSkillHappen)
                        call hevent.onAttack(u,function thistype.onSummonAttack)
                    endif

					call DoNothing() YDNL exitwhen true//(  )
				endif
			set i = i+1
		endloop
        call thistype.initSummonAbility(u,null)
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
        set u = hunit.createUnitXY(p,uid,x,y)
        call initSummon(u)
        call heffect.toUnit("Abilities\\Spells\\Other\\Awaken\\Awaken.mdl",u,"origin",0.80)
        call hitem.copy(tempu,u)
        call hunit.del(tempu,0)
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
        // 死亡时间计算
        set rebornTime = 10.00
        if(GetUnitAbilityLevel(killer,'A09A') > 0)then // LV0
            set rebornTime = rebornTime + 1
        elseif(GetUnitAbilityLevel(killer,'A03W') > 0)then // LV1
            set rebornTime = rebornTime + 2
        elseif(GetUnitAbilityLevel(killer,'A044') > 0)then // LV2
            set rebornTime = rebornTime + 3
        elseif(GetUnitAbilityLevel(killer,'A07Z') > 0)then // LV3
            set rebornTime = rebornTime + 4
        elseif(GetUnitAbilityLevel(killer,'A088') > 0)then // LV4
            set rebornTime = rebornTime + 5
        elseif(GetUnitAbilityLevel(killer,'A08B') > 0)then // LV5
            set rebornTime = rebornTime + 6
        elseif(GetUnitAbilityLevel(killer,'A08C') > 0)then // LV6
            set rebornTime = rebornTime + 7
        elseif(GetUnitAbilityLevel(killer,'A08L') > 0)then // LV7
            set rebornTime = rebornTime + 8
        elseif(GetUnitAbilityLevel(killer,'A08S') > 0)then // LV8
            set rebornTime = rebornTime + 9
        elseif(GetUnitAbilityLevel(killer,'A090') > 0)then // LV9
            set rebornTime = rebornTime + 10
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
        if(GetUnitAbilityLevel(u,'A08N') >= 1)then // 火凤凰 - 涅磐
            set rebornTime = rebornTime * 0.5
        endif
        set tempu = hunit.createUnitXYFacing(p,u_dead_timering[GetUnitFoodUsed(u)],x,y,270)
        call SetUnitVertexColor(tempu, 255, 255, 255, 200)
        call hunit.shadow(uid,x+15,y+15,270,50,0,75,120,rebornTime)
        if(rebornTime>0)then
            call SetUnitTimeScalePercent(tempu, 1000.0 / rebornTime)
        endif
        call hitem.copy(u,tempu)
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

    public static method registerItem1 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // 恶魔的紫色血浆
		set hitembean.item_id = 'I00Y'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 坚固的盾牌 [ 500 G ]
		set hitembean.item_id = 'I00B'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 500
		set hitembean.defend = 4
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 可爱的玩偶 [ 50 G ]
		set hitembean.item_id = 'I00F'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 50
		set hitembean.attackMagic = 40
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 空瓶 [ 10 G ]
		set hitembean.item_id = 'I00D'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 破烂的短剑 [ 150 G ]
		set hitembean.item_id = 'I000'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 150
        set hitembean.attackPhysical = 30
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 水 [ 1000 G ]
		set hitembean.item_id = 'I00J'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 1000
        set hitembean.water = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 铁铲 [ 300 G ]
		set hitembean.item_id = 'I00E'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 300
        set hitembean.attackPhysical = 45
        set hitembean.attackSpeed = -5
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 铁锹 [ 400 G ]
		set hitembean.item_id = 'I00I'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 400
        set hitembean.attackPhysical = 60
        set hitembean.attackSpeed = -3
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 鲜血色的钥匙
		set hitembean.item_id = 'I00G'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 小美的头环 [ 200 G ]
		set hitembean.item_id = 'I00L'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 200
		set hitembean.defend = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 小柔的红宝石
		set hitembean.item_id = 'I00W'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 50
		set hitembean.resistance = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 锈迹的铁圈木盾 [ 250 G ]
		set hitembean.item_id = 'I002'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 250
		set hitembean.defend = 2
		set hitembean.punish = 300
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 侵蚀的铁圈木盾 [ 1000 G ]
		set hitembean.item_id = 'I00X'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 1000
        set hitembean.defend = 6
        set hitembean.punish = 500
        set hitembean.corrosionVal = 2
        set hitembean.corrosionDuring = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 银色的钥匙
		set hitembean.item_id = 'I00K'
		set hitembean.item_type = HITEM_TYPE_CONSUME
		set hitembean.item_overlay = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        call hitem.onUse('I00K', function thistype.itemUseAction)
        set hitembean = hItemBean.create() // 装满井水的瓶子
		set hitembean.item_id = 'I00H'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 1
		call hitem.format(hitembean)
		call hitembean.destroy()
        call hitem.onUse('I00H', function thistype.itemUseAction)
        set hitembean = hItemBean.create() // 诅咒玩偶 [ 20 G ]
		set hitembean.item_id = 'I00C'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 20
		set hitembean.attackMagic = 20
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 铁制之爪 [ 2500 G ]
		set hitembean.item_id = 'I00Z'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 2500
		set hitembean.attackPhysical = 50
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 恶魔之爪 [ 5000 G ]
		set hitembean.item_id = 'I011'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 5000
		set hitembean.attackPhysical = 325
        set hitembean.corrosionVal = 3
        set hitembean.corrosionDuring = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 加速手套 [ 3000 G ]
		set hitembean.item_id = 'I010'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 3000
		set hitembean.attackSpeed = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 恢复指环 [ 2000 G ]
		set hitembean.item_id = 'I013'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 2000
		set hitembean.lifeBack = 1.5
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 魔法指环 [ 1000 G ]
		set hitembean.item_id = 'I014'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 1000
		set hitembean.manaBack = 1.0
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 生命护身符 [ 5000 G ]
		set hitembean.item_id = 'I016'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 5000
		set hitembean.life = 500
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 魔法护身符 [ 4000 G ]
		set hitembean.item_id = 'I017'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 4000
		set hitembean.mana = 300
        set hitembean.attackMagic = 90
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 速度之靴 [ 1000 G ]
		set hitembean.item_id = 'I012'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 1000
		set hitembean.move = 20
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 铁皮树枝 [ 2000 G ]
		set hitembean.item_id = 'I018'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 1250
		set hitembean.attackPhysical = 9
		set hitembean.attackMagic = 9
		set hitembean.knocking = 5
		set hitembean.violence = 5
        set hitembean.str = 2
		set hitembean.agi = 2
		set hitembean.int = 2
		set hitembean.avoid = 0.3
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 优越之戒 [ 5000 G ]
		set hitembean.item_id = 'I015'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 5000
		set hitembean.str = 9
		set hitembean.agi = 6
		set hitembean.int = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 神秘腰带 [ 5000 G ]
		set hitembean.item_id = 'I019'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 5000
		set hitembean.resistance = 5
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 精红球 [ 7000 G ]
		set hitembean.item_id = 'I01A'
		set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 7000
		set hitembean.resistance = 30
		call hitem.format(hitembean)
		call hitembean.destroy()
		// 合成
        call hitemMix.newFormula('I00X',1) // 侵蚀的铁圈木盾 [ 100 G ]
		call hitemMix.addFlag('I00X','I002',1) // 锈迹的铁圈木盾 [ 50 G ]
        call hitemMix.addFlag('I00X','I00Y',1) // 恶魔的紫色血浆
		call hitemMix.newFormula('I00K',1) // 银色的钥匙
		call hitemMix.addFlag('I00K','I00G',1)
		call hitemMix.addFlag('I00K','I00J',1) // 水
		call hitemMix.newFormula('I00H',1) // 装满井水的瓶子
		call hitemMix.addFlag('I00H','I00D',1)
        call hitemMix.addFlag('I00H','I00J',1) // 水
        call hitemMix.newFormula('I011',1) // 恶魔之爪 [ 1000 G ]
		call hitemMix.addFlag('I011','I00Z',1) // 铁制之爪 [ 1000 G ]
        call hitemMix.addFlag('I011','I00Y',1) // 恶魔的紫色血浆
        call hitemMix.newFormula('I01A',1) // 精红球 [ 7000 G ]
		call hitemMix.addFlag('I01A','I019',1) // 神秘腰带 [ 6500 G ]
        call hitemMix.addFlag('I01A','I00W',1) // 小柔的红宝石
    endmethod

    public static method registerItem2 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // 恶魔的灵魂 [ 200000G ]
		set hitembean.item_id = 'I01G'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
        set hitembean.item_gold = 200000
        set hitembean.bluntVal = 25
        set hitembean.bluntDuring = 3.00
        set hitembean.muggleVal = 25
        set hitembean.muggleDuring = 3.00
        set hitembean.tortuaVal = 25
        set hitembean.tortuaDuring = 3.00
        set hitembean.silentOdds = 10
        set hitembean.silentDuring = 1.00
        set hitembean.unarmOdds = 10
        set hitembean.unarmDuring = 1.00
        set hitembean.fetterOdds = 15
        set hitembean.fetterDuring = 1.00
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 无用的水晶球 [ 200000G ]
		set hitembean.item_id = 'I01I'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 200000
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 全知全能之书 [ 23300 G ]
		set hitembean.item_id = 'I01J'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 23300
		set hitembean.expRatio = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 令人清醒的钻石 [ 100000G ]
		set hitembean.item_id = 'I01L'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.swimOppose = 100
		set hitembean.goldRatio = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 优秀望远镜 [ 10000 G ]
		set hitembean.item_id = 'I01K'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 10000
		set hitembean.sight = 200
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 毒液根 [ 100000G ]
		set hitembean.item_id = 'I01C'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.poison = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 毒液根
		set hitembean.item_id = 'I01R'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 0
		set hitembean.poison = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 寒霜玉 [ 100000G ]
		set hitembean.item_id = 'I01E'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.water = 10
		set hitembean.ice = 10
        call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 烈焰珠 [ 100000G ]
		set hitembean.item_id = 'I01D'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.fire = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 烈焰珠 [ 捡的 ]
		set hitembean.item_id = 'I01M'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.fire = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 灵光爆 [ 100000G ]
		set hitembean.item_id = 'I01H'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.light = 12
		set hitembean.resistance = 10
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 闪电球 [ 100000 G ]
		set hitembean.item_id = 'I01B'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.thunder = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 影子球 [ 100000 G ]
		set hitembean.item_id = 'I01F'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_gold = 100000
		set hitembean.dark = 15
		call hitem.format(hitembean)
		call hitembean.destroy()
		// 合成
        call hitemMix.newFormula('I01G',1) // 恶魔的灵魂 [ 100000 G ]
		call hitemMix.addFlag('I01G','I01I',1) // 无用的水晶球 [ 100000 G ]
        call hitemMix.addFlag('I01G','I00Y',1) // 恶魔的紫色血浆
    endmethod

    public static method registerItem3 takes nothing returns nothing
        local hItemBean hitembean
        call htime.delTimer(GetExpiredTimer())
        set hitembean = hItemBean.create() // 刺虫之壳 [ 30L ]
		set hitembean.item_id = 'I01O'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 30
		set hitembean.huntRebound = 30
		set hitembean.toughness = 100
		set hitembean.punish = 1000
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 蓄风的叶子 [ 30L ]
		set hitembean.item_id = 'I01P'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 30
		set hitembean.wind = 30
		set hitembean.attackPhysical = 1000
		set hitembean.avoid = 3
		call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 雷神之锤 [ 30L ]
		set hitembean.item_id = 'I01N'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 30
		set hitembean.attackHuntType = "thunder"
		set hitembean.thunder = 20
		set hitembean.attackSpeed = 45
        call hitem.format(hitembean)
		call hitembean.destroy()
		set hitembean = hItemBean.create() // 生命宝珠 [ 30L ]
		set hitembean.item_id = 'I01W'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 30
		set hitembean.life = 5000
        call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 骸骨灵魂 [ 35L ]
		set hitembean.item_id = 'I01Q'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 35
		set hitembean.attackHuntType = "ghost"
		set hitembean.ghost = 20
		set hitembean.dark = 5
		set hitembean.corrosionVal = 3
		set hitembean.corrosionDuring = 3
        call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 否决神杖 [ 40L ]
		set hitembean.item_id = 'I01X'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 40
		set hitembean.int = 185
		set hitembean.unarmOdds = 4.5
		set hitembean.unarmDuring = 2.5
        call hitem.format(hitembean)
		call hitembean.destroy()
        set hitembean = hItemBean.create() // 天神法杖 [ 100L ]
		set hitembean.item_id = 'I022'
        set hitembean.item_type = HITEM_TYPE_FOREVER
		set hitembean.item_overlay = 9
		set hitembean.item_lumber = 100
        set hitembean.silentOdds = 10.0
		set hitembean.unarmOdds = 10.0
		set hitembean.unarmDuring = 2.5
        call hitem.format(hitembean)
		call hitembean.destroy()
    endmethod

    public static method enemyBuilt takes unit mon returns nothing
        local integer uid = GetUnitTypeId(mon)
        call hattr.addKnocking(mon,g_wave*70,0)
        call hattr.addViolence(mon,g_wave*90,0)
        if(uid == 'n017' or uid == 'n01E' or uid == 'n01F' or uid == 'n01Y' or uid == 'n01G')then // 6/7/8/9/10
            call hattrNatural.addWaterOppose(mon,5.0,0)
        elseif(uid == 'n01H')then // 11
            call hattr.addHemophagia(mon,15.0,0)
        elseif(uid == 'n01K')then // 14
            call hattr.addAttackHuntType(mon,"ghost",0)
            call hattrNatural.addGhostOppose(mon,60.0,0)
        elseif(uid == 'n01V')then // 25
            call hattrEffect.addAttackSpeedVal(mon,10.0,0)
            call hattrEffect.addAttackSpeedDuring(mon,3.5,0)
        elseif(uid == 'n01W' or uid == 'n01X')then // 26/27
            call hattr.addAttackHuntType(mon,"water",0)
            call hattrNatural.addWaterOppose(mon,50.0,0)
            call hattrNatural.addFireOppose(mon,75.0,0)
        elseif(uid == 'n03U' or uid == 'n03T' or uid == 'n03Y')then // 31/32/33
            call hattr.addKnocking(mon,7000.0,0)
        elseif(uid == 'n01Z')then // 35
            call hattrEffect.addToxicVal(mon,3.0,0)
            call hattrEffect.addToxicDuring(mon,10.0,0)
        elseif(uid == 'n022' or uid == 'n023' or uid == 'n024')then // 39/40/41
            call hattr.addAttackHuntType(mon,"ice",0)
            call hattrNatural.addIceOppose(mon,50.0,0)
        elseif(uid == 'n02D' or uid == 'n02E')then // 49/50
            call hattr.addKnocking(mon,13000.0,0)
        elseif(uid == 'n02G')then // 52
            call hattrEffect.addSwimOdds(mon,10.0,0)
            call hattrEffect.addSwimDuring(mon,1,0)
        elseif(uid == 'n02K')then // 56
            call hattr.addAttackHuntType(mon,"soil",0)
        elseif(uid == 'n02M' or uid == 'n02O')then // 58/60
            call hattr.addAttackHuntType(mon,"poison",0)
            call hattrNatural.addPoisonOppose(mon,50.0,0)
        elseif(uid == 'n02T')then // 65
            call hattrEffect.addCorrosionVal(mon,0.5,0)
            call hattrEffect.addCorrosionDuring(mon,2.0,0)
        elseif(uid == 'n032' or uid == 'n033')then // 74/75
            call hattr.addAttackHuntType(mon,"poison",0)
        elseif(uid == 'n03A')then // 82
            call hattr.addAttackHuntType(mon,"fire",0)
        elseif(uid == 'n03C' or uid == 'n03D')then // 84/85
            call hattr.addAttackHuntType(mon,"wind",0)
        elseif(uid == 'n03J')then // 91
            call hattr.addAttackHuntType(mon,"light",0)
        elseif(uid == 'n03K')then // 92
            call hattr.addAttackHuntType(mon,"thunder",0)
            call hattrNatural.addThunderOppose(mon,10.0,0)
        elseif(uid == 'n042' or uid == 'n043' or uid == 'n045')then // 103/104/105
            call hattr.addAttackHuntType(mon,"poison",0)
            call hattrNatural.addPoisonOppose(mon,50.0,0)
        elseif(uid == 'n053' or uid == 'n054')then // 106/107
            call hattr.addAttackHuntType(mon,"ghost",0)
            call hattrNatural.addGhostOppose(mon,90.0,0)
            call hattr.addHemophagia(mon,50,0)
        elseif(uid == 'n05D' or uid == 'n05C')then // 114/115
            call hattr.addAttackHuntType(mon,"soil",0)
            call hattrNatural.addSoilOppose(mon,90.0,0)
        endif
    endmethod
    public static method enemyDeadDrop takes unit mon returns nothing
        local integer uid = GetUnitTypeId(mon)
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
            set bean.damage = g_wave * 30
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
            set bean.damage = g_wave * 40
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\DarkSwirl.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physical"
            call hskill.leap(triggerUnit,loc,55,"Objects\\Spawnmodels\\Undead\\ImpaleTargetDust\\ImpaleTargetDust.mdl",150,false,bean)
            call bean.destroy()
		elseif(skillid == 'A060')then // BOSS 旋风女皇 穿梭
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = g_wave * 35
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "Abilities\\Spells\\Other\\Tornado\\TornadoElementalSmall.mdl"
            set bean.huntKind = "attack"
            set bean.huntType = "physicalwind"
            call hskill.shuttleToUnit(triggerUnit,hevent.getTargetUnit(),500,13,30,5,50,null,"attack",'A06M',bean)
            call bean.destroy()
		elseif(skillid == 'A061')then // BOSS 死神 穿梭
			call SetUnitVertexColorBJ( triggerUnit, 100, 100, 100, 75.00 )
			set bean = hAttrHuntBean.create()
            set bean.damage = g_wave * 40
            set bean.fromUnit = triggerUnit
            set bean.huntEff = "war3mapImported\\DarkSwirl.mdl"
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
            call UnitAddAbility(triggerUnit,'A05Q')
            call hmsg.style(hmsg.ttg2Unit(triggerUnit,"BOSS开始发狂！",8,"e04240",0,1.70,40.00),"scale",0,0.15)
            call hattr.addLifeBack(triggerUnit,I2R(g_wave) * 0.006 * hattr.getLife(triggerUnit),9)
            call hattr.addAttackPhysical(triggerUnit,I2R(g_wave) * 6,20)
            call hattr.addAttackMagic(triggerUnit,I2R(g_wave) * 6,20)
            call hattr.addAttackSpeed(triggerUnit,50 + I2R(g_wave) * 2,20)
            call hattr.addMove(triggerUnit,125,0)
            call hattr.addToughness(triggerUnit,I2R(g_wave) * 6,30)
        endif
        if(rand < 7)then
            if(uid == 'n046')then // 5
            elseif(uid == 'n047')then // 10
            elseif(uid == 'n048')then // 15
                call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
            elseif(uid == 'n049')then // 20
                call IssueImmediateOrder( triggerUnit, "stomp" )
            elseif(uid == 'n04A')then // 25
            elseif(uid == 'n04B')then // 30
                call IssueImmediateOrder( triggerUnit, "stomp" )
            elseif(uid == 'n04C')then // 35
                call IssueTargetOrder( triggerUnit, "impale", targetUnit )
            elseif(uid == 'n04K')then // 40
                call IssuePointOrder( triggerUnit, "blizzard", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n04O')then // 45
                call IssueImmediateOrder( triggerUnit, "stomp" )
            elseif(uid == 'n04L')then // 50
                call hattrNatural.addDark(triggerUnit,2.0,10.0)
            elseif(uid == 'n04P')then // 55
            elseif(uid == 'n04N')then // 60
            elseif(uid == 'n04Q')then // 65
                if(GetRandomInt(1,10) < 5)then
                    call IssueImmediateOrder( triggerUnit, "mirrorimage" )
                else
                    call IssueTargetOrder( triggerUnit, "magicleash", targetUnit )
                endif
            elseif(uid == 'n04M')then // 70
                if(GetRandomInt(1,10) < 5)then
                    call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
                else
                    call IssueImmediateOrder( triggerUnit, "roar" )
                endif
            elseif(uid == 'n04J')then // 75
                call IssuePointOrder( triggerUnit, "clusterrockets", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n04D')then // 80
                call IssueTargetOrder( triggerUnit, "forkedlightning", targetUnit )
            elseif(uid == 'n04I')then // 85
                call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
            elseif(uid == 'n04F')then // 90
            elseif(uid == 'n04G')then // 95
            endif
            if(uid == 'n04E')then // 100
                call IssuePointOrder( triggerUnit, "rainoffire", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n04H')then // 105
                call hattrEffect.addBombVal(triggerUnit,135,20)
                if(GetRandomInt(1,10) < 5)then
                    call IssueTargetOrder( triggerUnit, "thunderbolt", targetUnit )
                else
                    call IssueImmediateOrder( triggerUnit, "stomp" )
                endif
            elseif(uid == 'n052')then // 110
                call IssueImmediateOrder( triggerUnit, "whirlwind" )
            elseif(uid == 'n05B')then // 115
               call IssuePointOrder( triggerUnit, "clusterrockets", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            elseif(uid == 'n05H')then // 120
               call IssuePointOrder( triggerUnit, "stampede", GetUnitX(targetUnit), GetUnitY(targetUnit) )
            endif
        endif
        set triggerUnit = null
        set targetUnit = null
        set loc = null
	endmethod

    public static method bossBuilt takes unit mon returns nothing
        local integer uid = GetUnitTypeId(mon)
        call GroupAddUnit(g_crazy_boss,mon)
        if(uid == 'n046')then // 巨龙海龟
            call hattrNatural.addWaterOppose(mon,40.0,0)
            call hattr.addHuntRebound(mon,30.0,0)
        elseif(uid == 'n047')then // 龙虾首领
            call hattrNatural.addWaterOppose(mon,50.0,0)
        elseif(uid == 'n048')then // 飞天食尸鬼
            call hattr.addHemophagia(mon,15.0,0)
            call heffect.toUnit("war3mapImported\\DarkSwirl.mdl",mon,"origin",0.60)
        elseif(uid == 'n049')then // 食人魔统领
            call hattr.addSplit(mon,15.0,0)
        elseif(uid == 'n04A')then // 冰魔法师
            call hattr.addAttackHuntType(mon,"ice",0)
            call hattrNatural.addIceOppose(mon,50.0,0)
            call hattrNatural.addThunderOppose(mon,25.0,0)
            call hattrEffect.addLightningChainOdds(mon,30.0,0)
            call hattrEffect.addLightningChainVal(mon,g_wave*50,0)
            call hattrEffect.addLightningChainQty(mon,4,0)
            call hattrEffect.addFreezeVal(mon,3.0,0)
            call hattrEffect.addFreezeDuring(mon,8.0,0)
            call hattrEffect.addSilentOdds(mon,15.0,0)
            call hattrEffect.addSilentDuring(mon,3.0,0)
        elseif(uid == 'n04B')then // 熊猫Panda
            call hattrEffect.addAttackPhysicalVal(mon,g_wave*6.0,0)
            call hattrEffect.addAttackPhysicalDuring(mon,15.0,0)
            call hattrEffect.addAttackSpeedVal(mon,g_wave*1,0)
            call hattrEffect.addAttackSpeedDuring(mon,15.0,0)
            call hattrEffect.addKnockingVal(mon,g_wave*110,0)
            call hattrEffect.addKnockingDuring(mon,15.0,0)
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
            call hattr.addToughness(mon,200.0,0)
        elseif(uid == 'n04L')then // 疾风隐刺
            call hattr.addAttackHuntType(mon,"dark",0)
            call hattrNatural.addDarkOppose(mon,30.0,0)
            call hattrEffect.addAttackSpeedVal(mon,10.0,0)
            call hattrEffect.addAttackSpeedDuring(mon,6.0,0)
            call hattrEffect.addKnockingVal(mon,2000.0,0)
            call hattrEffect.addKnockingDuring(mon,10.0,0)
            call hattrEffect.addViolenceVal(mon,500.0,0)
            call hattrEffect.addViolenceDuring(mon,10.0,0)
        elseif(uid == 'n04P')then // 潮汐巨人
            call hattr.addAttackHuntType(mon,"water",0)
            call hattrNatural.addWaterOppose(mon,50.0,0)
            call hattrEffect.addSwimOdds(mon,25.0,0)
            call hattrEffect.addSwimDuring(mon,1,0)
            call hattrEffect.addCrackFlyOdds(mon,5.0,0)
        elseif(uid == 'n04N')then // 灭却龙
            call hattr.addAttackHuntType(mon,"poison",0)
            call hattrNatural.addPoison(mon,25.0,0)
            call hattrNatural.addPoisonOppose(mon,80.0,0)
            call hattrEffect.addToxicVal(mon,25.0,0)
            call hattrEffect.addToxicDuring(mon,5.0,0)
            call hattrEffect.addCorrosionVal(mon,3.0,0)
            call hattrEffect.addCorrosionDuring(mon,10.0,0)
        elseif(uid == 'n04Q')then // 猎足蜘蛛
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
            call hattrNatural.addThunderOppose(mon,35.0,0)
            call hattr.addAttackPhysical(mon,200.0,0)
            call hattr.addAttackMagic(mon,200.0,0)
            call hattr.addKnocking(mon,10000.0,0)
            call hattrEffect.addLightningChainOdds(mon,15.0,0)
            call hattrEffect.addLightningChainVal(mon,g_wave*30.0,0)
            call hattrEffect.addLightningChainQty(mon,6,0)
        elseif(uid == 'n04I')then // 旋风女皇
            call hattrNatural.addWindOppose(mon,90.0,0)
            call hattr.addAttackSpeed(mon,100.0,0)
            call hattrEffect.addSwimOdds(mon,22.0,0)
            call hattrEffect.addSwimDuring(mon,0.5,0)
        elseif(uid == 'n04F')then // 斧帝
            call hattr.addHuntRebound(mon,30.0,0)
        elseif(uid == 'n04G')then // 深渊地狱火
            call hattr.addAttackHuntType(mon,"fire",0)
            call hattrNatural.addFireOppose(mon,80.0,0)
            call hattrEffect.addBurnVal(mon,6+g_wave,0)
            call hattrEffect.addBurnDuring(mon,10.0,0)
            call hattrEffect.addToxicVal(mon,5,0)
            call hattrEffect.addToxicDuring(mon,10.0,0)
        endif
        if(uid == 'n04E')then // 毁灭炎尊
            call hattr.addAttackHuntType(mon,"firemetal",0)
            call hattrNatural.addPoisonOppose(mon,90.0,0)
            call hattrNatural.addFireOppose(mon,90.0,0)
            call hattrEffect.addBurnVal(mon,7+g_wave,0)
            call hattrEffect.addBurnDuring(mon,10.0,0)
            call hattrEffect.addToxicVal(mon,4.0,0)
            call hattrEffect.addToxicDuring(mon,10.0,0)
        elseif(uid == 'n04H')then // 赐死鹿
            call hattr.addAttackHuntType(mon,"dark",0)
            call hattrNatural.addDarkOppose(mon,30.0,0)
            call hattrNatural.addPoisonOppose(mon,100.0,0)
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
            call hattrEffect.setBombModel(mon,"war3mapImported\\Arcane Nova.mdl")
        elseif(uid == 'n052')then // 机车人
            call hattr.addAttackHuntType(mon,"metal",0)
            call hattrNatural.addMetalOppose(mon,88.0,0)
            call hattrEffect.addAttackSpeedVal(mon,5,0)
            call hattrEffect.addAttackSpeedDuring(mon,10,0)
            call hattrEffect.addSwimOdds(mon,25.0,0)
            call hattrEffect.addSwimDuring(mon,0.5,0)
        elseif(uid == 'n05B')then // 钻石巨人
            call hattr.addHuntRebound(mon,34.0,0)
            call hattr.addAttackHuntType(mon,"soilmetal",0)
            call hattrNatural.addFireOppose(mon,70.0,0)
            call hattrNatural.addSoilOppose(mon,70.0,0)
            call hattrNatural.addMetalOppose(mon,75.0,0)
            call hattrEffect.addSwimOdds(mon,16.0,0)
            call hattrEffect.addSwimDuring(mon,1.5,0)
        elseif(uid == 'n05H')then // 寒春龙神
            call hattr.addAttackHuntType(mon,"icedragon",0)
            call hattrNatural.addIceOppose(mon,100.0,0)
            call hattrNatural.addDragonOppose(mon,100.0,0)
            call hattrEffect.addAttackSpeedVal(mon,10,0)
            call hattrEffect.addAttackSpeedDuring(mon,5,0)
            call hattrEffect.addSwimOdds(mon,14.0,0)
            call hattrEffect.addSwimDuring(mon,2.0,0)
        endif
        call hevent.onSkillHappen(mon,function thistype.onBossSkillHappen)
        call hevent.onAttack(mon,function thistype.onBossAttack)
    endmethod
    public static method bossDeadDrop takes unit mon returns nothing
        local integer uid = GetUnitTypeId(mon)
        if(uid == 'n046')then // 5
            call hitem.toXY('I00J',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n047')then // 10
            call hitem.toXY('I00J',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n048')then // 15
            call hitem.toXY('I00Z',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n049')then // 20
            call hitem.toXY('I015',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04A')then // 25
            call hitem.toXY('I017',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04B')then // 30
            call hitem.toXY('I010',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04C')then // 35
            call hitem.toXY('I016',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04K')then // 40
            call hitem.toXY('I015',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04O')then // 45
            call hitem.toXY('I00Z',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04L')then // 50
            call hitem.toXY('I01F',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04P')then // 55
            call hitem.toXY('I016',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04N')then // 60
            call hitem.toXY('I01R',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04Q')then // 65
            call hitem.toXY('I01K',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04M')then // 70
            call hitem.toXY('I015',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04J')then // 75
            call hitem.toXY('I01R',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04D')then // 80
            call hitem.toXY('I010',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04I')then // 85
            call hitem.toXY('I01Z',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04F')then // 90
            call hitem.toXY('I010',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04G')then // 95
            call hitem.toXY('I01M',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04E')then // 100
            call hitem.toXY('I019',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n04H')then // 105
            call hitem.toXY('I01K',1,GetUnitX(mon),GetUnitY(mon),120.0)
        elseif(uid == 'n051')then // 110
            call hitem.toXY('I00Z',1,GetUnitX(mon),GetUnitY(mon),120.0)
        endif
    endmethod



    private static method gotoRectSpaceDeg takes unit u,integer lv, real x,real y, real x2,real y2 returns nothing
        local integer i = 0
        if(IsUnitAlly(u, Player(10)) != true)then
            set u = null
            return
        endif
        set i = GetUnitUserData(u) + 1
        if(i >= 5)then
            call SetUnitUserData(u,0)
            if(lv == 4)then
                call IssuePointOrder( u, "attack", GetLocationX(Loc_Ring), GetLocationY(Loc_Ring) )
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

        set g_diff_label[1] = "简单"
        set g_diff_label[2] = "普通"
        set g_diff_label[3] = "地狱"

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
        call thistype.registerHero('H00K',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp",2.00) // t01 暗影猎手
        call thistype.registerHero('H001',HERO_TYPE_AGI,"ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp",2.00) // t01 逸风
        call thistype.registerHero('H00I',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNChaosBlademaster.blp",2.00) // t02 赤血
        call thistype.registerHero('H00N',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp",2.00) // t02 圣骑士
        call thistype.registerHero('H00O',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNArthas.blp",2.00) // t03 魔剑士
        call thistype.registerHero('H00P',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNKeeperOfTheGrove.blp",2.00) // t04 森林老鹿
        call thistype.registerHero('H00Q',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp",2.00) // t05 巫妖
        call thistype.registerHero('H00X',HERO_TYPE_INT,"ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp",2.00) // t06 操火师
        call thistype.registerHero('H00S',HERO_TYPE_AGI,"ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp",2.00) // t10 黑游
        call thistype.registerHero('H00R',HERO_TYPE_STR,"ReplaceableTextures\\CommandButtons\\BTNHeroAlchemist.blp",2.00) // t20 炼金

        call htime.setTimeout(0.70,function thistype.registerItem1)
        call htime.setTimeout(0.75,function thistype.registerItem2)
        call htime.setTimeout(0.80,function thistype.registerItem3)

        call thistype.registerToken()
        call thistype.registerBuilding()
        call thistype.registerGift()

        set g_boss_count = 21
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

        set g_mon_count = 105
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
        
        call thistype.registerSummon('o009',false,"N",1500,1000,    0,0,20,     0,0,0.00) // 帐篷
        call thistype.registerSummon('o00A',true,"N",3000,3000,     0,0,30,     0,0,0.00) // 农场
        call thistype.registerSummon('o00M',true,"N",3000,2000,     0,0,30,     80,0,0.00) // 地穴
        call thistype.registerSummon('o01S',true,"N",3000,2000,     0,0,30,     0,0,0.00) // 月亮井

        call thistype.registerSummon('o00B',false,"D",500,120,      0,0,0,      35,0,1.80) // 农民
        call thistype.registerSummon('o00I',false,"D",500,160,      0,0,0,      50,0,2.30) // 苦力
        call thistype.registerSummon('o00J',false,"D",500,140,      0,0,0,      10,15,1.95) // 小精灵

        call thistype.registerSummon('o008',false,"C",1000,260,     0,0,1,      70,0,1.80) // 民兵
        call thistype.registerSummon('o00E',false,"C",1000,240,     0,0,0,      30,40,1.90) // 血精灵
        call thistype.registerSummon('o00R',false,"C",1000,320,     0,0,1,      90,0,2.30) // 兽人大兵
        call thistype.registerSummon('o00S',false,"C",1000,300,     0,0,1,      80,0,2.20) // 邪恶苦力
        call thistype.registerSummon('o00W',false,"C",1000,280,     300,5,0,    10,60,2.20) // 巨魔巫医
        call thistype.registerSummon('o016',false,"C",1000,290,     300,5,0,    40,35,2.20) // 萨满牛祭司
        call thistype.registerSummon('o01V',false,"C",1000,260,     0,0,0,      70,0,1.90) // 暗夜弓手
        call thistype.registerSummon('o01W',false,"C",1000,280,     0,0,0,      75,0,1.90) // 角鹰弓手
        call thistype.registerSummon('o022',false,"C",1000,270,     0,0,0,      25,50,2.10) // 德鲁伊

        call thistype.registerSummon('o00C',false,"B",2000,700,     0,0,8,      140,0,1.80) // 步兵
        call thistype.registerSummon('o00L',false,"B",2000,520,     400,6,2,    130,0,1.90) // 牧师
        call thistype.registerSummon('o00K',false,"B",2000,600,     0,0,2,      135,0,1.70) // 铁抢手
        call thistype.registerSummon('o00Z',false,"B",2000,550,     0,0,1,      155,0,1.90) // 龙鹰骑士
        call thistype.registerSummon('o017',false,"B",2000,740,     0,0,1,      180,0,2.20) // 灯提白牛
        call thistype.registerSummon('o00T',false,"B",2000,680,     0,0,1,      170,0,2.10) // 狼骑
        call thistype.registerSummon('o00G',false,"B",2000,700,     0,0,0,      150,0,2.40) // 巨魔枪士
        call thistype.registerSummon('o00V',false,"B",2000,800,     0,0,2,      180,0,2.40) // 邪恶兽人大兵
        call thistype.registerSummon('o014',false,"B",2000,600,     0,0,0,      175,0,1.90) // 飞龙骑士
        call thistype.registerSummon('o019',false,"B",2000,660,     0,0,0,      35,135,2.30) // 巫师
        call thistype.registerSummon('o020',false,"B",2000,500,     0,0,0,      70,70,2.00) // 精灵龙
        call thistype.registerSummon('o01Z',false,"B",2000,540,     0,0,1,      105,0,2.20) // 露娜
        call thistype.registerSummon('o01U',false,"B",2000,560,     0,0,1,      130,0,2.10) // 树妖
        call thistype.registerSummon('o023',false,"B",2000,700,     0,0,3,      130,0,1.90) // 熊战德鲁伊
        call thistype.registerSummon('o01G',false,"B",2000,1000,    0,0,4,      190,0,2.90) // 远古树精

        call thistype.registerSummon('o00D',true,"A",4000,1500,     0,0,10,     300,0,1.80) // 剑士
        call thistype.registerSummon('o00N',true,"A",4000,1400,     0,0,6,      340,0,2.20) // 骑士
        call thistype.registerSummon('o00X',true,"A",4000,1200,     0,0,4,      390,0,3.50) // 迫击炮小队
        call thistype.registerSummon('o00P',true,"A",4000,1100,     0,0,3,      20,280,1.80) // 女巫
        call thistype.registerSummon('o00O',true,"A",4000,1200,     0,0,3,      50,260,1.80) // 魔导师
        call thistype.registerSummon('o010',true,"A",4000,1300,     0,0,4,      285,30,1.80) // 狮鹫骑士
        call thistype.registerSummon('o00Y',true,"A",4000,1300,     0,0,4,      280,30,1.80) // 飞行机器
        call thistype.registerSummon('o012',true,"A",4000,1600,     0,0,6,      425,0,3.50) // 坦克部队
        call thistype.registerSummon('o015',true,"A",4000,1200,     0,0,2,      350,0,1.80) // 幻界飞龙
        call thistype.registerSummon('o01H',true,"A",4000,1300,     0,0,2,      360,0,1.90) // 巨魔蝙蝠骑手
        call thistype.registerSummon('o01C',false,"A",4000,1600,     0,0,4,      370,0,2.00) // 科多骑手
        call thistype.registerSummon('o01B',true,"A",4000,1200,     0,0,2,      325,0,2.00) // 骷骨巫长
        call thistype.registerSummon('o018',true,"A",4000,1500,     0,0,5,      380,0,2.40) // 图腾战牛
        call thistype.registerSummon('o00U',true,"A",4000,1300,     0,0,3,      335,0,1.80) // 邪恶狼骑
        call thistype.registerSummon('o01A',true,"A",4000,1300,     0,0,1,      335,0,2.00) // 邪恶巫师
        call thistype.registerSummon('o024',true,"A",4000,1500,     0,0,4,      325,0,2.10) // 猛熊德鲁伊
        call thistype.registerSummon('o025',true,"A",4000,1300,     0,0,2,      160,210,1.90) // 奇美拉
        call thistype.registerSummon('o021',true,"A",4000,1300,     0,0,2,      160,210,1.90) // 黑暗精灵
        call thistype.registerSummon('o01X',true,"A",4000,1400,     0,0,3,      380,0,2.50) // 山岭巨人
        call thistype.registerSummon('o01R',true,"A",4000,1800,     0,0,6,      200,180,2.80) // 秘迹古树
        call thistype.registerSummon('o01J',true,"A",4000,2100,     0,0,6,      390,0,2.80) // 战争古树
        call thistype.registerSummon('o01L',true,"A",4000,1900,     0,0,6,      0,380,2.80) // 智慧古树
        call thistype.registerSummon('o01Q',true,"A",4000,2000,     0,0,6,      240,150,2.80) // 苍风古树

        call thistype.registerSummon('o01Y',true,"S",8000,2800,     0,0,6,      800,0,2.30) // 山岭巨人·战棍
        call thistype.registerSummon('o01D',true,"S",8000,3200,     0,0,8,      780,0,1.90) // 邪恶科多骑手
        call thistype.registerSummon('o00Q',true,"S",12500,2600,    0,0,7,      100,800,1.70) // 寒冰女巫
        call thistype.registerSummon('o013',true,"S",14500,3800,    0,0,9,      530,570,1.60) // 火凤凰
        call thistype.registerSummon('o01E',true,"S",15500,4500,    0,0,12,     1300,0,1.80) // 牛头人酋长
        call thistype.registerSummon('o026',true,"S",17000,3500,    0,0,13,     1550,0,1.50) // 月之女祭司


        call thistype.registerSummonAbility('A04K') // N 地穴 - 尖针
        call thistype.registerSummonAbility('A056') // C 民兵 - 勋章
        call thistype.registerSummonAbility('A04T') // C 血精灵 - 心灵之火
        call thistype.registerSummonAbility('A09B') // C 邪恶苦力 - 奋力
        call thistype.registerSummonAbility('A08A') // C 树人 - 本质
        call thistype.registerSummonAbility('A09C') // C 兽人大兵 - 斧力
        call thistype.registerSummonAbility('A09D') // C 萨满牛祭司 - 净化
        call thistype.registerSummonAbility('A07O') // C 巨魔巫医 - 荼毒
        call thistype.registerSummonAbility('A09E') // C 暗夜弓手 - 穿透
        call thistype.registerSummonAbility('A09F') // C 角鹰弓手 - 俯视穿透
        call thistype.registerSummonAbility('A054') // C 德鲁伊 - 荆棘
        call thistype.registerSummonAbility('A04M') // B 步兵 - 铁壁
        call thistype.registerSummonAbility('A09H') // B 灯提白牛 - 虚灵
        call thistype.registerSummonAbility('A091') // B 飞龙骑士 - 毒标
        call thistype.registerSummonAbility('A04W') // B 精灵龙 - 魔焰
        call thistype.registerSummonAbility('A08V') // B 巨魔枪士 - 丧心病狂
        call thistype.registerSummonAbility('A089') // B 狼骑 - 诱捕
        call thistype.registerSummonAbility('A04Y') // B 龙鹰骑士 - 缚足
        call thistype.registerSummonAbility('A049') // B 露娜 - 月刃
        call thistype.registerSummonAbility('A055') // B 树妖 - 绿枪
        call thistype.registerSummonAbility('A04Q') // B 铁枪手 - 扳机精通
        call thistype.registerSummonAbility('A09G') // B 邪恶兽人大兵 - 狂斧
        call thistype.registerSummonAbility('A09K') // B 熊战德鲁伊 - 咆哮
        call thistype.registerSummonAbility('A053') // B 远古树精 - 投掷
        call thistype.registerSummonAbility('A03V') // B 牧师 - 光导医疗
        call thistype.registerSummonAbility('A07K') // B 巫师 - 邪术
        call thistype.registerSummonAbility('A04U') // A 剑士 - 刃风式
        call thistype.registerSummonAbility('A03O') // A 骑士 - 斩铁式
        call thistype.registerSummonAbility('A07X') // A 飞行机器 - 机关枪
        call thistype.registerSummonAbility('A07V') // A 黑暗精灵 - 魅刃
        call thistype.registerSummonAbility('A07T') // A 幻界飞龙 - 蔽日
        call thistype.registerSummonAbility('A04S') // A 巨魔蝙蝠骑手 - 火焰燃油
        call thistype.registerSummonAbility('A059') // A 骷骨巫长 - 蛊虫
        call thistype.registerSummonAbility('A09L') // A 猛熊德鲁伊 - 猛熊之躯
        call thistype.registerSummonAbility('A09J') // A 魔导师 - 感应
        call thistype.registerSummonAbility('A08G') // A 女巫 - 大焚火
        call thistype.registerSummonAbility('A04P') // A 迫击炮小队 - 黑色火药
        call thistype.registerSummonAbility('A09M') // A 科多骑手 - 吞噬
        call thistype.registerSummonAbility('A058') // A 奇美拉 - 龙息
        call thistype.registerSummonAbility('A052') // A 山岭巨人 - 嘲讽
        call thistype.registerSummonAbility('A08D') // A 狮鹫骑士 - 风暴战锤
        call thistype.registerSummonAbility('A04R') // A 坦克部队 - 烈性炮弹
        call thistype.registerSummonAbility('A051') // A 图腾战牛 - 抨击
        call thistype.registerSummonAbility('A09I') // A 邪恶狼骑 - 掠夺
        call thistype.registerSummonAbility('A07J') // A 邪恶巫师 - 痛苦链
        call thistype.registerSummonAbility('A04I') // A 苍风古树 - 烈风
        call thistype.registerSummonAbility('A05A') // A 秘迹古树 - 秘沼
        call thistype.registerSummonAbility('A08Z') // A 战争古树 - 林撼
        call thistype.registerSummonAbility('A07Y') // A 智慧古树 - 通明
        call thistype.registerSummonAbility('A03T') // S 寒冰女巫 - 冰心魂
        call thistype.registerSummonAbility('A080') // S 寒冰女巫 - 暴风雪
        call thistype.registerSummonAbility('A081') // S 寒冰女巫 - 千里冰封
        call thistype.registerSummonAbility('A08M') // S 火凤凰 - 火鸟
        call thistype.registerSummonAbility('A08N') // S 火凤凰 - 涅磐
        call thistype.registerSummonAbility('A08O') // S 火凤凰 - 展翅
        call thistype.registerSummonAbility('A065') // S 牛头人酋长 - 狂热
        call thistype.registerSummonAbility('A04A') // S 牛头人酋长 - 粉碎
        call thistype.registerSummonAbility('A08T') // S 牛头人酋长 - 心狂
        call thistype.registerSummonAbility('A04B') // S 山岭巨人·战棍 - 过激
        call thistype.registerSummonAbility('A04C') // S 山岭巨人·战棍 - 战棍
        call thistype.registerSummonAbility('A03Y') // S 山岭巨人·战棍 - 大闹一番
        call thistype.registerSummonAbility('A07U') // S 邪恶科多骑手 - 邪殇
        call thistype.registerSummonAbility('A04X') // S 月之女祭司 - 强弓
        call thistype.registerSummonAbility('A050') // S 月之女祭司 - 威吓
        call thistype.registerSummonAbility('A04Z') // S 月之女祭司 - 月光
        

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
