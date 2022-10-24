package kr.book.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookVO {
	private int num;
	private String title;
	private String author;
	private String company;
	private String isbn;
	private int count;
	
}
