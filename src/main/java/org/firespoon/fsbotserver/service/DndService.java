package org.firespoon.fsbotserver.service;

import org.firespoon.fsbotserver.mapper.CurrentCardMapper;
import org.firespoon.fsbotserver.model.*;
import org.firespoon.fsbotserver.utils.Ensure;
import org.firespoon.fsbotserver.utils.MapperUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DndService {
    private final DiceService diceService;

    @Autowired
    public DndService(DiceService diceService) {
        this.diceService = diceService;
    }

    public List<List<Integer>> dnd(Integer time) {
        List<List<Integer>> result = new LinkedList<>();
        for (int i = 0; i < time; ++i) {
            List<Integer> card = new LinkedList<>();
            for (int j = 0; j < 6; ++j) {
                List<Integer> single = new ArrayList<>();
                for (int k = 0; k < 4; ++k) {
                    single.add(diceService.dice("1d6").getRes());
                }
                Collections.sort(single);
                Integer res = single.get(1) + single.get(2) + single.get(3);
                card.add(res);
            }
            result.add(card);
        }
        return result;
    }
}
