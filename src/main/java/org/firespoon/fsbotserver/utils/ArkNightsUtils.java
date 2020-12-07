package org.firespoon.fsbotserver.utils;

import org.firespoon.fsbotserver.model.Agent;

import java.util.LinkedList;
import java.util.List;

public abstract class ArkNightsUtils {
    public enum Tag {
        Novice("新手"),
        Senior("资深干员"),
        SuperSenior("高级资深干员"),
        CloseRange("近战位"),
        LongRange("远程位"),
        Vanguard("先锋干员"),
        Sniper("狙击干员"),
        Healer("医疗干员"),
        Magician("术士干员"),
        Guard("近卫干员"),
        Heavy("重装干员"),
        Auxiliary("辅助干员"),
        SpecialType("特种干员"),
        Heal("治疗"),
        Support("支援"),
        Damage("输出"),
        GroupAttack("群攻"),
        SlowDown("减速"),
        Survival("生存"),
        Protect("防护"),
        Weaken("削弱"),
        Displacement("位移"),
        Control("控场"),
        Burst("爆发"),
        Summon("召唤"),
        QuicklyRebirth("快速复活"),
        CostRecover("费用回复"),
        SupportMachine("支援机械");

        private final String str;

        Tag(String str) {
            this.str = str;
        }

        @Override
        public String toString() {
            return this.str;
        }

        public static Tag fromString(String str) {
            for (Tag tag : Tag.values()) {
                if (tag.str.equals(str)) {
                    return tag;
                }
            }
            return null;
        }
    }

    public static final List<Agent> agents = new LinkedList<>();

    private static void addAgent(Agent agent) {
        agents.add(agent);
    }

