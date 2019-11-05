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
            <el-header>
                <!--导航条-->
                <div style="width: 200px;background-color: #606266;"></div>
                <el-row   style="border-radius: 0px">
                    <el-col :span="24" style="width:100%; ">
                        <div class="grid-content bg-purple-dark" style="font-size:20px;width:100%;line-height: 60px; color: #b3d8ff;float: left" >
                            <div style="float: left">云鼎汽车维修管理系统</div>
                        <div style="background-color: rgb(84, 92, 100); height: 60px;text-align:right;float: right">
                            <span style="color: #FAFAFA;margin-bottom: auto;margin-right: 0px;">欢迎你！${loginUser.username}</span>
                            <el-dropdown-item @click.native="handleLogout" style="background-color: rgb(84, 92, 100);color: darksalmon;font-size: 13px;padding-top:13px;float: right">退出登录</el-dropdown-item>
                        </div>
                        </div>
                    </el-col>
                </el-row>
                <!--头部菜单结束-->
            </el-header>
            <el-container>
                <el-aside width="200px">
                    <div ></div>
                    <el-row >
                    </el-row>
                    <!--左侧导航条-->
                    <el-row>
                        <el-col :span="24">
                            <el-tree :data="menudata" :props="defaultProps" @node-click="handleNodeClick">
                            </el-tree>
                        </el-col>
                    </el-row>
                </el-aside>
                <el-main>
                    <el-tabs v-model="editableTabsValue" type="card" editable @edit="removeTab">
                        <el-tab-pane
                                :key="item.name"
                                v-for="(item, index) in editableTabs"
                                :label="item.title"
                                :name="item.name">
                            <iframe height="100%" width="100%" style='border:none' :src='item.content' v-if="index>0"></iframe>
                            <span style="color: #3a8ee6" v-if="index==0">{{item.content}}</span>
                        </el-tab-pane>
                    </el-tabs>

                </el-main>
            </el-container>
        </el-container>
        </div>
        <script type="text/javascript">


            let app = new Vue({
                el:'#app',
                data:{
                    //tabs标签页属性
                    editableTabsValue: '1',
                    editableTabs: [{
                        title: '首页',
                        name: '1',
                        content: '欢迎使用云鼎汽车维修管理系统！',
                        closable:false
                    }],
                    tabIndex: 1,
                    activeIndex: '1',
                    activeIndex2:'1',
                    menudata:[],
                    defaultProps: {
                        children: 'children',
                        label: 'label'
                    }
                },
                methods: {
                    handleNodeClick(menudata){
                        if(menudata.children.length ===0){
                            let tabs = this.editableTabs;
                            let flag = true;
                            tabs.forEach((tab,index)=>{
                                if(tab.title === menudata.label){
                                    //如果已经打开则选中
                                    this.editableTabsValue = tab.name;
                                    flag=false;
                                    return;
                                }
                            });
                            if(flag){
                                let newTabName = ++this.tabIndex +'';
                                this.editableTabs.push({
                                    title:menudata.label,
                                    name:newTabName,
                                    content:menudata.url
                                });
                                this.editableTabsValue = newTabName;
                            }
                        }
                    },
                    removeTab(targetName, action) {
                        if (action === 'remove') {
                            let tabs = this.editableTabs;
                            //获取当前选中的tab页
                            let activeName = this.editableTabsValue;
                            if (activeName === targetName) {
                                tabs.forEach((tab, index) => {
                                    if (tab.name === targetName) {
                                        //取得当前选中页的前一页
                                        let previousTab = tabs[index + 1] || tabs[index - 1];;
                                        if (previousTab) {//如果是首页就不删除
                                            tabs.splice(index,1);//删除当前页
                                            activeName = previousTab.name;//将选中项设置为前一个tab标签页
                                        }
                                    }
                                });
                            }
                            this.editableTabsValue = activeName;
                            this.editableTabs = tabs.filter(tab => tab.name !== targetName);
                            //this.editableTabs = tabs;
                        }
                    },
                    handleSelect(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    handleOpen(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    handleClose(key, keyPath) {
                        console.log(key, keyPath);
                    },
                    loadmenu(){
                        _this=this;
                        axios.post("/menu/menulist").then(function (response) {
                            _this.menudata = response.data;
                        })
                    },
                    //todo
                    //退出登录
                    handleLogout(){
                        location.href="/logout";
                    }
                },
                mounted(){
                    if (window!=window.top){
                        window.top.location.href="/index";
                    }

                    this.loadmenu();
                }
            });
        </script>
    </body>
</html>
