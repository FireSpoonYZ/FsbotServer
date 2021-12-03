package org.firespoon.fsbotserver.controller;

import org.firespoon.fsbotserver.model.CheckResult;
import org.firespoon.fsbotserver.model.CocResult;
import org.firespoon.fsbotserver.model.Result;
import org.firespoon.fsbotserver.model.ResultFactory;
import org.firespoon.fsbotserver.service.DndService;
import org.firespoon.fsbotserver.utils.Ensure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("dnd")
public class DndController {
    private final DndService service;

    @Autowired
    public DndController(DndService service) {
        this.service = service;
    }

    @GetMapping("dnd")
    public Result<List<List<Integer>>> dnd(
            @RequestParam(value = "time", required = false) Integer time
    ) {
        if (time == null) {
            time = 1;
        }
        List<List<Integer>> result = service.dnd(time);
        return ResultFactory.success(result);
    }
}
