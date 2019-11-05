<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统日志</title>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <link type="text/css" rel="stylesheet" href="/static/css/repairorder/repairorder.css"/>
    <style type="text/css">
        html,
        body,
        #app{
            height: 100%;
        }
    </style>
</head>
<body>
    <div id="app">
        <el-container>
            <el-main id="main">
                <el-row style="margin-bottom: 1px">
                    <el-col :span="8" style="width:250px ;">
                        <div>
                            <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
                                <el-button slot="append" type="primary" icon="el-icon-search" @click="query()"></el-button>
                            </el-input>
                        </div>
                    </el-col>
                </el-row>
                <el-row >
                    <el-table ref="singleTable" :data="tableData" highlight-current-row @current-change="handleCurrentChange"
                              style="width: 100%;">
                        <el-table-column type="index" width="40"></el-table-column>
                        <el-table-column prop="id" label="序号" width="100"></el-table-column>
                        <el-table-column prop="opUser" label="操作用户" width="100"></el-table-column>
                        <el-table-column prop="opTime" label="操作时间" width="100"></el-table-column>
                        <el-table-column prop="opIp" label="操作用户IP地址" width="120"></el-table-column>
                        <el-table-column prop="function" label="操作哪些功能" width="400"></el-table-column>
                        <el-table-column prop="params" label="传入参数信息" width="180"></el-table-column>
                    </el-table>
                    <div class="block" >
                        <span class="demonstration" hidden="hidden"></span>
                        <el-pagination
                                @size-change="handleSizeChange"
                                @current-change="handleCurrentChange"
                                :current-page="currentPage"
                                :page-sizes="[5, 10, 15, 20]"
                                :page-size="5"
                                layout="total, sizes, prev, pager, next, jumper"
                                :total="totalNum">
                        </el-pagination>
                    </div>
                </el-row>
            </el-main>
        </el-container>
    </div>
    <script type="text/javascript">
        var app = new Vue({
            el:'#app',
            data:{
                //表格数据
                tableData: [],
                //分页工具属性值
                totalNum:0,
                currentPage: 1,
                pageNum:0,
                pageSize:10,
                //搜索框属性
                input:'',
            },
            methods:{
                setCurrent(row) {
                    this.$refs.singleTable.setCurrentRow(row);
                },
                handleCurrentChange(val) {
                    this.currentRow = val;
                },
                handleSizeChange(val) {
                    console.debug(val);
                    this.pageSize = val;
                    this.loadData();
                },
                handleCurrentChange(val) {
                    //调用分页查询：
                    console.debug("===="+val);
                    this.pageNum = val;
                    this.loadData();
                },
                //发送异步请求加载数据
                loadData(){
                    var param = {"keyword":this.keyword,"pageNum":this.pageNum,"pageSize":this.pageSize};
                    _this=this;
                    //axios.post("请求路径"，参数).then().catch()
                    console.debug(param);
                    axios.post("/systemlog/queryPage",param).then(function (response) {
                        console.debug(response);
                        _this.tableData = response.data.rows;
                        _this.totalNum=response.data.total;
                    }).catch()
                },
                //模糊查询
                query(){
                    let params = {"keyWord":this.input};
                    _this=this;
                    console.debug(params);
                    axios.post('/systemlog/query',params).then(function (response) {
                        _this.tableData=response.data
                    }).catch(function (){});
                }
            },
            //页面入口函数
            mounted: function () {
                this.loadData();
            }
        })
    </script>

</body>
</html>
