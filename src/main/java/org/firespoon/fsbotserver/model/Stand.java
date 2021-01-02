package org.firespoon.fsbotserver.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@EqualsAndHashCode(callSuper = false)
@Table(name="stand")
public class Stand {
    @Column(name = "id")
    @Id
    private Integer id;

    @Column(name = "english_name")
    private String englishName;

    @Column(name = "name")
    private String name;

    @Column(name = "owner")
    private String owner;

    @Column(name = "ability")
    private String ability;

    @Column(name = "power")
    private String power;

    @Column(name = "speed")
    private String speed;

    @Column(name = "range")
    private String range;

    @Column(name = "lasting")
    private String lasting;

    @Column(name = "precision")
    private String precision;

    @Column(name = "growth")
    private String growth;
}
