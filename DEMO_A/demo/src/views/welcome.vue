<template>
  <div :style="imgsrc">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <h1 :style="{opacity: '1'}">
      Welcome to BLAHBLAH
    </h1>
    <h3>Please choice you identity</h3>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <el-row>
      <el-button type="primary" class="reset-button" @click="GoAdmin"> Admin </el-button>
      <el-button type="primary" class="reset-button" @click="GoUser"> User </el-button>
    </el-row>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
  </div>

</template>

<script>
export default {
  name: 'welcome',
  data () {
    return {
      imgsrc: {
        backgroundImage: 'url(' + require('../assets/images/background.jpg') + ')',
        backgroundRepeat: 'no-repeat',
        backgroundSize: '100% auto',
        top: '0px',
        left: '0px'
      }
    }
  },
  methods: {
    GoAdmin () {
      this.$router.push('/login')
    },
    GoUser () {
      this.$router.push('/login')
    },
    onSubmit () {
      alert('Hello!')
    }
  }
}
</script>

<style scoped>
.reset-button{
  margin: 10px;
  margin-bottom: 10px;
  font-family: Arial;
  font-size: large;
}
</style>
