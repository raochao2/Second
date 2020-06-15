package com.demo2.entity;

import java.util.ArrayList;
import java.util.List;
//List集合里面存放的是对象的地址。
public class Demotest {
    public static void main(String[] args) {
        List<Type> list=new ArrayList<Type>();
        Type t=new Type();
        t.setName("张三");
        list.add(t); //将一个对象多次存放到集合中
        list.add(t); //将一个对象多次存放到集合中
        list.add(t);  //将一个对象多次存放到集合中
        list.get(0).setName("李四");
        System.out.println(list.get(2).getName());
    }
}
