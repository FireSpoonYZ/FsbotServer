package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@EqualsAndHashCode(callSuper = false)
@Table(name="servant")
public class Servant {
    @Column(name = "id")
    @Id
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "clazz")
    private String clazz;
}
