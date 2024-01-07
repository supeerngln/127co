<script lang="ts">
  export let items: {
    title: string;
    description: string;
    image: string;
  }[];
</script>

<div class="container">
  <div class="carousel">
    {#each items as item}
      <div class="item">
        <img src={item.image} alt={item.title} />
        <h2>{item.title}</h2>
        <p>{item.description}</p>
      </div>
    {/each}
  </div>
</div>

<style>
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
  }

  .carousel {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
  }

  .item {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
  }

  .item img {
    width: 400px;
    height: 400px;
    object-fit: cover;
    border-radius: 10%;
  }
</style>
