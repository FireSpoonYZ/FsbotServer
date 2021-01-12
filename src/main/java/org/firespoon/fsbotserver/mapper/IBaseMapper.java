package org.firespoon.fsbotserver.mapper;

import tk.mybatis.mapper.common.*;


public interface IBaseMapper<T> extends BaseMapper<T>, MySqlMapper<T>, IdsMapper<T>, ConditionMapper<T>, ExampleMapper<T> {
}
