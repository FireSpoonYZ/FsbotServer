package org.firespoon.fsbotserver.controller;

import org.firespoon.fsbotserver.model.Record;
import org.firespoon.fsbotserver.model.Result;
import org.firespoon.fsbotserver.model.ResultFactory;
import org.firespoon.fsbotserver.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("record")
public class RecordController {
    private final RecordService service;

    @Autowired
    public RecordController(RecordService service) {
        this.service = service;
    }

    @GetMapping("list")
    public Result<List<Record>> list(
            @RequestParam("owner_id") Long ownerId
    ) {
        return ResultFactory.success(service.list(ownerId));
    }

    @PostMapping("save")
    public Result<String> save(
            @RequestParam("owner_id") Long ownerId,
            String key,
            String value
    ) {
        Integer res = service.save(ownerId, key, value);
        if (res == 0) {
            return ResultFactory.fail("保存失败！");
        } else {
            return ResultFactory.success("保存成功");
        }
    }

    @GetMapping("load")
    public Result<String> load(
            @RequestParam("owner_id") Long ownerId,
            String key
    ) {
        String res = service.load(ownerId, key);
        if (res == null) {
            return ResultFactory.fail("未找到对应的记录");
        } else {
            return ResultFactory.success(res);
        }
    }

    @DeleteMapping("delete")
    public Result<String> delete(
            @RequestParam("owner_id") Long ownerId,
            String key
    ) {
        Integer res = service.delete(ownerId, key);
        if (res == 0) {
            return ResultFactory.fail("删除失败");
        } else {
            return ResultFactory.success("删除成功");
        }
    }
}
