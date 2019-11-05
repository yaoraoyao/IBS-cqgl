<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <%@include file="/WEB-INF/views/common.jsp"%>
    <%--主页面样式--%>
    <link type="text/css" rel="stylesheet" href="/static/css/mainmenu.css" charset="UTF-8"/>
    <title></title>
</head>
<body>
<div id="app" >
    <el-container >
        <el-aside width="200px">
            <div ></div>
            <el-row >
                <el-col :span="24">
                    <div class="grid-content bg-purple-dark" style="line-height: 60px; color: #3a8ee6" >
                        云鼎汽车维修管理系统
                    </div>
                </el-col>
            </el-row>
            <!--左侧导航条-->
            <el-row >
                <el-col :span="24" >
                    <el-menu :default-openeds="['1']" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose"
                             background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
                        <el-submenu index="1">
                            <template slot="title"><i class="el-icon-setting"></i>维修单管理</template>
                            <el-menu-item-group>
                                <el-menu-item index="1-1" @click="addorder(settedbill)">客户维修单</el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                        <el-submenu index="2">
                            <template slot="title"><i class="el-icon-setting"></i>结算管理</template>
                            <el-menu-item-group>
                                <el-menu-item index="2-1">订单结算</el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                        <el-submenu index="3">
                            <template slot="title"><i class="el-icon-setting"></i>还车管理</template>
                            <el-menu-item-group>
                                <el-menu-item index="3-1">还车情况</el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                        <el-submenu index="4">
                            <template slot="title"><i class="el-icon-setting"></i>配件管理</template>
                            <el-menu-item-group>
                                <el-menu-item index="4-1">配件入库</el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                        <el-submenu index="5">
                            <template slot="title"><i class="el-icon-setting"></i>系统管理</template>
                            <el-menu-item-group>
                                <el-menu-item index="5-1">支付方式</el-menu-item>
                                <el-menu-item index="5-2">维修员</el-menu-item>
                                <el-menu-item index="5-3">管理员</el-menu-item>
                            </el-menu-item-group>
                        </el-submenu>
                    </el-menu>
                </el-col>
            </el-row >
        </el-aside>
        <el-container>
            <el-header>
                <!--导航条-->
                <div style="width: 200px;background-color: #606266;"></div>
                <el-row >
                    <el-col :span="20">
                        <div class="grid-content bg-purple" style="left: 220px !important;">
                            <el-menu :default-active="activeIndex2" class="el-menu-demo" mode="horizontal"
                                     @select="handleSelect" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
                                <el-menu-item index="1">处理中心</el-menu-item>
                                <el-submenu index="2">
                                    <template slot="title">我的工作台</template>
                                    <el-menu-item index="2-1">选项1</el-menu-item>
                                    <el-submenu index="2-4">
                                        <template slot="title">选项4</template>
                                        <el-menu-item index="2-4-1">选项1</el-menu-item>
                                    </el-submenu>
                                </el-submenu>
                                <el-menu-item index="3" disabled>消息中心</el-menu-item>
                                <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
                            </el-menu>
                        </div>
                    </el-col>
                    <el-col :span="4">
                        <div style="background-color: rgb(84, 92, 100); height: 60px;text-align:right;">
                            <span style="color:#CF9236;margin-bottom: auto;">admin</span>
                            <img src="/static/img/header05.jpg" alt="加载失败" style="width: 50px;height: 50px;" />
                        </div>
                    </el-col>
                </el-row>
                <!--头部菜单结束-->
            </el-header>
            <el-main>
                <el-tabs v-model="activeName" @tab-click="handleClick">
                    <el-tab-pane label="用户管理" name="first">
                        <el-row style="margin-bottom: 10px"></el-row>
                    </el-tab-pane>
                    <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
                    <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
                    <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
                </el-tabs>


            </el-main>
        </el-container>
    </el-container>
    <!-- Form -->
    <el-dialog title="编辑/新增" :visible.sync="dialogFormVisible">
        <el-form :model="form">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="部门名称">
                    <el-input  v-model="form.name"></el-input>
                </el-form-item>
            </el-form>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="onSubmit()">确 定</el-button>
        </div>
    </el-dialog>
