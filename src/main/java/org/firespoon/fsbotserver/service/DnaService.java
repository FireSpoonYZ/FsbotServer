package org.firespoon.fsbotserver.service;

import org.firespoon.fsbotserver.mapper.DnaMapper;
import org.firespoon.fsbotserver.model.Dna;
import org.firespoon.fsbotserver.utils.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class DnaService {
    private final DnaMapper mapper;

    @Autowired
    public DnaService(DnaMapper mapper) {
        this.mapper = mapper;
    }

    public List<Dna> random() {
        Integer[] time = new Integer[]{0, 0, 0, 0, 0, 0};
        int[] weight = new int[]{0, 3, 7, 10, 30, 50};
        for (int i = 0; i < 10; ++i) {
            int rnd = RandomUtils.random(1, 100);
            for (int rank = 1; rank <= 5; ++rank) {
                rnd -= weight[rank];
                if (rnd <= 0) {
                    time[rank]++;
                    break;
                }
            }
        }
        List<Dna> result = new LinkedList<>();
        for (int i = 1; i <= 5; ++i) {
            Dna param = new Dna();
            param.setRank(i);
            List<Dna> res = mapper.select(param);
            result.addAll(res.subList(0, time[i]));
        }
        return result;
    }
}
