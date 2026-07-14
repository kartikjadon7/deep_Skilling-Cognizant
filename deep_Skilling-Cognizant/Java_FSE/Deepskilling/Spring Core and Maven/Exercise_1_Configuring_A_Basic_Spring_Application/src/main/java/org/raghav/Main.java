package org.raghav;

import org.raghav.repository.BookRepository;
import org.raghav.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

    public static void main(String[] args) {

        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        BookRepository repository =
                context.getBean("bookRepository", BookRepository.class);

        BookService service =
                context.getBean("bookService", BookService.class);

        repository.displayRepository();
        service.displayService();
    }
}
