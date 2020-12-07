package org.firespoon.fsbotserver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AopTestController {
    private final Test test;

    @Autowired
    public AopTestController(Test test) {
        this.test = test;
    }

    @RequestMapping("test")
    public String test() {
        String str = "test";
        test.test();
        return str;
    }

    @Component
    public static class Test {
        public void test() {
            System.out.println("test");
        }
    }
}
