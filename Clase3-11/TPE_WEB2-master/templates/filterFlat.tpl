<div class="container-fluid">
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Filtrar por Ciudad
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="showFlats">Todas</a>
            <div class="dropdown-divider"></div>
            {foreach from=$cities item=city}
                <a class="dropdown-item" href="city/{$city->nombre}">{$city->nombre}</a>
            {/foreach}
        </div>
    </div>
</div>
