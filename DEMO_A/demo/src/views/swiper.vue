<template>
  <div
    class="banner"
    @mouseover="stopInv()"
    @mouseout="runInv()"
    @touchstart="stopInv()"
    @touchend="runInv()"
  >
    <div class="item">
      <img :src="dataList[currentIndex]" />
    </div>
    <div class="page" v-if="this.dataList.length > 1">
      <ul>
        <li @click="gotoPage(prevIndex)">&lt;</li>
        <li
          v-for="(item,index) in dataList"
          @click="gotoPage(index)"
          :class="{'current':currentIndex == index}"
          :key="index"
        >{{index+1}}</li>
        <li @click="gotoPage(nextIndex)">&gt;</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Swiper',
  data () {
    return {
      dataList: [
        '../../static/img/home1.png',
        '../../static/img/home2.png',
        '../../static/img/home3.png'
      ],
      currentIndex: 0,
      timer: null
    }
  },
  mounted: function () {
    setTimeout(() => {
      this.runInv()
    })
  },
  methods: {
    gotoPage (index) {
      this.currentIndex = index
    },
    runInv () {
      this.timer = setInterval(() => {
        this.gotoPage(this.nextIndex)
      }, 3000)
    },
    stopInv () {
      clearInterval(this.timer)
    }
  },
  computed: {
    prevIndex () {
      if (this.currentIndex === 0) {
        return this.dataList.length - 1
      } else {
        return this.currentIndex - 1
      }
    },
    nextIndex () {
      if (this.currentIndex === this.dataList.length - 1) {
        return 0
      } else {
        return this.currentIndex + 1
      }
    }
  }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
ul li {
  list-style: none;
  float: left;
  width: 30px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
  color: rgba(255, 255, 255, 0.8);
  font-size: 14px;
}
.banner {
  max-width: 1360px;
  position: relative;
}
.banner img {
  width: 100%;
  display: block;
}
.banner .page {
  background: rgba(0, 0, 0, 0.5);
  position: absolute;
  right: 0;
  bottom: 0;
  width: 100%;
}
.banner .page ul {
  float: right;
}
.current {
  color: #ff6700;
}
</style>
