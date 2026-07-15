package org.library.repository;

public class BookRepository {

    public BookRepository() {
        System.out.println("BookRepository Bean Created");
    }

    public void saveBook() {
        System.out.println("BookRepository: Book data saved successfully.");
    }
}