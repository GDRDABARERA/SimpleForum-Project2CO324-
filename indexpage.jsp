
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : index
    Created on : Apr 30, 2015, 8:52:04 AM
    Author     : dinalidabarera
--%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/jquery.js"></script>
       <script src="js/bootstrap.min.js"></script>
       <script src="js/bootstrap.js"></script>
        <script src="js/myscript.js"></script>
      <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="style sheet" href="editor/widgEditor.css">
        <title>user page</title>
        
        <script type="text/javascript">
            
            function addnewPost(){
                 window.location.href="addPost.jsp";
            }
            
          
        </script>
        <style type="text/css">
            #newPostButton{
                background-color: buttonface;
            };
            #editPostButton{
                
                background-color: buttonface;
            };
        </style>
    </head>
    <body>

          <%
           String[] usernamelist= (String[])request.getAttribute("username");
           String[] titlelist= (String[])request.getAttribute("titlelist");
           String[] postidlist= (String[])request.getAttribute("idlist");
           String[] descriptionlist= (String[])request.getAttribute("descriptionlist");
           String colon=":";
           String sql ="[";
           String sqr ="]";
       
           
       %>
           <div class="jumbotron">
               <h1 style=" text-decoration-color: cornflowerblue">A Simple Blog</h1>
                <p>Any body can add comments to the Blog like Forum But in order to post them you need administrator permission..</p>
            </div>
            <div class="page-header" >
                
                <h3> 
                    <span class="label label-danger">My Forum</span>
                    <button type="button" id="newPostButton"  class="btn btn-sm btn-primary" onclick="addnewPost()">New Post</button>
                      <!--  <h3> <span class="label label-primary"><a href="/forumbox/ReadBack">Refresh</a></span> </h3> -->
                    
                
                </h3> 
                <br>
               
            </div> <br>
              <div style="font-size: 12px;">top ten post</div>  <br>
       
       <div  class="jumbotron">
           <div style=" background-color:cornsilk"> <h3> <buton><a class="btn btn-success active" href="/forum4/post/<%=postidlist[0]%>" ><%=titlelist[0] %></a></buton></h3><p><%=sql%><%=postidlist[0]%><%=colon%><%=usernamelist[0]%><%=sqr%></p><br><div><p><%=descriptionlist[0] %></p></div> </div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[1]%>" ><%=titlelist[1] %></a></h3><p><%=sql%><%=postidlist[1]%><%=colon%><%=usernamelist[1]%><%=sqr%></p><br><div><p><%=descriptionlist[1] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[2]%>" ><%=titlelist[2] %></a></h3><p><%=sql%><%=postidlist[2]%><%=colon%><%=usernamelist[2]%><%=sqr%></p><br><div><p><%=descriptionlist[2] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[3]%>" ><%=titlelist[3] %></a></h3><p><%=sql%><%=postidlist[3]%><%=colon%><%=usernamelist[3]%><%=sqr%></p><br><div><p><%=descriptionlist[3] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[4]%>" ><%=titlelist[4] %></a></h3><p><%=sql%><%=postidlist[4]%><%=colon%><%=usernamelist[4]%><%=sqr%></p><br><div><p><%=descriptionlist[4] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[5]%>" ><%=titlelist[5] %></a></h3><p><%=sql%><%=postidlist[5]%><%=colon%><%=usernamelist[5]%><%=sqr%></p><br><div><p><%=descriptionlist[5] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[6]%>" ><%=titlelist[6] %></a></h3><p><%=sql%><%=postidlist[6]%><%=colon%><%=usernamelist[6]%><%=sqr%></p><br><div><p><%=descriptionlist[6] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[7]%>" ><%=titlelist[7] %></a></h3><p><%=sql%><%=postidlist[7]%><%=colon%><%=usernamelist[7]%><%=sqr%></p><br><div><p><%=descriptionlist[7] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[8]%>" ><%=titlelist[8] %></a></h3><p><%=sql%><%=postidlist[8]%><%=colon%><%=usernamelist[8]%><%=sqr%></p><br><div><p><%=descriptionlist[8] %></p></div></div><br><br>
            <div style=" background-color: cornsilk"><h3> <a class="btn btn-success" href="/forum4/post/<%=postidlist[9]%>" ><%=titlelist[9] %></a></h3><p><%=sql%><%=postidlist[9]%><%=colon%><%=usernamelist[9]%><%=sqr%></p><br><div><p><%=descriptionlist[9] %></p></div></div><br><br>
          
          
       
        
           
           
           
           
       </div>
           
       
    </body>
</html>
