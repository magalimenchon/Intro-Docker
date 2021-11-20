{include file="header.tpl"}
{if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
<div class="container-fluid">
    <div class="row justify-content-start">
{include file="insertCity.tpl"}
{else}
<div class="container-fluid">
    <div class="row justify-content-center">
{/if}
        <div class="col-md-4 offset-md-2">

            {if isset($errorMessaje)}
            <div class="alert alert-danger" id="alert-div" role="alert">
                {$errorMessaje}
            </div>
            {else}

            <div class="row" id="table-div">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Ciudades</td>
                            {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                            <th scope="col"></th>
                            <th scope="col"></th>
                            {/if}
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$cities item=city}
                            <tr>
                                <td>{$city->nombre}</td>
                                {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                                <td><a href="editCity/{$city->id_ciudad}"><button type="button"
                                            class="btn btn-secondary">Editar</button></a></td>
                                <td><a href="deleteCity/{$city->id_ciudad}"><button type="button"
                                            class="btn btn-secondary">X</button></a></td>
                                {/if}
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
            {/if}
        </div>
    </div>
</div>
{include file="footer.tpl"}