package org.firespoon.fsbotserver.controller;

import org.firespoon.fsbotserver.model.DiceResult;
import org.firespoon.fsbotserver.model.Result;
import org.firespoon.fsbotserver.model.ResultFactory;
import org.firespoon.fsbotserver.service.DiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("dice")
public class DiceController {
    private final DiceService service;

    @Autowired
    public DiceController(DiceService service) {
        this.service = service;
    }

    @GetMapping("dice")
    public Result<List<DiceResult>> dice(
            @RequestParam("dice_exp") String diceExp
    ) {
        List<DiceResult> res = service.multiple_dice(diceExp);
        return ResultFactory.success(res);
    }
}
