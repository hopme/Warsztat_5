package pl.coderslab.beans;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemoryBookService {
    private List<Book> list;
    static private long idCounter = 4;
    public MemoryBookService() {
        list = new ArrayList<>();
        list.add(new Book(1L, "9788324631766", "Thinking in Java", "Bruce Eckel",
                "Helion", "programming"));
        list.add(new Book(2L, "9788324627738", "Rusz glowa, Java.",
                "Sierra Kathy, Bates Bert", "Helion", "programming"));
        list.add(new Book(3L, "9780130819338", "Java 2. Podstawy",
                "Cay Horstmann, Gary Cornell", "Helion", "programming"));
    }
    public List<Book> getList() {return list;}
    public Book getBook(long bookId) {
        return list.stream().filter(s->s.getId() == bookId)
        .findFirst().get();
    }
    public void setList(List<Book> list) {this.list = list;}

    public void addBook(Book book){
        book.setId(idCounter++);
        this.list.add(book);
    }

    public void deleteBook(long bookId) {
        Book delBook = list.stream().filter(b -> b.getId() == bookId).findFirst().get();
        list.remove(delBook);
    }

    public void editBook(Book book) {
        Book editBook = list.stream().filter(b -> b.getId() == book.getId()).findFirst().get();
        editBook.setIsbn(book.getIsbn());
        editBook.setAuthor(book.getAuthor());
        editBook.setPublisher(book.getPublisher());
        editBook.setTitle(book.getTitle());
        editBook.setType(book.getType());
    }
}
