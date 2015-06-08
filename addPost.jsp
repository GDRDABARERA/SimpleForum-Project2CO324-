<%-- 
    Document   : addPost
    Created on : May 5, 2015, 2:01:38 PM
    Author     : dinalidabarera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Post</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="style sheet" href="editor/widgEditor.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
         <script type="text/javascript" src="js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="editor/widgEditor.js"></script>
         <script type="text/javascript" src="js/myscript.js"></script>
         
  <script>
            
      function postButton(){
                
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
        <div class="page-header">
            <h1>Add a new post</h1>
            
        </div>
        
        <div class="container">
            <form id="addnewPost" >
                <h3>
                <span class="label label-warning"> UserName : </span>
                <textarea id="Username"></textarea>
       
            </h3> 
            <h3>
                <span class="label label-warning"> Title : </span>
                <textarea id="titleText"></textarea>
       
            </h3> 
            <br>
            <h3>
                <span class="label label-warning"> Description: </span>
               <textarea id="widgEditor"   >Add the post here</textarea>
            </h3>
            <br>
               <!-- <input type="submit" value="Post"> -->
              <button type="button" class="btn btn-xs btn-info" id="postBut" onclick="postButton();" > Post</button>  
             <!-- <button type="button" class="btn btn-xs btn-info" id="postBut"  > Post</button> -->
            
            
            
            </form>
        </div>
       
    </body>
</html>
