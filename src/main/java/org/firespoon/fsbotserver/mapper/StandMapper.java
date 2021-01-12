package org.firespoon.fsbotserver.mapper;

import org.firespoon.fsbotserver.model.Stand;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StandMapper extends IBaseMapper<Stand> {
    //List<Stand> random(Integer time);
}
