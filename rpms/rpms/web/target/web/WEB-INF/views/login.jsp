<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
    <%--// /wechat/callback--%>
    <%--request.getRequestDispatcher("/wechat/callback").forward(request,response);--%>
<%--%>--%>
<html>
<head>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <style>
        html,
        body{
            height: 100%;
        }
        .el-header{
            background-color: lavender;
            color: #333;
            text-align: center;
            line-height: 60px;
            width: 100%;
        }

        .el-main {
            background-color: #fdf6ec;
            color: #333;
            /*text-align: center;*/
            background-size: 100%;
            width: 100%;
            margin: 1px !important;

        }

        .el-howtologin{
            text-align: left;
            text-align: right;
        }

        .el-carousel__item h3 {
            color: #475669;
            font-size: 18px;
            opacity: 0.05;
            height: 100%;
        }

        .el-carousel__item:nth-child(2n) {
            background-image: url("/static/image/07.jpg");
            background-size: 100%;
            height: 100%;
            width: 100%;
        }

        .el-carousel__item:nth-child(2n+1) {
            background-image: url("/static/image/00.jpg");
            background-size: 100%;
            height: 100%;
            width: 100%;
        }

        .remember {
            margin-left: 120px;
        }

        .yanzhengma_input{
            border: 1px solid #fff;
            outline: none;
            border-radius: 12px;
            letter-spacing: 1px;
            font-size: 17px;
            font-weight: normal;
            padding: 5px 0 5px 10px;
            margin-left: 30px;
            height: 40px;
            margin-top: -60px;
            margin-left: 120px;
            border: 1px solid #e6e6e6;
        }
        .verification{
            border-radius: 12px;
            width:100px;
            letter-spacing:5px;
            margin-left: 50px;
            height: 40px;
            transform: translate(-15px,0);
            margin-top: -60px;
            margin-left: 25px;
        }
        .enquiry{
            margin-left: 70px;
        }
        .el-carousel__container{
            height: 1000px!important;
        }

    </style>
</head>
<body>
<div id="app">
    <el-container>
        <el-header>
            <el-row>
                <div class="el-howtologin" >
                    <div style="color: darkcyan;font-size: 30px;float: left">云鼎汽车维修管理系统</div>
                    <div style="float: right;width: 400px">
                        <el-button type="info" plain @click="dialogFormVisible = true">普通登录</el-button>
                        <el-button type="info" plain  @click="dialogQQ = true">微信登录</el-button>
                        <el-button type="info" plain @click="dialogLogon = true">注册账号</el-button>
                    </div>
                </div>
            </el-row>
        </el-header>
        <el-main style="font-size: 80px;color: #b3d8ff;font-family: 'Agency FB';height: 100%;width:100%;padding: 1px;margin: 1px">
            <template >

                <el-carousel indicator-position="outside" style="height: 100%;width: 100%;">

                    <el-carousel-item v-for="item in 4" :key="item">
                        <h3>{{ item }}</h3>

                    </el-carousel-item>
                </el-carousel>
            </template>

        </el-main>
    </el-container>

    <%--普通登录框--%>
    <el-dialog title="普通登录" :visible.sync="dialogFormVisible">
        <el-form :model="form">
            <el-form-item label="账号" :label-width="formLabelWidth">
                <el-input v-model="form.name" auto-complete="off"></el-input>
            </el-form-item>
            <el-form-item label="密码" :label-width="formLabelWidth">
                <el-input type="password" v-model="form.newpassworld"></el-input>
            </el-form-item>

            <div class="join_formitem">
                <label class="enquiry">验证码</label>
                <div class = 'captcha'>
                    <input type="text" placeholder="请输入验证码" class="yanzhengma_input" v-model="picLyanzhengma">
                    <input type="button"  @click="createCode"  class="verification" v-model="checkCode"/>
                </div>
            </div>


            <el-checkbox v-model="checked" class="remember">记住密码</el-checkbox>
        </el-form>
        <div slot="footer" class="dialog-footer" style="text-align: center;">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click.native.prevent="handleLogin" >登录</el-button>
        </div>
    </el-dialog>

    <%--注册框--%>
    <el-dialog title="注册账号" :visible.sync="dialogLogon">
        <el-form :model="form">
            <el-form-item label="账号" :label-width="formLabelWidth">
                <el-input v-model="form.name2" auto-complete="off"></el-input>
            </el-form-item>
            <el-form-item label="密码" :label-width="formLabelWidth" prop="newpassworld">
                <el-input type="password" v-model="newpassworld" id="password" name="password" ></el-input>
            </el-form-item>
            <el-form-item label="确认密码" :label-width="formLabelWidth" prop="confirmpassworld">
                <el-input type="password" v-model="confirmpassworld" @blur="blurSearchFor"  id="confirmPassword" name="confirmPassword" ></el-input>
            </el-form-item>
            <el-form-item label="邮箱号" :label-width="formLabelWidth">
                <el-input v-model="email" auto-complete="off"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer" style="text-align: center;">
            <el-button @click="dialogLogon = false">取 消</el-button>
            <el-button type="primary" @click="blurSearchFor(),dialogLogon = false" >注册</el-button>
        </div>
    </el-dialog>

    <%--微信登录--%>
    <el-dialog :visible.sync="dialogQQ">
        <div style="text-align: center;height: 450px;">
            <iframe src="/wechat/index" style="text-align: center;height: 430px;width: 400px;"></iframe>
        </div>

    </el-dialog>



</div>


</body>

<script>
    new Vue({
        el: '#app',
        data:{
            newpassworld:'',
            confirmpassworld:'',
            email:'',
            msg:'',
            visible: false,
            dialogTableVisible: false,
            dialogFormVisible: false,
            dialogLogon:false,
            checked: false,
            dialogQQ:false,
            form: {
                name: '',
                region: '',
                date1: '',
                date2: '',
                delivery: false,
                type: [],
                resource: '',
                desc: '',
                checkCode:'',
                picLyanzhengma:''

            },
            formLabelWidth: '120px'


        },

        methods: {
                 dialogWechat(){
                     console.debug(222);
                   location.href="wechat/wechatIndex.jsp";
                 },

                createCode(){
                //先清空验证码的输入
                this.code = "";
                this.checkCode = "";
                this.picLyanzhengma = "";
                //验证码的长度
                var codeLength = 4;
                //随机数
                var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
                for(var i = 0; i < codeLength; i++) {
                    //取得随机数的索引（0~35）
                    var index = Math.floor(Math.random()*36);
                    //根据索引取得随机数加到code上
                    this.code += random[index];
                }
                //把code值赋给验证码
                this.checkCode = this.code;
            },
            blurSearchFor(){
                var a= this.newpassworld;
                var b= this.confirmpassworld;
                var c= this.email;
                if (a != b){
                    alert("两次密码不一致!");
                }


            },
            handleLogin() {
                var _this = this;
                var loginParams = {username: this.form.name, password: this.form.newpassworld};
                //发送登录请求
                console.debug(loginParams);
                axios.post("login", loginParams)
                    .then(function(res) {
                        let data = res.data;
                        console.debug(res);
                        if (data.success) {
                            //登录成功
                            //跳转到首页
                            location.href = "index";
                        } else {
                            this.logining = false;
                            this.$message.error(data.message)
                        }
                    })
            }
        },
        mounted(){
        },
        created(){
            this.createCode();
            let that = this;
            document.onkeypress = function(e) {
                var keycode = document.all ? event.keyCode : e.which;
                if (keycode == 13) {
                    that.handleLogin();// 登录方法名
                    return false;
                }
            };
        }

    })



</script>
</html>
