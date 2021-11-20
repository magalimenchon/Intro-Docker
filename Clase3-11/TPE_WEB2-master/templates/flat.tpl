{include file="header.tpl"}

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-6 offset-md-2">
            {if isset($errorMessaje)}
            <div class="alert alert-danger" role="alert">
                {$errorMessaje}
            </div>
            {else}
            <div class="col-md">
                <div class="row" id="table-div">
                    <table class="table">
                        <thead class="thead-dark">
                            <th scope="col">Departamento</th>
                            <th scope="col">Dirección</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Ciudad</th>
                        
                            {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                                <th scope="col"></th>
                                <th scope="col"></th>
                            {/if}
                        </thead>
                        <tr>
                            <td>{$flat->nombre}</td>
                            <td>{$flat->direccion}</td>
                            <td>{$flat->precio}</td>
                            <td>{$flat->nombre_ciudad}</td>
                            {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                            <td>
                                <a href="editFlat/{$flat->id_departamento}"><button type="button"
                                    class="btn btn-secondary btn-sm">Editar</button></a>
                            </td>
                            <td>
                                <a href="deleteFlat/{$flat->id_departamento}"><button type="button"
                                    class="btn btn-secondary btn-sm">X</button></a>
                            </td>
                            {/if}
                        </tr>

                    </table>
                    <div class="d-flex flex-column" id="flatImgs">
                        {foreach from=$images item=image}
                        <div class="d-flex justify-content-center">
                            <img src="{$image->ruta}" class="img-fluid" alt="Imagen del departamento {$flat->nombre}">
                        </div>
                        {/foreach}
                    </div>
                </div>
                {if $sessionUser eq true}
                <div class="row" id="form-div" user-name="{$sessionUser['USER']}" user-id="{$sessionUser['ID']}">
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center row">
                            <div class="col">
                                <form id="comment-form" action="insert" method="post">
                                    <div class="rating">
                                        <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                                        <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                                        <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                                        <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                                        <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="text-area">Deja tu comentario</label>
                                        <textarea class="form-control" name="input_text" id="input-text"
                                            rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Enviar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="vue-div" flat-id="{$flat->id_departamento}" user-role="{$sessionUser['ROLE']}">
                {else}
                    <div class="row" id="vue-div" flat-id="{$flat->id_departamento}" user-role="2">
                {/if}
                        {include file="vue/comments.vue"}
                    </div>
                </div>
            {/if}
            </div>
        </div>
    </div>
    {* CSR *}
    <script src="js/comments.js"></script>

    {include file="footer.tpl"}