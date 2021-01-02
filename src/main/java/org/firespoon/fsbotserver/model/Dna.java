package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@EqualsAndHashCode(callSuper = false)
@Table(name="dna")
public class Dna {
    @Column(name = "id")
    @Id
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "rank")
    private Integer rank;
}
