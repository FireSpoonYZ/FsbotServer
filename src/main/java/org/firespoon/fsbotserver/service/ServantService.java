package org.firespoon.fsbotserver.service;

import org.firespoon.fsbotserver.mapper.ServantMapper;
import org.firespoon.fsbotserver.model.Servant;
import org.firespoon.fsbotserver.utils.ServantUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ServantService {
    private final ServantMapper mapper;

    @Autowired
    public ServantService(ServantMapper mapper) {
        this.mapper = mapper;
    }

    public List<Servant> random(
            Integer time,
            List<String> clazzList,
            Long userId,
            String command
    ) {
        List<Servant> servants;
        if (!clazzList.isEmpty()) {
            Example example = new Example(Servant.class);
            Example.Criteria criteria = example.createCriteria();
            for (String clazz: clazzList) {
                criteria.orEqualTo("clazz", clazz);
            }

            servants = mapper.selectByExample(example);
        } else {
            servants = mapper.selectAll();
        }

        if (command != null && userId != null) {
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = formatter.format(date);
            command = command.replaceAll("(今日)|(每日)", dateString);
            String seedStr = String.format("%s_%s", command, userId);
            int seed = seedStr.hashCode();
            Random random = new Random(seed);
            Collections.shuffle(servants, random);
        } else {
            Collections.shuffle(servants);
        }

        if (time > servants.size()) {
            time = servants.size();
        }
        return servants.subList(0, time);
    }

    public Integer delete(String name, String clazz) {
        clazz = ServantUtils.toHump(clazz);
        Servant servant = new Servant();
        servant.setName(name);
        servant.setClazz(clazz);
        return mapper.delete(servant);
    }

    public Integer save(String name, String clazz) {
        clazz = ServantUtils.toHump(clazz);
        Servant servant = new Servant();
        servant.setName(name);
        servant.setClazz(clazz);
        return mapper.insert(servant);
    }

    public List<Servant> randomHassan(Integer time) {
        Random random = new Random();
        int num = random.nextInt() % 100;

        String name;
        if (0 <= num && num <= 2) {
            name = "狂信徒";
        } else if (3 <= num && num <= 5) {
            name = "初代哈桑";
        } else {
            name = "哈桑";
        }

        Example example = new Example(Servant.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("name", name);
        List<Servant> hassans = mapper.selectByExample(example);

        Collections.shuffle(hassans, random);
        return hassans.subList(0, time);
    }
}
