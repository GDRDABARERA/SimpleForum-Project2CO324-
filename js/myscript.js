/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function addnewPost(){
    window.location.href="addPost.jsp";
}

function confirmPosts(){
    
    
}
function commentbutton(){
    
    
}

function postbutton(){
    
    
}
function likePost(){
    
}
function commentPost(){
    
}
function editPost(){
    
}
function refresh(){
  jQuery.get('/home/dinalidabarera/apache-tomcat-8.0.21/admin01/post/postingsheet.txt', function(data) {
   alert(data);
   //process text file line by line
   $('#div').html(data.replace('n','<br />'));
});
}