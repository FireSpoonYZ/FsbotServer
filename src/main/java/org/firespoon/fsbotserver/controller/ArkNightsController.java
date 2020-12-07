package org.firespoon.fsbotserver.controller;

import org.firespoon.fsbotserver.model.Agent;
import org.firespoon.fsbotserver.model.Result;
import org.firespoon.fsbotserver.model.ResultFactory;
import org.firespoon.fsbotserver.service.ArkNightsService;
import org.firespoon.fsbotserver.utils.ArkNightsUtils.Tag;
import org.firespoon.fsbotserver.utils.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

@RestController
@RequestMapping("arknights")
public class ArkNightsController {
    private final ArkNightsService service;

    @Autowired
    public ArkNightsController(ArkNightsService service) {
        this.service = service;
    }

    private static class Param {
        final List<Tag> tags;

        public Param(String tag1, String tag2, String tag3, String tag4, String tag5) {
            this.tags = new LinkedList<>();
            this.tags.add(Tag.fromString(tag1));
            this.tags.add(Tag.fromString(tag2));
            this.tags.add(Tag.fromString(tag3));
            this.tags.add(Tag.fromString(tag4));
            this.tags.add(Tag.fromString(tag5));
        }
    }

    @GetMapping("calc")
    public Result<List<Pair<List<Tag>, List<Agent>>>> calculate(Param param) {
        return ResultFactory.success(service.calculate(param.tags));
    }
}
