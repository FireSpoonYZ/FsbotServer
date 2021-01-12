package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@EqualsAndHashCode(callSuper = false)
@Table(name="record")
public class Record {
    @Column(name = "id")
    @Id
    private Integer id;

    @Column(name = "owner_id")
    private Long ownerId;

    @Column(name = "key")
    private String key;

    @Column(name = "value")
    private String value;
}
