{literal}
<div id="app-comments">
    <div v-if="errorMessage != ''" class="alert alert-danger" role="alert">{{errorMessage}}</div>
    <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col">
                <div class="p-3 bg-white rounded">
                    <h6>Comentarios[{{commentsLength}}]</h6>

                    <div v-if="commentsLength > 0" v-for="comment in comments" class="review mt-4">
                        <div class="d-flex flex-row comment-user justify-content-between">
                            <div class="ml-2">
                                <div class="d-flex flex-row align-items-center"><span
                                        class="name font-weight-bold">{{comment.nombre_usuario}}</span></div>
                                <div class="rating">
                                    <p>Puntaje: {{comment.puntaje}}</p>
                                </div>
                            </div>
                            <div v-if="admin">
                                <button v-on:click="deleteComment($event)" class="btn btn-secondary btn-sm" :id="comment.id_comentario"> X </button>
                            </div>
                        </div>
                        <div class="mt-2">
                            <p class="comment-text">{{comment.texto}}</p>
                        </div>
                    </div>

                    <div v-if="commentsLength == 0" class="review mt-4">
                        <p> se el primero en dejar un comentario un increible comentario!!!</p>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
{/literal}
