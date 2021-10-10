<template>
  <div>
    <header>
      <Navbar></Navbar>
    </header>
    <swiper></swiper>
    <h1>hello world</h1>
    <product></product>
  </div>

</template>

<script>
import Navbar from './Navbar'
import swiper from './swiper'
import Product from './product'
export default {
  name: 'homepage',
  components: {
    Product,
    Navbar,
    swiper
  }
}
</script>

<style>
</style>