</div>
<script type="text/javascript">
    let app = new Vue({
        el:'#app',
        data:{
            totalNum:0,
            currentPage: 1,
            pageNum:0,
            pageSize:10,
            dialogFormVisible: false,
            input:'',
            activeIndex: '1',
            activeIndex2:'1',
            activeName: 'first',
            tableData: [],
            form:{
                name:''
            },
            multipleSelection: []
        },
        methods:{
            // addorder(settedbill) {
            //     let newTabName = ++this.tabIndex + '';
            //     this.editableTabs.push({
            //         title: '客户维修单',
            //         name: newTabName,
            //         content: '/settedbill/index'
            //     });
            //     this.settedbill = newTabName;
            // },
            handleSizeChange(val) {
                console.debug(val);
                this.pageSize = val;
                this.loadData();
            },
            handleCurrentChange(val) {
                //调用分页查询：
                this.pageNum = val;
                this.loadData();
            },
            remove(){
                //确定删除吗？
                //确定：向后台发送请求：
                /*this.$confirm('文字提示','标题',{
                  confirmButtonText: '确定',
                  cancelButtonText: '取消',
                  type: 'warning'
                }).then(函数：成功的时候进入).cathc(失败的时候进去)*/
                if(this.multipleSelection !==null && this.multipleSelection.length !== 0){
                    this.$confirm('此操作将永久删除选中的数据吗?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        _this=this;
                        for(var i =0;i<this.multipleSelection.length;i++){
                            let id = this.multipleSelection[i].id;
                            let params = {id:id};
                            axios.post('/department/delete',params).then(function (response) {
                                if(response.data.status){
                                    _this.$message({
                                        type: 'success',
                                        message: '删除成功!'
                                    });
                                    //刷新列表：
                                    _this.loadData();
                                }else{
                                    _this.$message({
                                        type: 'error',
                                        message: response.data.msg
                                    });
                                }_
                            }).catch(function (){});
                        }
                    });
                }else{
                    //提示框：
                    this.$message({
                        message: '请选中需要删除的数据!!!',
                        type: 'warning'
                    });
                }
             },
            //模糊查询
            query(){
                console.debug(this.input);
                let params = {"keyWord":this.input};
                _this=this;
                axios.post('/department/query',params).then(function (response) {
                    _this.tableData=response.data
                }).catch(function (){});
            },
            //编辑
            edit(){
                if(this.multipleSelection != null && this.multipleSelection.length ===1 ){
                    //打开对话框
                    this.dialogFormVisible=true;
                    this.form=this.multipleSelection[0];

                }else {
                    this.$message({
                        message: '请选中一条需要编辑的数据!!!',
                        type: 'warning'
                    });
                }
            },
            openDialog(){
                this.form={};
                this.dialogFormVisible=true;
            },
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            //
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            },
            /*标签页*/
            handleClick(tab, event) {
                console.log(tab, event);
            },
            onSubmit() {
                var params=this.form;
                console.debug(params);
                _this = this;
                axios.post('/department/save',params).then(function (response) {
                    if(response.data.status){
                        _this.dialogFormVisible =false;
                        _this.loadData();
                    }else {
                        this.$message({
                            type:'erroe',
                            message:response.data.msg
                        })
                    }
                }).catch(function (){});
            },
            toggleSelection(rows) {
                if (rows) {
                    rows.forEach(row => {
                        this.$refs.multipleTable.toggleRowSelection(row);
                    });
                } else {
                    this.$refs.multipleTable.clearSelection();
                }
            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            loadData(){
                var param = {"keyword":this.keyword,"pageNum":this.pageNum,"pageSize":this.pageSize};
                _this = this;
                axios.post('/department/queryPage',param).then(function (response) {
                    console.debug(response);
                    _this.tableData= response.data.rows;
                    _this.totalNum=response.data.total;
                });
            }

        },
        mounted(){
            this.loadData();
        }
    });

</script>
</body>
</html>
