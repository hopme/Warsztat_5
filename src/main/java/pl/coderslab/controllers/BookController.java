package pl.coderslab.controllers;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.coderslab.beans.Book;
import pl.coderslab.beans.MemoryBookService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {
    @RequestMapping("/hello")
    public String hello(){
        return "{hello: World}";
    }

    @RequestMapping("/")
    public List<Book> helloBook(){
        List<Book> books = new ArrayList<>();
        books.add(new Book(1L,"9788324631766","Thinking in Java",
                "Bruce Eckel","Helion","programming"));
        return books;
    }

    @RequestMapping("/{bookId}")
    public Book showBook(@PathVariable int bookId){
        MemoryBookService memoryBookService = new MemoryBookService();
        return memoryBookService.getBook(bookId);
    }

    @PostMapping("/")
    public String addBook(HttpServletRequest request){
        System.out.println(request.getParameter("isbn"));
        return "index";
    }


}
