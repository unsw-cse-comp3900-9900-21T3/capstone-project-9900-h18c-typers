<template>
  <div>
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
        <el-button type="primary" class="login-button" @click="onSubmit"> LOGIN </el-button>
        <el-button type="primary" class="sign-button" @click="onSubmit"> Sign Up </el-button>
      </el-row>
      <el-button type="primary" class="reset-button" @click="onSubmit"> Reset Password </el-button>

    </el-form>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data () {
    return {
      form: {
        name: '',
        password: ''
      }
    }
  },
  methods: {
    onSubmit () {
      alert('Hello!')
    }
  }
}
</script>

<style lang="css" scoped>
  .login-box{
    width: 400px;
    margin: 100px auto;
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
    align: left;
  }
  .reset-button{
    margin: 10px;
    margin-bottom: 10px;
  }
</style>
