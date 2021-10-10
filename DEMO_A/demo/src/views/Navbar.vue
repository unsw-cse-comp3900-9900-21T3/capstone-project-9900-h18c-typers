<template>
  <div>
    <header>
      <nav>
        <div><img class="logo" src="../assets/images/logo.png"></div>
        <router-link class="el-menu-item" to="/sign">Home</router-link>
        <router-link class="el-menu-item" to="/sign">sale</router-link>
        <router-link class="el-menu-item" to="/sign">cart</router-link>
        <router-link class="el-menu-item" to="/sign">my</router-link>
      </nav>
    </header>
  </div>
</template>

<script>
export default {
  name: 'Navbar',
  methods: {
    GoSign () {
      this.$router.push('../login')
    }
  }
}
</script>

<style lang="css">
.logo{
  width: 70px;
  padding-right: 70px;
  padding-left: 0px;
}
nav{
  margin-top: 0px;
  padding-top: 0px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
}
.el-menu-item{
  color: #ffffff;
  padding: 10px 100px;
  position: relative;
  text-align: center;
  border-bottom: transparent;
  display: flex;
  transition: 0.4s;
  font-size: large;
  font-weight: bold;
  text-decoration-line: none;
  border-right-style: solid;
  border-left-style: solid;
}
.el-menu-item:hover{
  background-color: black;
  border-bottom: solid 6px;
  border-bottom-color: white;
  height: 60px;
  text-decoration: none;
}
header{
  background: #3d0514;
  width: auto;
  height: 70px;
}
</style>
