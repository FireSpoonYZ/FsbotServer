require('scripts.game.talent.talent')
require('scripts.game.type')

Talents = {}
local temp1 = Talent('草炮')
temp1:addEffect(Effect('BeforeSkillDamageEvent',
        function(owner, event)
            if owner == event.source and event.type == Type.grass then
                --event.otherBonus = event.otherBonus * 2
            end
        end)
)
Talents.temp1 = temp1

local temp2 = Talent('根源防御')
temp2:addEffect(
        'BeforeDamageEvent',
        function(owner, event)
            if owner == event.target then
                --event.damage = event.damage / 2
            end
        end
)

Talents.temp2 = temp2
