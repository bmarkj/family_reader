package com.claimcap.reader.model;

import javax.persistence.*;

import org.springframework.lang.NonNull;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Entity
@Table(name="book")
public class Book {

    //instance variables
    @Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NonNull
    private String title;

    @NonNull
    private String author;

    @NonNull
    private String isbn;

    //entity relationships
    
    @NonNull
    @ManyToOne(cascade=CascadeType.DETACH)//many Book objects can have the same level
    private Level level;

    @NonNull
    @ManyToOne(cascade=CascadeType.DETACH) //many Book objects can have the same category
    private Category category;

    @ManyToMany(mappedBy = "books")
    private List<User> users = new ArrayList<User>();


    //constructors
    public Book() {}

    public Book(String title, String author) {
        this.title = title;
        this.author = author;
    }

    
    //GET & SET
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}

	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", author=" + author + ", isbn=" + isbn + ", level=" + level
				+ ", category=" + category + ", users=" + users + "]";
	}

	public static Comparator<Book> compareByLevel = new Comparator<Book> () {
		
		public int compare(Book b1, Book b2) {
			return b1.getLevel().getId().compareTo(b2.getLevel().getId());	
		}
	};
	
	
	
//	@Override
//	public int compare(Object o1, Object o2) {
//		
//		return ((Book) o2).getLevel().getId().compareTo(((Book) o1).getLevel().getId());
//	}

}
