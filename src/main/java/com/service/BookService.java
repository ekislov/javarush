package com.service;

import com.dao.BookDAO;
import com.domain.BookEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookService {

    @Autowired
    private BookDAO bookDAO;

    public void add(BookEntity book) {
        bookDAO.add(book);
    }

    public void update(BookEntity book) {
        bookDAO.update(book);
    }

    public void delete(BookEntity book) {
        bookDAO.delete(book);
    }

    public BookEntity get(int id) {
        return bookDAO.get(id);
    }

    public List<BookEntity> getAll()  {
        return bookDAO.getAll();
    }

    public List<BookEntity> findByTitle(String title)  {
        return bookDAO.findByTitle(title);
    }

    public void setRead(int id) {
        bookDAO.setRead(id);
    }
}
