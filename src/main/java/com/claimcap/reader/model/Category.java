package com.claimcap.reader.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.lang.NonNull;

@Entity
@Table(name="category")
public class Category {

    //instance variables
    @Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NonNull
    private String name;


    //entity relationships
    @OneToMany //one Category can have many Book objects connected with it
    @JoinColumn(name="category_id") //this column is used in books table to determine which books there belong to this category
    private List<Book> books;


    //constructors
    public Category() {}

    public Category(String name) {
        this.name = name;
    }


    //getters & setters
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

	@Override
	public String toString() {
		return name;
	}
    
    
}
