require('scripts.utils.class')
require('scripts.game.battle.BattleContext')
require('scripts.game.battle.PokemonEntityInBattle')
require('scripts.game.Type')

DamageContext = class()
function DamageContext:__init(battleContext, source, target, damage, damageTypes)
    assert(instanceof(battleContext, BattleContext))
    assert(instanceof(source, PokemonEntityInBattle))
    assert(instanceof(target, PokemonEntityInBattle))
    assert(type(damage) == 'number')
    assert(damage > 0)
    if not instanceof(damageTypes, Type) then
        assert(type(damageTypes) == 'table')
        for _, v in pairs(damageTypes) do
            assert(instanceof(v, Type))
        end
    end

    self.battleContext = battleContext
    self.source = source
    self.target = target
    self.damage = damage
    self.damageTypes = damageTypes
end

function DamageContext:execute()
    local eventBus = self.battleContext.eventBus

    eventBus:publish(Event('BeforeDamageEvent', self))

    local hp = self.target.hp
    if self.damage > hp then
        self.damage = hp
    elseif self.damage < 0 then
        self.damage = 0
    end

    self.damage = math.floor(self.damage)
    self.target.hp = self.target.hp - self.damage

    local message = self.source.pokemonEntity.name ..
            " 对 " ..
            self.target.pokemonEntity.name ..
            " 造成了 " ..
            self.damage ..
            " 点伤害"
    self.battleContext.displayer:pushMessage(message)

    eventBus:publish(Event('AfterDamageEvent', self))

    if self.target.hp == 0 then
        self.target.pokemonEntity.dying = true
        eventBus:publish(Event('DieEvent', {
            damageContext = self
        }))
    end
end
