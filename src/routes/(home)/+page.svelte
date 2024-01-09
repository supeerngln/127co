<script lang="ts">
  import web_development from "$lib/assets/services/web-development.png";
  import mobile_applications from "$lib/assets/services/mobile-applications.png";
  import standalone_systems from "$lib/assets/services/standalone-systems.png";

  import Carousel from "$lib/components/Carousel.svelte";

  const services = [
    {
      title: "Web Development",
      description:
        "We build web applications using the latest technologies and best practices.",
      image: web_development,
    },
    {
      title: "Mobile Applications",
      description:
        "We build mobile applications using the latest technologies and best practices.",
      image: mobile_applications,
    },
    {
      title: "Standalone Systems",
      description:
        "We build standalone systems using the latest technologies and best practices.",
      image: standalone_systems,
    },
  ];
</script>

<div class="hero-section">
  <div>
    <h1>Accelerate Your Roadmap With Us</h1>
    <p>
      Our team of experts will help you build your project and accelerate your
      development.
    </p>
    <button>Get in Touch</button>
  </div>
</div>

<div class="services">
  <h2>Services</h2>
  <p>We offer a wide range of services to help you build your product.</p>
  <div>
    <Carousel items={services} />
  </div>
  <button>Learn More</button>
</div>

<div class="bootcamp">
  <h2>Bootcamp</h2>
  <p>
    Our bootcamp is a 3-month program where you will learn how to build a
    full-stack application from scratch.
  </p>
  <button>Learn More</button>
</div>

<style>
  .hero-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5rem;
    background-image: url("$lib/assets/hero.png");
    background-size: cover;
    background-position: left;
  }

  .hero-section div {
    width: 50%;
  }

  .hero-section h1 {
    font-size: 5rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  .hero-section p {
    font-size: 2rem;
    font-weight: 400;
    margin-bottom: 2rem;
  }

  .hero-section button {
    font-size: 1.5rem;
    font-weight: 700;
    padding: 1rem 2rem;
    border-radius: 0.5rem;
  }

  @media screen and (max-width: 750px) {
    .hero-section {
      flex-direction: column;
      padding: 2rem;
    }

    .hero-section div {
      width: 100%;
    }

    .hero-section h1 {
      font-size: 3rem;
    }

    .hero-section p {
      font-size: 1.5rem;
    }

    .hero-section button {
      font-size: 1rem;
    }
  }

  .services {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 5rem;
    background-color: var(--white);
    color: var(--black);
  }

  .services h2 {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  .services p {
    font-size: 1.5rem;
    font-weight: 400;
    margin-bottom: 2rem;
  }

  .services div {
    width: 100%;
    margin-bottom: 2rem;
  }

  .services button {
    font-size: 1.5rem;
    font-weight: 700;
    padding: 1rem 2rem;
    border-radius: 0.5rem;
  }

  @media screen and (max-width: 750px) {
    .services {
      padding: 2rem;
    }

    .services h2 {
      font-size: 2rem;
    }

    .services p {
      font-size: 1rem;
    }

    .services button {
      font-size: 1rem;
    }
  }

  .bootcamp {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 5rem;
  }

  .bootcamp h2 {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  .bootcamp p {
    font-size: 1.5rem;
    font-weight: 400;
    margin-bottom: 2rem;
  }

  .bootcamp button {
    font-size: 1.5rem;
    font-weight: 700;
    padding: 1rem 2rem;
    border-radius: 0.5rem;
  }

  @media screen and (max-width: 750px) {
    .bootcamp {
      padding: 2rem;
    }

    .bootcamp h2 {
      font-size: 2rem;
    }

    .bootcamp p {
      font-size: 1rem;
    }

    .bootcamp button {
      font-size: 1rem;
    }
  }
</style>
