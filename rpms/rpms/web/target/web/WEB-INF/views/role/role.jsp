<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门管理</title>
    <%@include file="/WEB-INF/views/common.jsp"%>

</head>
<body>
<div id="app">
    <el-container>
        <el-main style="padding: 5px">
            <el-row style="margin-bottom: 2px;" >
                <el-col :span="10" style="width:260px ;height: 40px ;padding-top: 5px">
                    <el-button class="btn-group" size="small" plain round type="primary" icon="el-icon-plus" @click="openDialog()">添加</el-button>
                    &emsp;
                    <el-button class="btn-group"  size="small"  plain round type="warning" icon="el-icon-edit" @click="edit()">修改</el-button>
                    &emsp;
                    <el-button class="btn-group"  size="small"  plain round type="danger" icon="el-icon-delete" @click="remove()">删除</el-button>
                </el-col>
                <el-col :span="8" style="width:350px ;padding-bottom: 3px">
                    <div >
                        <el-input class="search" placeholder="请输入内容" v-model="input" class="input-with-select">
                            <el-button slot="append" type="primary" icon="el-icon-search" @click="query()">搜索</el-button>
                        </el-input>
                    </div>
                </el-col>


            </el-row>
            <el-row>
                <el-table :data="tableData" stripe style="width: 100%;text-align: center;"
                          @selection-change="handleSelectionChange" tooltip-effect="dark" ref="multipleTable">
                    <el-table-column type="selection" width="55"></el-table-column>
                    <el-table-column prop="id" label="id" width="180"></el-table-column>
                    <el-table-column prop="name" label="权限名称" width="180"></el-table-column>
                    <el-table-column prop="sn" label="权限编号" width="180"></el-table-column>
                    <el-table-column prop="permission_id" label="相关权限" width="180"></el-table-column>
                </el-table>
                <div class="block">
                    <span class="demonstration" hidden="hidden"></span>
                    <el-pagination
                            @size-change="handleSizeChange"
                            @current-change="handleCurrentChange"
                            :current-page="currentPage"
                            :page-sizes="[5, 10, 15, 20]"
                            :page-size="10"
                            layout="total, sizes, prev, pager, next, jumper"
                            :total="totalNum">
                    </el-pagination>
                </div>
                <%-- <div style="margin-top: 5px;text-align: left;">
                     <el-button @click="toggleSelection()" style="margin: 0px;">取消选择</el-button>
                 </div>--%>

            </el-row>
        </el-main>
    </el-container>
    <!-- Form -->
    <el-dialog  width="20%" title="编辑/新增"  :visible.sync="dialogFormVisible">
        <el-form  :model="form" >
            <el-form  ref="form" :model="form" label-width="80px">
                <el-form-item label="权限名称">
                    <el-input  v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="权限编号">
                    <el-input  v-model="form.sn"></el-input>
                </el-form-item>
                <el-form-item label="相关权限">
                    <el-input  v-model="form.permission_id"></el-input>
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
    var app = new Vue({
        el:'#app',
        data:{
            //表格数据
            tableData: [],
            //多选数组
            multipleSelection: [],
            totalNum:0,
            currentPage: 1,
            pageNum:0,
            pageSize:10,
            dialogFormVisible: false,
            input:'',
            activeIndex: '1',
            activeIndex2:'1',
            activeName: 'first',
            form:{
                id:'',
                name:'',
                sn:'',
                permission_id:''
            },

        },
        methods:{
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
                            axios.post('/role/delete?id='+id,params).then(function (response) {
                                if(response.data.success){
                                    _this.$message({
                                        type: 'success',
                                        message: '删除成功!'
                                    });
                                    //刷新列表：
                                    _this.loadData();
                                }else {
                                    _this.$message({
                                        type: 'error',
                                        message: response.data.msg
                                    });
                                }
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
                let params = {"keyword":this.input};
                _this=this;
                console.debug(params);
                axios.post('/role/query',params).then(function (response) {
                    _this.tableData=response.data;
                    console.debug(response)
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
                axios.post('/role/save',params).then(function (response) {
                    if(response.data.success){
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
                axios.post('/role/findAll',param).then(function (response) {
                    console.debug(response);
                    _this.tableData= response.data;
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
