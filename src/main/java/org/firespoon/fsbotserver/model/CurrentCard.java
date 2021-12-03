package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.JdbcType;
import org.firespoon.fsbotserver.handler.CurrentCardPropertiesJsonTypeHandler;
import tk.mybatis.mapper.annotation.ColumnType;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Map;

@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Table(name="current_card")
public class CurrentCard {
    @Column(name = "id")
    @Id
    private Long id;

    @Column(name = "place_id")
    private Long placeId;

    @Column(name = "owner_id")
    private Long ownerId;

    @ColumnType(
            typeHandler = CurrentCardPropertiesJsonTypeHandler.class,
            jdbcType = JdbcType.LONGNVARCHAR,
            column = "properties_json"
    )
    private Map<String, Integer> properties;

    public CurrentCard(Card card, Long placeId) {
        this.placeId = placeId;
        this.ownerId = card.getOwnerId();
        this.properties = card.getProperties();
    }
}
