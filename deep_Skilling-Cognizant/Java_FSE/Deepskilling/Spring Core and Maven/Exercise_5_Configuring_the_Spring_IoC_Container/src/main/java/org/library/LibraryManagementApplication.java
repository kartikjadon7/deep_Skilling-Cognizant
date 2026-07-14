package org.library;

import org.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {

    public static void main(String[] args) {

        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        System.out.println("Spring IoC Container Initialized Successfully");

        BookService service = context.getBean("bookService", BookService.class);

        service.addBook();
    }
}