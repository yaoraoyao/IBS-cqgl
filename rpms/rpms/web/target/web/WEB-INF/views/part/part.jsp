
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <link rel="stylesheet" href="/static/css/part/part.css"/>
</head>
<body>
<div id="app">
    <el-container>
        <el-main>
            <el-row style="margin-bottom: 1px">
                <el-col :span="8" style="width:250px ;">
                    <div>
                        <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
                            <el-button slot="append" type="primary" icon="el-icon-search" @click="query()"></el-button>
                        </el-input>
                    </div>
                </el-col>
                <el-col :span="5" style="width:200px ;height: 40px ;">
                    <el-button-group >
                        <el-button class="btn-group" type="primary" icon="el-icon-plus" @click="openDialog()"></el-button>
                        <el-button class="btn-group" type="warning" icon="el-icon-edit" @click="edit()"></el-button>
                        <el-button class="btn-group" type="danger" icon="el-icon-delete" @click="remove()"></el-button>
                    </el-button-group>
                </el-col>
            </el-row>
            <el-row>
                <el-table :data="tableData" stripe style="width: 100%;text-align: center;"
                          @selection-change="handleSelectionChange" tooltip-effect="dark" ref="multipleTable">
                    <el-table-column type="selection" width="55"></el-table-column>
                    <el-table-column prop="id" label="ID" width="80"></el-table-column>
                    <el-table-column prop="name" label="配件名称" width="120"></el-table-column>
                    <el-table-column prop="price" label="配件价格" width="120"></el-table-column>
                    <el-table-column prop="num" label="配件数量" width="100"></el-table-column>
                    <el-table-column prop="warnum" label="预警数量" width="100"></el-table-column>
                    <el-table-column prop="context" label="配件介绍" width="180"></el-table-column>
                    <el-table-column prop="createtime" label="入库时间" width="150"></el-table-column>
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
            </el-row>
        </el-main>
    </el-container>
    <!-- Form -->
    <el-dialog title="编辑/新增" :visible.sync="dialogFormVisible">
        <el-form :model="form">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="配件名称">
                <el-input  v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="配件价格">
                    <el-input  v-model="form.price"></el-input>
                </el-form-item>
                <el-form-item label="配件数量">
                    <el-input  v-model="form.num"></el-input>
                </el-form-item>
                <el-form-item label="预警数量">
                    <el-input  v-model="form.warnum"></el-input>
                </el-form-item>
                <el-form-item label="配件介绍">
                    <el-input  v-model="form.context"></el-input>
                </el-form-item>
                <el-form-item label="入库时间">
                    <el-input  v-model="form.createtime"></el-input>
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
                console.debug(this.multipleSelection);
                if(this.multipleSelection ===1){
                    this.$confirm('此操作将永久删除选中的数据吗?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        _this=this;
                        let id = this.multipleSelection[0].id;
                        let params = {id:id};
                        axios.post('/part/deleteById',params).then(function (response) {
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
                            }
                        }).catch(function (){});
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
                 let _this=this;
                axios.post('/part/query',params).then(function (response) {
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
                axios.post('/part/saveOrUpdate',params).then(function (response) {
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
                axios.post('/part/queryPage',param).then(function (response) {
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
