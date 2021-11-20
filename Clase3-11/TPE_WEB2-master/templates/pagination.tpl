<nav aria-label="Page navigation example">
  <ul class="pagination">
  {for $page=1 to $totalPages}
      <li class="page-item">
        {if $city !== null}
            <a class="page-link" href="city/{$city}/{$page}"><button type="button" 
                class="btn btn-secondary">{$page}</button></a>
        {else}
            <a class="page-link" href="showFlats/{$page}"><button type="button" 
                class="btn btn-secondary">{$page}</button></a>
        {/if}
      </li>
  {/for}
  </ul>
</nav>