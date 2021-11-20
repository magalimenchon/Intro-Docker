{include file="header.tpl"}

<div class="col-md-4 offset-md-4">
    <div class="row" id="table-div">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Usuarios</td>
                    <th scope="col">Permiso</th>
                    <th scope="col">Modificar</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$users item=user}
                    {if $user->email !== $sessionUser['USER']}
                        <tr>
                            <td>{$user->email}</td>
                            {if $user->rol eq 0}
                                <td>{"Admin"}</td>
                            {else}
                                <td>{"Común"}</td>
                            {/if}
                            <td><a href="updateUserRole/{$user->id_usuario}"><button type="button" 
                                        class="btn btn-secondary"> {if $user->rol eq 0} Comun
                                        {else} Admin {/if}</button></a></td>
                            <td><a href="deleteUser/{$user->id_usuario}"><button type="button"
                                        class="btn btn-secondary">X</button></a></td>
                        </tr>
                    {/if}
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
{include file="footer.tpl"}