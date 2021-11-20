{* 
{foreach from=$images item=image}
    <div class="form-group">
        <img src="{$image->ruta}" alt="Imagen del departamento {$flat->nombre}">
        {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
            <a href="deleteImage/{$image->id_imagen}"><button type="button" 
               class="btn btn-secondary">X</button></a>
        {/if}
    </div>
{/foreach} *}

<div class="d-flex flex-column" id="flatImgs">
    {foreach from=$images item=image}
    <div class="d-flex justify-content-center">
        <img src="{$image->ruta}" class="img-fluid" alt="Imagen del departamento {$flat->nombre}">
        <a href="deleteImage/{$image->id_imagen}"><button type="button" 
               class="btn btn-secondary">X</button></a>
    </div>
    {/foreach}
</div>