//获取数据
function loadData() {
    axios.get("/employee/findAll",{}).then(function (res) {
        app.tableData=res.data;
    }).catch(function () {
    });
}
//提交数据
function save() {
    var params = this.form;
    _this=this;
    axios.get("/employee/save",params).then(function (response) {
        if(response.data.success()){
            _this.dialogFormVisible=false;
            _this.loadData();
        }else {
            this.$message({
                type:'erroe',
                message:response.data.msg
            })
        }
    }).catch(function () {});
}
