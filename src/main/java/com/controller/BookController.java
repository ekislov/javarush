package com.controller;

import com.domain.BookEntity;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;


@Controller
public class BookController {

    @Autowired
    private BookService bookService;
    private int pageSize = 10;
    private int curr_page=1;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView books(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("bookslist");

        List<BookEntity> books = bookService.getAll();
        PagedListHolder<BookEntity> pagedListHolder = new PagedListHolder<BookEntity>(books);
        pagedListHolder.setPageSize(pageSize);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page=1;

        modelAndView.addObject("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("books", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("books", pagedListHolder.getPageList());
        }

        modelAndView.addObject("book", new BookEntity());

        curr_page=page;
        return modelAndView;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id,
                          @RequestParam(value="page", required=true) Integer page,
                          Model model) {
        model.addAttribute("bookEntity", bookService.get(id));
        curr_page=page;
        return "editForm";
    }

    @RequestMapping(value = "/checkEdit", method = RequestMethod.POST)
    public String validateEdit(@Valid @ModelAttribute("bookEntity") BookEntity bookEntity,
                               BindingResult result,
                               Model model) {
        if (result.hasErrors()) {
            return "editForm";
        }
        bookService.update(bookEntity);
        model.addAttribute("page",curr_page);
        return "redirect:/";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@RequestParam(value="page", required=true) Integer page,
                      Model model) {
        BookEntity bookEntity = new BookEntity();
        model.addAttribute("bookEntity", bookEntity);
        curr_page=page;
        return "addForm";
    }

    @RequestMapping(value = "/checkAdd", method = RequestMethod.POST)
    public String validateAdd(@Valid @ModelAttribute("bookEntity") BookEntity bookEntity, BindingResult result,
                              Model model) {
        if (result.hasErrors()) {
            return "addForm";
        }
        bookService.add(bookEntity);
        model.addAttribute("page", curr_page);
        return "redirect:/";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id,
                         @RequestParam(value="page", required=true) Integer page,
                         Model model) {
        bookService.delete(bookService.get(id));
        model.addAttribute("page", page);
        return "redirect:/";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(@RequestParam(value="id", required=true) Integer id,
                       @RequestParam(value="page", required=true) Integer page,
                       Model model) {
        BookEntity book = bookService.get(id);
        model.addAttribute("bookAttribute", book);
        model.addAttribute("page",page);
        model.addAttribute("id",id);
        return "view";
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public String read(@RequestParam(value="id", required=true) Integer id,
                       @RequestParam(value="page", required=true) Integer page,
                       Model model) {
        bookService.setRead(id);
        model.addAttribute("page", page);
        return "redirect:/";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(@RequestParam(value="page", required=true) Integer page,
                       Model model) {
        model.addAttribute("page", page);
        return "redirect:/";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value="title", required=true) String title,
                         Model model) {
         model.addAttribute("page",curr_page);
         if (title.equals(""))
             return "redirect:/";
         List<BookEntity> books = bookService.findByTitle(title);
         if (books.isEmpty())
             return "/searchNoResult";
         else {
             model.addAttribute("books", books);
             return "/searchResult";
         }
    }
}

