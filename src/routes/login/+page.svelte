<script lang="ts">
  import logo from "$lib/assets/logo.png";
</script>

<div class="container">
  <div class="info">
    <img src={logo} alt="Logo" />
    <div class="cta">
      <h2>Haven't signed up yet?</h2>
      <p>Let's see how we can help you.</p>
      <button>Get in Touch</button>
    </div>
  </div>
  <div class="login">
    <form method="POST">
      <input name="email" type="email" placeholder="Email" />
      <input name="password" type="password" placeholder="Password" />
      <button type="submit">Login</button>
    </form>
  </div>
</div>

<style>
  .container {
    display: flex;
    width: 100vw;
    height: 100vh;
  }

  .info {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 50%;
    height: 100%;
    padding: 20px;
    background-color: var(--black);
    color: var(--white);
  }

  .info img {
    width: fit-content;
    height: 40px;
  }

  .login {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 50%;
    height: 100%;
    padding: 20px;
  }

  .login form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
  }
</style>
