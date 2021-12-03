package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.type.JdbcType;
import org.firespoon.fsbotserver.handler.CardPropertiesJsonTypeHandler;
import tk.mybatis.mapper.annotation.ColumnType;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Map;

@Data
@EqualsAndHashCode(callSuper = false)
@Table(name = "dnd_card")
public class DndCard {
    @Column(name = "id")
    @Id
    private Long id;
    
    @Column(name = "owner_id")
    private Long ownerId;

    @Column(name = "name")
    private String name;

    @ColumnType(
            typeHandler = CardPropertiesJsonTypeHandler.class,
            jdbcType = JdbcType.LONGNVARCHAR,
            column = "properties_json"
    )
    private Map<String, Integer> properties;
}
