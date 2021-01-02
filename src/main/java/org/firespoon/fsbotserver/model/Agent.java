package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.firespoon.fsbotserver.utils.ArkNightsUtils.Tag;

import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = false)
public class Agent {
    private final List<Tag> tags;
    private final Integer rarity;
    private final String name;

    public Agent(List<Tag> tags, Integer rarity, String name) {
        this.tags = tags;
        this.rarity = rarity;
        this.name = name;
    }

    public Boolean containsTags(List<Tag> tags) {
        boolean flag = true;
        for (Tag tag : tags) {
            flag = flag && this.tags.contains(tag);
        }
        return flag;
    }

    public static AgentBuilder builder() {
        return new AgentBuilder();
    }

    public static class AgentBuilder {
        private final List<Tag> tags;
        private Integer rarity;
        private String name;

        AgentBuilder() {
            this.tags = new ArrayList<>();
        }

        public AgentBuilder addTag(Tag tag) {
            this.tags.add(tag);
            return this;
        }

        public AgentBuilder setRarity(Integer rarity) {
            this.rarity = rarity;
            return this;
        }

        public AgentBuilder setName(String name) {
            this.name = name;
            return this;
        }

        public Agent build() {
            return new Agent(tags, rarity, name);
        }
    }
}
