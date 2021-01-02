package org.firespoon.fsbotserver.service;

import org.firespoon.fsbotserver.mapper.StandMapper;
import org.firespoon.fsbotserver.model.Stand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class StandService {
    private final StandMapper mapper;

    @Autowired
    public StandService(StandMapper mapper) {
        this.mapper = mapper;
    }

    public List<Stand> random(Integer time) {
        List<Stand> standList = mapper.selectAll();
        Collections.shuffle(standList);
        return standList.subList(0, time);
    }
}
