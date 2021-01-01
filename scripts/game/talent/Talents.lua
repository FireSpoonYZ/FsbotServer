require('scripts.game.talent.Talent')
require('scripts.game.Type')

Talents = {}
Talents.empty = Talent('无天赋')

local temp1 = Talent('魅惑之心')
temp1:addEffect(
        Effect('EntityComeOnStageEvent',
                function(owner, event)
                    if owner == event.entity then
                        local context = event.battleContext
                        local anotherSide = context:anotherSide(owner)
                        context.stage[anotherSide]:foreach(function(entity)
                            entity:propertyStatUp('spAtk', -1)
                        end)
                    end
                end)
)
Talents.temp1 = temp1