    static {
        addAgent(Agent.builder()
                .setName("推进之王")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("闪灵")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Support)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("夜莺")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Support)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("伊芙利特")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.GroupAttack)
                .addTag(Tag.Weaken)
                .build());

        addAgent(Agent.builder()
                .setName("能天使")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("银灰")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Support)
                .build());

        addAgent(Agent.builder()
                .setName("星熊")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("塞雷娅")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Heal)
                .addTag(Tag.Protect)
                .addTag(Tag.Support)
                .build());

        addAgent(Agent.builder()
                .setName("斯卡蒂")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("陈")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Burst)
                .build());

        addAgent(Agent.builder()
                .setName("黑")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("赫拉格")
                .setRarity(6)
                .addTag(Tag.SuperSenior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("德克萨斯")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Control)
                .addTag(Tag.CostRecover)
                .build());

        addAgent(Agent.builder()
                .setName("凛冬")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Support)
                .addTag(Tag.CostRecover)
                .build());

        addAgent(Agent.builder()
                .setName("白面鸮")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Support)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("赫默")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("华法琳")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Support)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("红")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.QuicklyRebirth)
                .addTag(Tag.Control)
                .build());

        addAgent(Agent.builder()
                .setName("狮蝎")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("崖心")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.SpecialType)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Displacement)
                .build());

        addAgent(Agent.builder()
                .setName("食铁兽")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("普罗旺斯")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("蓝毒")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("守林人")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Burst)
                .build());

        addAgent(Agent.builder()
                .setName("陨星")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Weaken)
                .build());

        addAgent(Agent.builder()
                .setName("白金")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("初雪")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Auxiliary)
                .addTag(Tag.LongRange)
                .addTag(Tag.Weaken)
                .build());

        addAgent(Agent.builder()
                .setName("真理")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Auxiliary)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("梅尔")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Auxiliary)
                .addTag(Tag.LongRange)
                .addTag(Tag.Summon)
                .addTag(Tag.Control)
                .build());

        addAgent(Agent.builder()
                .setName("幽灵鲨")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Survival)
                .addTag(Tag.GroupAttack)
                .build());

        addAgent(Agent.builder()
                .setName("因陀罗")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Survival)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("临光")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("雷蛇")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("火神")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("可颂")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .addTag(Tag.Displacement)
                .build());

        addAgent(Agent.builder()
                .setName("夜魔")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Heal)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("诗怀雅")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Support)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("真理")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Auxiliary)
                .addTag(Tag.LongRange)
                .addTag(Tag.Control)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("星极")
                .setRarity(5)
                .addTag(Tag.Senior)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("末药")
                .setRarity(4)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("调香师")
                .setRarity(4)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("夜烟")
                .setRarity(4)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.Weaken)
                .build());

        addAgent(Agent.builder()
                .setName("远山")
                .setRarity(4)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.GroupAttack)
                .build());

        addAgent(Agent.builder()
                .setName("白雪")
                .setRarity(4)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.GroupAttack)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("流星")
                .setRarity(4)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Weaken)
                .build());

        addAgent(Agent.builder()
                .setName("杰西卡")
                .setRarity(4)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("地灵")
                .setRarity(4)
                .addTag(Tag.Auxiliary)
                .addTag(Tag.LongRange)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("格雷伊")
                .setRarity(4)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.SlowDown)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("苏苏洛")
                .setRarity(4)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("清道夫")
                .setRarity(4)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("红豆")
                .setRarity(4)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("砾")
                .setRarity(4)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.QuicklyRebirth)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("暗索")
                .setRarity(4)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Displacement)
                .build());

        addAgent(Agent.builder()
                .setName("阿消")
                .setRarity(4)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Displacement)
                .build());

        addAgent(Agent.builder()
                .setName("杜宾")
                .setRarity(4)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Support)
                .build());

        addAgent(Agent.builder()
                .setName("艾丝黛尔")
                .setRarity(4)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.GroupAttack)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("慕斯")
                .setRarity(4)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("霜叶")
                .setRarity(4)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("缠丸")
                .setRarity(4)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("蛇屠箱")
                .setRarity(4)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("古米")
                .setRarity(4)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("角峰")
                .setRarity(4)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("猎蜂")
                .setRarity(4)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("桃金娘")
                .setRarity(4)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("芙蓉")
                .setRarity(3)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("安塞尔")
                .setRarity(3)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("炎熔")
                .setRarity(3)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.GroupAttack)
                .build());

        addAgent(Agent.builder()
                .setName("史都华德")
                .setRarity(3)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("克洛斯")
                .setRarity(3)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("安德切尔")
                .setRarity(3)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("梓兰")
                .setRarity(3)
                .addTag(Tag.Auxiliary)
                .addTag(Tag.LongRange)
                .addTag(Tag.SlowDown)
                .build());

        addAgent(Agent.builder()
                .setName("空爆")
                .setRarity(3)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .addTag(Tag.GroupAttack)
                .build());

        addAgent(Agent.builder()
                .setName("杜林")
                .setRarity(2)
                .addTag(Tag.Novice)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .build());

        addAgent(Agent.builder()
                .setName("12F")
                .setRarity(2)
                .addTag(Tag.Novice)
                .addTag(Tag.Magician)
                .addTag(Tag.LongRange)
                .build());

        addAgent(Agent.builder()
                .setName("巡林者")
                .setRarity(2)
                .addTag(Tag.Novice)
                .addTag(Tag.Sniper)
                .addTag(Tag.LongRange)
                .build());

        addAgent(Agent.builder()
                .setName("Lancet-2")
                .setRarity(1)
                .addTag(Tag.SupportMachine)
                .addTag(Tag.Healer)
                .addTag(Tag.LongRange)
                .addTag(Tag.Heal)
                .build());

        addAgent(Agent.builder()
                .setName("芬")
                .setRarity(3)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .build());

        addAgent(Agent.builder()
                .setName("香草")
                .setRarity(3)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .build());

        addAgent(Agent.builder()
                .setName("翎羽")
                .setRarity(3)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.CostRecover)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("玫兰莎")
                .setRarity(3)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("月见夜")
                .setRarity(3)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Damage)
                .build());

        addAgent(Agent.builder()
                .setName("泡普卡")
                .setRarity(3)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.GroupAttack)
                .addTag(Tag.Survival)
                .build());

        addAgent(Agent.builder()
                .setName("米格鲁")
                .setRarity(3)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("斑点")
                .setRarity(3)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Protect)
                .build());

        addAgent(Agent.builder()
                .setName("夜刀")
                .setRarity(2)
                .addTag(Tag.Novice)
                .addTag(Tag.Vanguard)
                .addTag(Tag.CloseRange)
                .build());

        addAgent(Agent.builder()
                .setName("黑角")
                .setRarity(2)
                .addTag(Tag.Novice)
                .addTag(Tag.Heavy)
                .addTag(Tag.CloseRange)
                .build());

        addAgent(Agent.builder()
                .setName("Castle-3")
                .setRarity(1)
                .addTag(Tag.SupportMachine)
                .addTag(Tag.Guard)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Support)
                .build());

        addAgent(Agent.builder()
                .setName("THRM-EX")
                .setRarity(1)
                .addTag(Tag.SupportMachine)
                .addTag(Tag.SpecialType)
                .addTag(Tag.CloseRange)
                .addTag(Tag.Burst)
                .build());
    }
}
