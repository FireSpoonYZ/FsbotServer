package org.firespoon.fsbotserver.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AopTestAspect {
    @Pointcut("execution(public * org.firespoon.fsbotserver.controller.AopTestController.Test.*(..))")
    public void aspect() {}

    @Before("aspect()")
    public void test1() {
        System.out.println("calling..");
    }

    @After("aspect()")
    public void test2() {
        System.out.println("called..");
    }
}
