<template>
  <div class="login-page">
    <div class="login-header">
      <i class="el-icon-phone-outline" />
      <span>客户服务热线: 160 281 5386</span>
    </div>
    <div class="login-box">
      <div class="left-half">
        <div class="logo"></div>
        <ul class="geek-slide">
          <li>
            <span class="title"></span>
            <span class="description"></span>
          </li>
          <li>
            <span class="title"></span>
            <span class="description"></span>
          </li>
        </ul>
      </div>
      <div class="right-half">
        <h2 style="font-size: 50px">宠物用品商城系统</h2>
        <div class="form-box">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {};
  },
  methods: {},
  created() {},
};
</script>

<style scoped>
.login-page {
  width: 100%;
  height: 100vh;
  background-color: #5a12e194;
  background-size: cover;
}

.login-page .login-header {
  margin: 0;
  position: absolute;
  top: 50px;
  right: 75px;
  width: 250px;
  color: #ffffff;
  opacity: 0.8;
}

.login-page .login-header span {
  font-size: 16px;
}

.login-page .login-box {
  margin: 0;
  display: flex;
  position: absolute;
  width: 900px;
  height: 600px; /* 修改后的高度 */
  padding: 0;
  background-color: #fff; /* 修改后的透明度 */
  box-shadow: 0 6px 13px 0 rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.login-page .login-box .left-half {
  height: 100%;
  width: 450px;
  background-image: url("../../assets/img/side.png");
  background-repeat: no-repeat;
  background-size: cover;
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
}

.login-page .login-box .left-half .logo {
  position: absolute;
  top: 60px;
  left: 40px;
}

.login-page .left-half .logo p {
  margin: 3px 0 0;
  line-height: 20px;
  font-size: 14px;
  text-align: left;
}

.login-page .left-half .geek-slide {
  position: absolute;
  top: 160px;
  left: 60px;
  list-style: none;
  text-align: left;
  padding: 0;
  margin: 0;
}

.login-page .left-half .geek-slide li {
  margin-bottom: 32px;
  position: relative;
}

.login-page .left-half .geek-slide li i {
  position: absolute;
  top: 16px;
  font-size: 24px;
  color: #8c8c8c;
}

.login-page .left-half .geek-slide .title {
  display: block;
  margin-left: 50px;
  line-height: 22px;
  color: #8d92a1;
  font-size: 16px;
  font-weight: 700;
}

.login-page .left-half .geek-slide .description {
  display: block;
  margin-left: 50px;
  margin-top: 2px;
  line-height: 18px;
  color: #b0b4c1;
  font-size: 13px;
}

.login-page .login-box .right-half {
  width: 450px;
  flex-direction: column;
  align-items: center;
  justify-items: center;
  align-content: center;
}

/*右侧登录盒子*/
.login-page .login-box .right-half .form-box {
  width: 324px;
  height: 310px;
}
</style>
