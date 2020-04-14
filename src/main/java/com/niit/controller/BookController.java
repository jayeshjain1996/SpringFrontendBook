package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Book;
import com.niit.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController 
{
	@Autowired
	BookService bookService;
  
	@RequestMapping("/add")
	public String add(ModelMap map)
	{
		map.addAttribute("book",new Book());
		return "addbooks";
	}
	
	@RequestMapping(value = {"/add"},method = RequestMethod.POST)
	public String addbook(@ModelAttribute("book") Book b,@RequestParam("image") MultipartFile bookimage)
	{
		bookService.addBook(b);
		String path1="C:\\Users\\HP\\Desktop\\JUnit testing\\SpringBookFrontend\\src\\main\\webapp\\WEB-INF\\images\\";
		Path p=Paths.get(path1+b.getBookname());
		if (!Files.exists(p))
		{    
			try
			{
				Files.createDirectory(p);
				System.out.println("Directory created");
			}
			catch (Exception e) 
			{
				System.out.println(e);
			}
        }
		
		
        List<String> files=displayImage(b.getBookname());
		
		String path2=String.valueOf(p.toString()+"\\"+(files.size()+1)+".jpg");
		System.out.println(path2);
		File imageFile=new File(path2);
		
		if(!bookimage.isEmpty())
		{
			try
			{
				byte buffer[]=bookimage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bos=new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			}
			catch (Exception e) 
			{
				System.out.println(e);
			}
		}
		return "redirect:/";
	}
	
	  
	  public List<String> displayImage(String bookname)
		{

			List<String> images=new ArrayList<String>();
			
			try
			{
				String path="C:\\Users\\HP\\Desktop\\JUnit testing\\SpringBookFrontend\\src\\main\\webapp\\WEB-INF\\images\\";
				Path p=Paths.get(path+bookname);
				DirectoryStream<Path> files=Files.newDirectoryStream(p,"*.*");
				
				for(Path file:files)
				{
//					FileInputStream fis=new FileInputStream(file.toString());
//					byte[] arr=new byte[fis.available()];
//					fis.read(arr);
					
					images.add(file.getFileName().toString());
				}
				
			}
			catch (Exception e) 
			{
				System.out.println(e);
			}
			return images;
		}
	  	
	@RequestMapping("/display")
	public String display(ModelMap map)
	{
		List<Book> books=new ArrayList<Book>();
		for(Book b:bookService.displayAll())//Nike,Puma
		{
			List<String> im=displayImage(b.getBookname());
			if(!im.isEmpty())
			b.setBookimage(im.get(0));
			books.add(b);
		}
		map.addAttribute("books",books);
		return "displaybooks";
	}
	
	@RequestMapping("/display/{bookid}")
	public String displaybook(@PathVariable("bookid") int bookid,ModelMap map)
	{
		Book b=bookService.displayByBookid(bookid);
		List<String> images=displayImage(b.getBookname());
		b.setBookimage(images.get(0));
		map.addAttribute("book",b);
		return "displaybook";
	}
	
	  @RequestMapping("/delete/{bookid}")
	  public String delete(@PathVariable("bookid") int bookid)
	  {
		 bookService.deleteBook(bookid);
		 return "redirect:/book/display";
	  }
	  
	  @RequestMapping("/edit/{bookid}")
	  public String edit(@PathVariable("bookid") int bookid,ModelMap map)
	  {
		  Book b=bookService.displayByBookid(bookid);
		  map.addAttribute("b",b);
		  return "addbooks";
	  }
	  
	  @RequestMapping(value = {"/update"},method = RequestMethod.POST)
	  public String update(@ModelAttribute("b") Book b)
	  {
		bookService.updateBook(b);
		return "redirect:/book/display";
	  }
}
