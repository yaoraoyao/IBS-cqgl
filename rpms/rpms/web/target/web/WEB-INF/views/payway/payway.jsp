
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付管理</title>
    <%@include file="/WEB-INF/views/common.jsp"%>
    <link rel="stylesheet" href="/static/css/part/part.css"/>
</head>
<body>
<div id="app">
    <el-container>
        <el-main>
            <el-row style="margin-bottom: 1px">
                <el-col :span="2" style="width:60px ;height: 40px ;">
                    <el-button class="btn-group" type="primary" icon="el-icon-plus" @click="openDialog()"></el-button>
                </el-col>
                <el-col :span="2" style="width: 60px ;height: 40px ;">
                    <el-button-group >
                        <el-button class="btn-group" type="warning" icon="el-icon-edit" @click="edit()"></el-button>
                    </el-button-group>
                </el-col>
            </el-row>
            <el-row>
                <el-table :data="tableData" stripe style="text-align: center;"
                          @selection-change="handleSelectionChange" tooltip-effect="dark" ref="multipleTable">
                    <el-table-column type="selection" width="55"></el-table-column>
                    <el-table-column prop="id" label="序号" width="80"></el-table-column>
                    <el-table-column prop="way" label="支付方式" width="120"></el-table-column>
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
        <el-form :model="payway" label-width="120px">
                <el-form-item label="支付方式">
                <el-input  v-model="payway.way"></el-input>
                </el-form-item>
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
            payway:{
                way:''
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
                this.payway={};
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
                // var params=this.form;
                // console.debug(params);
                // _this = this;
                // axios.post('/payway/saveOrUpdate',params).then(function (response) {
                //     if(response.data.status){
                //         _this.dialogFormVisible =false;
                //         _this.loadData();
                //     }else {
                //         this.$message({
                //             type:'error',
                //             message:response.data.msg
                //         })
                //     }
                // }).catch(function (){});
                axios.post("/payway/saveOrUpdate", this.payway)
                    .then((response) => {
                        //成功后的回调
                        //console.log(res);
                        let data = response.data;
                        if(data.success) {
                            //成功
                            this.$message({
                                message: data.msg,
                                type: 'success'
                            });
                            //重新加载table
                            this.loadData();
                            //关闭模态框
                            this.dialogFormVisible = false;
                        } else {
                            //失败
                            this.$message.error(data.msg);
                        }
                    });
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
                axios.post('/payway/findAll',param).then(function (response) {
                    console.debug(response.data);
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
