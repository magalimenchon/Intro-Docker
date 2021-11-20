{include file="header.tpl"}
<div class="container-fluid" id="edit-div">

    <h3>Editar Ciudad</h3>

    <form action="editCity" method="post">

        <label for="title">Nombre</label>
        <input type="text" name="input_edit_name" value="{$city->nombre}"
            placeholder="{$city->nombre}" required>

        <button value="{$city->id_ciudad}" name="input_edit_id" type="submit"
            class="btn btn-secondary">Editar</button>
    </form>
    
</div>
{include file="footer.tpl"}