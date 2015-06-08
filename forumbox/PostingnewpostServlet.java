/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forumbox;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author dinalidabarera
 */
public class PostingnewpostServlet extends HttpServlet {
    public static  int count=0;
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
             DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssms");
             Date date = new Date();
             String id = dateFormat.format(date);
		//response.addHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();		
		
		String typed = request.getParameter("userInput");			//getting the parameter which was sent by the client
		
                String[] data=new String[3];
                data= typed.split("/");
               // out.print(data[0]);
                
                   String username=data[0];       
                    String title = data[1];
                    String description = data[2];
                filewrite("/home/dinalidabarera/NetBeansProjects/NewFolder/forum4/admin01/post/",username,title,description,response,id);
                
			
		
                //ompare each name in the names array with the user input pattern and when a matching name is found send that in the response
		 ServletContext sc  = getServletContext();
		RequestDispatcher view = sc.getRequestDispatcher("/addPost.jsp");
		view.forward(request,response);
     
       
     
    }
	
				

	
   
   public void filewrite(String url, String username, String title, String description,HttpServletResponse response, String id) throws IOException{
       
            count ++;
      /*   BufferedWriter out ;
         out = new BufferedWriter(new FileWriter(url,true));
         out.write(count+"/"+array[0]+"/"+array[1]+"/"+array[2]+";");
         out.close();
         
         
        }catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } */
            
          JSONObject post = new JSONObject();
        JSONArray comments = new JSONArray();
        JSONArray toapprove = new JSONArray();
        JSONParser parser = new JSONParser();
        JSONObject list = null;
        
        
        post.put("title", title);
        post.put("description", description);
        post.put("id",id);
        post.put("username",username);
      //  post.put("comments",comments);
      //  post.put("toapprove",toapprove);


       
      
        try {

          Object obj =  parser.parse(new FileReader(url+"list.json"));
          list =(JSONObject) obj;
          
            JSONArray msg = (JSONArray) list.get("list");
            msg.add(id);

            list.remove("list");
            list.put("list",msg);


        } catch (Exception e) {
        	  response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              out.println("Adding new ID is unsuccessful");
              out.println(e);
              out.println("......................");
        }

  


        try {

           File file = new File(url+id+".json");
            file.createNewFile();
            BufferedWriter out ;
            out = new BufferedWriter(new FileWriter(file));
           out.write(post.toJSONString());
            out.close();
          
             File fileList = new File(url+"list.json");
          //  fileList.createNewFile();
           // BufferedWriter outin ;
          //  outin = new BufferedWriter(new FileWriter(fileList));
          // outin.write(post.toJSONString());
            FileWriter listwrite = new FileWriter(fileList);
            listwrite.write(list.toJSONString());
            listwrite.flush();
            listwrite.close();
            //outin.close();
       


        } catch (IOException e) {
            
             response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              out.println("adding new post is unsuccessful");
              out.println(e);
              out.println("......................");
        }


     
            
       
   
   }
	
}	