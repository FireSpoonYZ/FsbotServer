require('scripts.game.skill.skill')
require('scripts.game.skill.damagecomponent')

Skills = {}
Skills.HeatWave = Skill('热风')
Skills.HeatWave:addComponent(DamageComponent(95, Type.fire, false))

Skills.EnergyBall = Skill('能量球')
Skills.EnergyBall:addComponent(DamageComponent(90, Type.grass, false))
