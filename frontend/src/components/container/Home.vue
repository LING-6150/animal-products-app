<!--中间主界面组件-->
<template>
  <div class="home">
    <el-container class="el-container">
      <!--侧边栏-->
      <el-aside
        class="el-aside"
        v-if="
          this.$store.state.user !== null &&
          this.$store.state.role !== null &&
          this.$store.state.role.indexOf(this.$VAR.ordinaryRole) === -1
        "
      >
        <Aside></Aside>
      </el-aside>
      <!--导航栏-->
      <el-container class="el-container">
        <el-header class="el-header">
          <Header></Header>
        </el-header>
        <!--主面板-->
        <el-main class="el-main">
          <router-view></router-view>
        </el-main>
        <!--底部-->
        <el-footer
          class="el-footer"
          v-if="
            this.$store.state.role !== null &&
            this.$store.state.role.indexOf(this.$VAR.ordinaryRole) === -1
          "
        >
          <div class="footer">
            <span>Copyright © 2024 · 宠物用品商城 · 京ICP备XXXXXX号</span>
          </div>
        </el-footer>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import Aside from "./Aside";
import Header from "./Header";
import ProductList from "../product/ProductList";
import ProductAdd from "../product/ProductAdd";
export default {
  name: "Home",
  components: { Aside, Header, ProductList, ProductAdd },
};
</script>

<style>
.home {
  height: 100%;
}

.home .el-container {
  height: 100%;
  background-color: #f5f5f5;
}

.home .el-header {
  padding: 0;
  background-color: #fff;
  border-bottom: 1px solid rgb(229, 231, 235);
  color: #333;
  text-align: center;
}
.home .el-footer {
  padding: 0;
  color: #333;
  height: 50px !important;
  background: #ffffff;
  line-height: 50px;
}

.home .el-aside {
  width: 180px !important;
  background-color: #d3dce6;
  color: #333;
  text-align: center;
  line-height: 200px;
}

.home .el-main {
  width: 1500px;
  margin: 0 auto;
  color: #333;
  text-align: center;
  padding: 0;
}

.home .el-main::-webkit-scrollbar {
  /*滚动条整体样式*/
  width: 0; /*高宽分别对应横竖滚动条的尺寸*/
}

.home .footer {
  width: auto;
  height: 100%;
  line-height: 50px;
  font-size: 10px;
  user-select: none;
}
</style>
