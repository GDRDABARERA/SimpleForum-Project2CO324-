<%-- 
    Document   : edit
    Created on : May 11, 2015, 11:04:49 PM
    Author     : dinalidabarera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
         <link rel="stylesheet" href="css/mystyle.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <script src="js/bootstrap.min.js"></script>
         <script src="js/myscript.js"></script>
        <title>Single post page</title>
        <style>
            .page-header{padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee;};
        </style>
        <script>
            
      function editButton(){
                
                 var username= document.getElementById('Username').value;
                  var title =document.getElementById('titleText').value;
                  var description = document.getElementById('widgEditor').value;
                  // allert("You have successfully add the post ! Refresh the page");
                  
                if((username.length !=0 )&&(title.length!=0) &&(description.length!=0) ) 	//if the input field is not empty
                {
                var xmlhttprequest = new XMLHttpRequest();
                  //  allert("You have successfully add the post ! Refresh the page");
                        xmlhttprequest.onreadystatechange = getServerResponse;
                        
                        xmlhttprequest.open("GET", "posting?userInput="+username+"/"+title+"/"+description,true);
                        xmlhttprequest.send();
                        allert("You have successfully add the post ! Refresh the page");
                        window.history(-1);

                        // send a GET request to the server. Send the user input as a parameter in the url. You have to use open() and send() methods here to send a request.

                 }
                 else 
                { 
                    window.allert("you have to enter the text");	//if the input fi to enter the eld is empty, suggestion field should also be empty
                    return;
                 } 
                 
                 
                 function getServerResponse() 
                {
                  
                        
                             if(xmlhttprequest.readyState==4){
                                 if(xmlhttprequest.status==200){
                                        var post=xmlhttprequest.responseText;
                                       //
                                     document.write(post.toString());
                                     allert("You have successfully add the post ! Refresh the page");
                                     //window.open("secureUser/userpage.jsp");
                                     //history.go(-1);
                                 }else{

                                     window.allert("HTTP error"+ xmlhttprequest.status +":"+ xmlhttprequest.statusText);
                                 }

                             }; 
                         
                } 
                
                

               //  allert("You have successfully add the post ! Refresh the page");

                 
                 
              }
    
    
              
             
             
        

        
                 
                 
        
         </script>
    </head>
    <body>
        <%  
            String user = request.getAttribute("username").toString();
            String title = request.getAttribute("title").toString();
            String description = request.getAttribute("description").toString();
            String id = request.getAttribute("id").toString();
           // String[] comments = (String[])request.getAttribute("comments");
          // int count = comments.length;
           
           %>
        
           <a style="padding-left:20px;padding-right:20px" class="btn  btn-success" href="/forum4/">Home</a><br> 
        
             <div class="page-header">
            <h2>Edit post</h2>
            </div>
        
        <div class="container">
            <form id="editPost"  >
                <h3>
                <span class="label label-warning"> UserName : </span>
                <textarea id="Username" value=<%=user %>> </textarea>
       
            </h3> 
            <h3>
                <span class="label label-warning"> Title : </span>
                <textarea id="titleText" value=<%=title %>></textarea>
       
            </h3> 
            <br>
            <h3>
                <span class="label label-warning"> Description: </span>
               <textarea id="widgEditor"  value=<%=description %> ></textarea>
            </h3>
            <br>
              <button type="button" class="btn btn-xs btn-info" id="editBut" onclick="editButton();" > Edit</button> 
            
            </form>
        </div>
       
            
            
            
                
          
     
    </body>
</html>
