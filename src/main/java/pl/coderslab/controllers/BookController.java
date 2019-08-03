package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.beans.Book;
import pl.coderslab.beans.MemoryBookService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {
    @Autowired
    private MemoryBookService memoryBookService;

    @RequestMapping("/hello")
    public String hello(){
        return "{hello: World}";
    }

    @RequestMapping("/")
    public List<Book> helloBook(){
        return memoryBookService.getList();
    }

    @RequestMapping("/{bookId}")
    public Book showBook(@PathVariable int bookId){
        return memoryBookService.getBook(bookId);
    }



    @PostMapping("/")
    public void addBook(@RequestBody Book book){
        memoryBookService.addBook(book);
    }


}
