<%-- 
    Document   : comment
    Created on : May 4, 2015, 7:40:34 AM
    Author     : dinalidabarera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <head>
        <title>Comment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="style sheet" href="editor/widgEditor.css">
        <script src="js/bootstrap.min.js"></script>
        <script src="editor/widgEditor.js"></script>
         <script src="js/myscript.js"></script>
    </head>
    <body>
        <div class="page-header">
            <h1>Add a new comment</h1>
            
        </div>
        
        <div class="container">
            <form id="addnewComment">
           
      
            <h3>
                <span class="label label-warning"> Comment: </span>
                <textarea id=”widgEditorCommennt”   >Add your comment here</textarea>
            </h3>
            <br>
                 <button type="button" class="btn btn-xs btn-info" id="commentButton"  onclick="commentbutton()"> Comment</button>
            
            
            </form>
        </div>
        
    </body>
</html>
