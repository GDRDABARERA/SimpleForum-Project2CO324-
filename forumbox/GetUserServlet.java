/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forumbox;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author dinalidabarera
 */
public class GetUserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   // private static final long serialVersionUID = 1L;
    @Override
    
        

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         JSONObject IDlistobj = null;
         JSONObject postobj = null;
         JSONParser IDlistparser = new JSONParser();
         JSONParser postParser = new JSONParser();
       

         String[] Idlist= new String[10];
         int count = 0;

        try {
            FileReader file1= new FileReader("/home/dinalidabarera/NetBeansProjects/NewFolder/forum4/admin01/post/list.json");
            
            Object obj = IDlistparser.parse(file1);

            IDlistobj = (JSONObject) obj;
            JSONArray list = (JSONArray) IDlistobj.get("list");

            count = list.size()-1;

            for(int i=0 ; i<10 && i<=count; i++){
                Idlist[i] = list.get(count).toString();
                count--;
            }


        } catch (Exception e) {

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("get ID is unsuccessful");
            out.println(e);
            out.println("......................");
        }

        // get the posts

        try {
        	
        	String[] idlist= new String[10];
        	String[] descriptionlist= new String[10];
                 String[] username= new String[10];
                    String[] titlelist= new String[10];
           
            

            for(int i=0; i<10 && i<=count; i++){
                FileReader file= new FileReader("/home/dinalidabarera/NetBeansProjects/NewFolder/forum4/admin01/post/"+Idlist[i]+".json");
            	Object obj =  postParser.parse(file);
            	postobj =(JSONObject)obj;
            	idlist[i]=postobj.get("id").toString();
	            descriptionlist[i]=postobj.get("description").toString();
                    username[i] = postobj.get("username").toString();
	            titlelist[i] = postobj.get("title").toString();

                if(descriptionlist[i].length()>200){
                    descriptionlist[i]= descriptionlist[i].substring(0,199)+ "....";
                }
            }


            request.setAttribute("titlelist",titlelist);
            request.setAttribute("idlist",idlist);
            request.setAttribute("descriptionlist",descriptionlist);
            request.setAttribute("username",username);

            request.getRequestDispatcher("/indexpage.jsp").forward(request,response);




        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("fetching post unsuccessful");
            out.println(e);
            out.println("......................");
        }




    }

       
                              
                        
                       
	

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

               
        doGet(request,response);

                
                      
                              
                        
                       
	}

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


