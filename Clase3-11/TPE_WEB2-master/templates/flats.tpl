{include file="header.tpl"}

<div class="filter-div">
    {include file="filterFlat.tpl"}
</div>

{if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
    <div class="container-fluid">
        <div class="row justify-content-start">
            {include file="insertFlat.tpl"}
{else}
    <div class="container-fluid">
        <div class="row justify-content-center">
{/if}
            <div class="col-md-6 offset-md-2">
                {if isset($errorMessaje)}
                    <div class="alert alert-danger" role="alert">
                        {$errorMessaje}
                    </div>
                {else}
                    <div class="col">
                        <div class="row" id="table-div">
                            <table class="table">
                                <thead class="thead-dark">
                                    <th scope="col">Departamentos</th>
                                    <th scope="col">Ciudad</th>
                                    {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    {/if}
                                    <th scope="col"></th>
                                </thead>
                                {foreach from=$flats item=flat}
                                    <tr>
                                        <td>{$flat->nombre}</td>
                                        <td>{$flat->nombre_ciudad}</td>
                                        <td>
                                        <a href="flat/{$flat->id_departamento}"><button type="button"
                                            class="btn btn-secondary btn-sm">Ver detalle</button></a>
                                        </td>
                                        {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                                            <td>
                                                <a href="editFlat/{$flat->id_departamento}"><button
                                                type="button" class="btn btn-secondary btn-sm">Editar</button></a>
                                            </td>
                                            <td>
                                                <a href="deleteFlat/{$flat->id_departamento}"><button
                                                type="button" class="btn btn-secondary btn-sm">X</button></a>
                                            </td>
                                        {/if}
                                    </tr>
                                {/foreach}
                            </table>
                        </div>
                    </div>
                    {include file="pagination.tpl"}
                {/if}
            </div>  
        </div>
    </div>
{include file="footer.tpl"}