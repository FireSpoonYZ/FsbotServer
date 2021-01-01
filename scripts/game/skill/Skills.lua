require('scripts.game.skill.Skill')
require('scripts.game.skill.DamageComponent')
require('scripts.game.skill.Component')

Skills = {}
Skills.HeatWave = Skill('热风')
Skills.HeatWave:addComponent(DamageComponent(95, Type.fire, false))

Skills.EnergyBall = Skill('能量球')
Skills.EnergyBall:addComponent(DamageComponent(90, Type.grass, false))

Skills.WaterSwitch = Skill('波浪替换', -1)
Skills.WaterSwitch:addComponent(DamageComponent(50, Type.water, false))
Skills.WaterSwitch:addComponent(Component(function(context)
    local actor = context.actor
    local battleContext = context.battleContext
    local side = actor.side
    local pos = battleContext.stage[side]:indexOf(actor)
    battleContext:switch(side, pos, 1)
end
))
