require('scripts.class')
require('scripts.game.battle.battlecontext')
require('scripts.game.battle.pokemonentityinbattle')
require('scripts.game.type')

DamageContext = class()
function DamageContext:__init__(battleContext, source, target, damage, damageType)
    assert(instanceof(battleContext, BattleContext))
    assert(instanceof(source, PokemonEntityInBattle))
    assert(instanceof(target, PokemonEntityInBattle))
    assert(type(damage) == 'number')
    assert(damage > 0)
    assert(instanceof(damageType, Type))

    self.battleContext = battleContext
    self.source = source
    self.target = target
    self.damage = damage
    self.type = damageType
end

function DamageContext:execute()
    local eventBus = self.battleContext.eventBus

    local bdEvent = Event('BeforeDamageEvent',
            {
                context = self.battleContext,
                source = self.source,
                target = self.target,
                damage = self.damage,
                type = self.type
            }
    )
    eventBus:publish(bdEvent)

    local hp = bdEvent.target.hp
    if bdEvent.damage > hp then
        bdEvent.damage = hp
    elseif bdEvent.damage < 0 then
        bdEvent.damage = 0
    end

    bdEvent.damage = math.floor(bdEvent.damage)
    bdEvent.target.hp = bdEvent.target.hp - bdEvent.damage

    eventBus:publish(Event('AfterDamageEvent',
            {
                context = bdEvent.battleContext,
                source = bdEvent.source,
                target = bdEvent.target,
                damage = bdEvent.damage,
                type = bdEvent.type
            }
    ))

    if self.target.hp == 0 then
        eventBus.publish(Event('DieEvent', {
            damageContext = self
        }))
    end
end
