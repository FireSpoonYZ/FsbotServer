require('scripts.utils.class')
require('scripts.game.Type')
require('scripts.game.battle.SkillContext')
require('scripts.game.battle.DamageContext')
require('scripts.event.event')
require('scripts.game.battle.SkillDamageContext')

DamageComponent = class()
function DamageComponent:__init(power, damageTypes, physical, ctLevel)
    assert(type(power) == 'number')
    assert(power > 0)
    if not instanceof(damageTypes, Type) then
        assert(instanceof(damageTypes, List))
        damageTypes:foreach(function(e)
            assert(instanceof(e, Type))
        end)
    end
    assert(type(physical) == 'boolean')
    assert(type(ctLevel) == 'number' or ctLevel == nil)

    self.power = power
    if instanceof(damageTypes, Type) then
        self.damageTypes = { damageTypes }
    else
        self.damageTypes = damageTypes
    end
    self.physical = physical
    self.ctLevel = ctLevel or 0
end

function DamageComponent:execute(context)
    context.targets:foreach(function(target)
        SkillDamageContext(
                context.battleContext,
                context.actor,
                target,
                self
        ):execute()
    end)
end
