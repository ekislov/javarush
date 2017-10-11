package com.dao;

import com.domain.BookEntity;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository

public class BookDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void add(BookEntity book) {
        book.setReadAlready(false);
        sessionFactory.getCurrentSession().save(book);
    }

    public void update(BookEntity book) {
        book.setReadAlready(false);
        sessionFactory.getCurrentSession().update(book);
    }

    public void delete(BookEntity book) {
        sessionFactory.getCurrentSession().delete(book);
    }


    public BookEntity get(int id) {
        BookEntity book = sessionFactory.getCurrentSession().get(BookEntity.class, id);
        return book;
    }

    @SuppressWarnings("unchecked")
    public List<BookEntity> getAll()  {
        List<BookEntity> resultList = sessionFactory.getCurrentSession().createQuery("from book").list();
        return resultList;
    }

    @SuppressWarnings("unchecked")
    public List<BookEntity> findByTitle(String title)  {
        List<BookEntity> resultList;
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BookEntity.class);
        criteria.add(Restrictions.like("title","%"+title+"%"));
        resultList = criteria.list();
        return resultList;
    }

    public void setRead(int id) {
        BookEntity book = sessionFactory.getCurrentSession().get(BookEntity.class,id);
        if (!book.isReadAlready()) {
            book.setReadAlready(true);
            sessionFactory.getCurrentSession().update(book);
        }
    }
}
