package org.firespoon.fsbotserver.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.firespoon.fsbotserver.model.Dna;

@Mapper
public interface DnaMapper extends IBaseMapper<Dna> {
    //List<Dna> draw(Integer[] time);
}
