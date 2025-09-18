package com.springmvc.model;
 
import org.hibernate.SessionFactory;
 
public class TestHibernate {
 
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        SessionFactory sessionfactory = HibernateConnection.doHibernateConnection();
 
        System.out.println(sessionfactory);
    }
 
}