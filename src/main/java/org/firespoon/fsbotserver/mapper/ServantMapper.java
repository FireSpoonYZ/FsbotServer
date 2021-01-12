package org.firespoon.fsbotserver.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.firespoon.fsbotserver.model.Servant;

@Mapper
public interface ServantMapper extends IBaseMapper<Servant> {
    //List<Servant> selectNameLike(String name);
}
