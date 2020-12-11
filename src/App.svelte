<script>
  import axios from "axios";

  /**
   * @todo change this to an environment variable
   */
  const domain = process.apiUrl;

  let number = 1;
  let showAnswer = false;
  let message = "";


  const send = async () => {
    showAnswer = false;
    try {
      const { data } = await axios.get(`${domain}/${number}`);
      message = data.message;
      showAnswer = true;
    } catch (error) {
      alert(error);
    }
  };
</script>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }

  @media (min-width: 640px) {
    main {
      max-width: none;
    }
  }
</style>

<main>
  <h1>Enter your number and lets find out if its a prime!</h1>
  <input type="text" bind:value={number} />
  <button type="button" on:click={send}>Lets finds out!</button>
  {#if showAnswer}
    <h1>{message}</h1>
  {/if}
</main>
