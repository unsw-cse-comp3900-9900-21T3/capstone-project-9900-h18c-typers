<template>
  <div :style = "{backgroundImage: 'url(' + require('../assets/images/background.jpg') + ')'}">
    <br>
    <br>
    <br>
    <h2 class="sign-title"> Please fill in your information </h2>
    <el-form ref="form" :model="form" class="sign-box">
      <h3 class="sign-boxtitle"> Personal Information </h3>
      <el-form-item label="User Name">
        <el-input  placeholder="Enter your user name" v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="Password">
        <el-input  placeholder="Enter your Password" v-model="form.password"></el-input>
      </el-form-item>
      <el-form-item label="Confirm Password">
        <el-input  placeholder="Confirm your password" v-model="form.repassword"></el-input>
      </el-form-item>
      <el-form-item label="Address">
        <el-input  placeholder="Enter your address" v-model="form.address"></el-input>
      </el-form-item>
      <el-button type="primary" class="sign-button" @click="GoLogin"> Confirm </el-button>
    </el-form>
    <br>
    <br>
    <br>
  </div>
</template>

<script>
export default {
  name: 'sign',
  data () {
    return {
      form: {
        top: '0px',
        left: '0px',
        name: '',
        password: '',
        repassword: '',
        address: ''
      }
    }
  },
  methods: {
    GoLogin () {
      this.$router.push('/login')
    }
  }
}
</script>

<style lang="css" scoped>
                  .sign-box{
                    width: 400px;
                    margin: 30px auto;
                    border: 1px solid ;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 30px;
                  }
.sign-title{
  text-align: center;
}
.sign-boxtitle{
  text-align: left;
}
.sign-button{
  align: right;
}
</style>
