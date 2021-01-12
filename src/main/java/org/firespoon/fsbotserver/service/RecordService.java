package org.firespoon.fsbotserver.service;

import org.firespoon.fsbotserver.mapper.RecordMapper;
import org.firespoon.fsbotserver.model.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class RecordService {
    private final RecordMapper mapper;

    @Autowired
    public RecordService(RecordMapper mapper) {
        this.mapper = mapper;
    }

    public List<Record> list(Long ownerId) {
        Record param = new Record();
        param.setOwnerId(ownerId);
        return mapper.select(param);
    }

    public Integer save(Long ownerId, String key, String value) {
        Record param = new Record();
        param.setOwnerId(ownerId);
        param.setKey(key);
        List<Record> res = mapper.select(param);
        if (res.isEmpty()) {
            param.setValue(value);
            return mapper.insert(param);
        } else {
            Record record = res.get(0);
            record.setValue(value);
            return mapper.updateByPrimaryKey(record);
        }
    }

    public String load(Long ownerId, String key) {
        Record param = new Record();
        param.setOwnerId(ownerId);
        param.setKey(key);
        List<Record> res = mapper.select(param);
        if (res.isEmpty()) {
            return null;
        } else {
            return res.get(0).getValue();
        }
    }

    public Integer delete(Long ownerId, String key) {
        Record param = new Record();
        param.setOwnerId(ownerId);
        param.setKey(key);
        return mapper.delete(param);
    }
}
