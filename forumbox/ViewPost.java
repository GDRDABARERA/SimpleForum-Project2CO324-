/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forumbox;
import java.io.FileReader;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dinalidabarera
 */
@WebServlet(name = "ViewPost", urlPatterns = {"/ViewPost"})
public class ViewPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */ /*
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
      /*      out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewPost</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String url=  request.getRequestURI();
        String[] urlpost= url.split("/");
        String idPost = urlpost[3];
        
        JSONParser passPost = new JSONParser();
        JSONObject post ;
        
        
        try {

            if(idPost != null){
                Object objPost = passPost.parse(new FileReader("/home/dinalidabarera/NetBeansProjects/NewFolder/forum4/admin01/post/"+idPost+".json"));

                post = (JSONObject) objPost;
                String postuser = post.get("username").toString();
                String posttitle = post.get("title").toString();
                String postdescription = post.get("description").toString();


             /*   JSONArray array = (JSONArray) post.get("comments");
                ArrayList<String> list;
                list = new ArrayList<>();
                Iterator<String> iterator = array.iterator();

                while (iterator.hasNext()) {
                    list.add(iterator.next());
                }

                int listsz = list.size(); */
              /*  String[] comments = new String[listsz];
                for(int i=0;i<listsz;i++){
                    comments[i]=list.get(i);
                }*/

                request.setAttribute("title",posttitle);
                request.setAttribute("description",postdescription);
                request.setAttribute("username",postuser);
               // request.setAttribute("comments",comments);
                request.setAttribute("id",idPost);

                request.getRequestDispatcher("/post.jsp").forward(request,response);

            }


        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
           
            out.println(e);
           
            
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doGet(request,response);
       
       
       
       
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
