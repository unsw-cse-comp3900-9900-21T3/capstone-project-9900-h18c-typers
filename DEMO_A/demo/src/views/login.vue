<template>
  <div :style = "{backgroundImage: 'url(' + require('../assets/images/background.jpg') + ')'}">
    <br>
    <br>
    <br>
    <h2 class="login-title"> WELCOME TO BLAHBLAH </h2>
    <el-form ref="form" :model="form" class="login-box">
      <h2 class="login-boxtitle"> Login Page </h2>
      <el-form-item label="User Name">
        <el-input  placeholder="Input your user name" v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="Password">
        <el-input type="password" placeholder="Input your password" v-model="form.password"></el-input>
      </el-form-item>
      <el-row>
        <el-button type="primary" class="login-button" @click="GoHome"> Login </el-button>
        <el-button type="primary" class="login-button" @click="GoSign"> Sign Up </el-button>
      </el-row>
      <el-button type="primary" class="reset-button" @click="onSubmit"> Reset Password </el-button>

    </el-form>
    <br>
    <br>
    <br>
    <br>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data () {
    return {
      form: {
        name: '',
        password: '',
        top: '0px',
        left: '0px'
      }
    }
  },
  methods: {
    onSubmit () {
      alert('Hello!')
    },
    GoSign () {
      this.$router.push('/sign')
    },
    GoHome () {
      this.$router.push('/home')
    }
  }
}
</script>

<style lang="css" scoped>
  .login-box{
    width: 400px;
    margin: 40px auto;
    border: 1px solid ;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 30px;
  }
  .login-title{
    text-align: center;
  }
  .login-boxtitle{
    text-align: left;
  }
  .login-button{
    margin: 10px;
    margin-bottom: 10px;
    align: left;
    font-family: Arial;
    color: white;
    font-size: large;
  }
  .reset-button{
    margin: 10px;
    margin-bottom: 10px;
    font-family: Arial;
  }
</style>
