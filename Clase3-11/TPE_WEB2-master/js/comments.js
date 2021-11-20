
const app = new Vue({
    el: '#app-comments',
    data: {
        comments: [],
        commentsLength: 0,
        admin: false,
        errorMessage: ""
    },
    methods: {
        deleteComment: function (event) {
            commentId = event.currentTarget.id;
            deleteComment(commentId);
        }
    }
})


document.addEventListener("DOMContentLoaded", () => {
    "use strict"
    
    isAdminLoggedIn();
    getFlatComments();
    addEventListeners();
   
});

function isAdminLoggedIn(){
    let userId = document.getElementById("vue-div").getAttribute("user-role");

    if(userId == 0){
        app.admin = true;
    }
}

function addEventListeners(){
    let div = document.querySelector("#comment-form");

    if(div != null){
        document.getElementById("comment-form").addEventListener("submit", e => {
            e.preventDefault();
            addComment();
        })
    }
}

let flatId = document.getElementById("vue-div").getAttribute("flat-id");


function getFlatComments(){
    fetch("api/flatComments/" + flatId)
    .then(response => response.json())
    .then(response => {
        app.comments = response;
        app.commentsLength = response.length;
    })
    .catch(error => console.log(error));
}

function deleteComment(id){
    fetch("api/comments/" + id, {method: "DELETE"})
    .then(response => {
        if(!response.ok)
            app.errorMessage = "No se ha podido eliminar el comentario";
        else
            app.errorMessage = "";
        return response.json();
    })
    .then( () => {
        deleteCommentById(id);
        app.commentsLength = app.comments.length;
    })
    .catch(error => console.log(error));
}

function deleteCommentById(id){
    for (let i = 0; i < app.commentsLength; i++){
        if(app.comments[i].id_comentario == id){
            app.comments.splice(i, 1);
            return;
        }
    }
}

function addComment(){
    let userId = document.getElementById("form-div").getAttribute("user-id");
    let nameUser = document.getElementById("form-div").getAttribute("user-name");
    let inputs = document.querySelectorAll("div.rating input[name='rating']");
    let rating;

    inputs.forEach(element => {
        if(element.checked){
            rating = element.value;
        }
    });

    let comment = {
        nombre_usuario: nameUser,
        id_depto_fk: flatId,
        id_usuario_fk: userId,
        puntaje: rating,
        texto: document.querySelector('#input-text').value
    }
    
    fetch("api/comments", {
        method: 'POST',
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(comment)
    })
    .then(response => {
        if(!response.ok){
            app.errorMessage = "Error no se ha podido postear el comentario";
        }
        else{
            app.errorMessage = "";
            return response.json();
        }
    })
    .then(comment => {
        if(comment != undefined){
            app.comments.push(comment);
            app.commentsLength = app.comments.length;
        }
        
    })
    .catch(error => console.log(error));
}