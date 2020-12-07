package org.firespoon.fsbotserver.service;

import org.firespoon.fsbotserver.model.Agent;
import org.firespoon.fsbotserver.utils.ArkNightsUtils;
import org.firespoon.fsbotserver.utils.ArkNightsUtils.Tag;
import org.firespoon.fsbotserver.utils.Pair;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

@Service
public class ArkNightsService {
    public List<Pair<List<Tag>, List<Agent>>> calculate(List<Tag> tags) {
        List<Pair<List<Tag>, List<Agent>>> res = new LinkedList<>();

        int size = tags.size();
        for (int i = 1; i < 1 << size; ++i) {
            int seed = i;
            List<Tag> args = new LinkedList<>();
            for (Tag tag : tags) {
                if ((seed & 1) == 1) {
                    args.add(tag);
                }
                seed >>= 1;
            }

            List<Agent> agents = getAgents(args);
            if (!agents.isEmpty()) {
                boolean flag = true;
                for (Agent agent : agents) {
                    Integer rarity = agent.getRarity();
                    if (rarity == 2 || rarity == 3) {
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    Pair<List<Tag>, List<Agent>> pair = new Pair<>(args, agents);
                    res.add(pair);
                }
            }
        }

        res.sort((t1, t2) -> {
            int minRarity1 = 7;
            for (Agent agent : t1.getSecond()) {
                int rarity = agent.getRarity();
                if (minRarity1 > rarity) {
                    minRarity1 = rarity;
                }
            }
            int minRarity2 = 7;
            for (Agent agent : t2.getSecond()) {
                int rarity = agent.getRarity();
                if (minRarity2 > rarity) {
                    minRarity2 = rarity;
                }
            }
            return minRarity2 - minRarity1;
        });

        return res;
    }

    public List<Agent> getAgents(List<Tag> tags) {
        List<Agent> res = new LinkedList<>();
        for (Agent agent : ArkNightsUtils.agents) {
            if ((agent.getRarity() != 6 || tags.contains(Tag.SuperSenior))
                    && agent.containsTags(tags)) {
                res.add(agent);
            }
        }
        return res;
    }
}
