Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gyyglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"工业园管理列表",
	store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'gyygl.aspx?action=list',
		fields:[
		    'id','序号','工业园名称','工业园面积'
		]
	}),
	width:778,
	height:544,
	columns:[
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"序号",
			width:100
		},
		{
			header:"工业园名称",
			sortable:true,
			resizable:true,
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"工业面积（平方米）",
			sortable:true,
			resizable:true,
			dataIndex:"工业园面积",
			width:120
		}
	],
	listeners : {
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	showDetailWindow: function (add, data) { // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
        var form = new Ext.FormPanel({	
            padding: 10,
            width: 250,
            items: [{
                xtype: 'hidden',
                name: 'id'
            },{
                fieldLabel: '序号',
                name: '序号',
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '工业园名称',
                name: '工业园名称',
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '工园业面积',
                name: '工业园面积',
                allowBlank:false,
                xtype: 'textfield'				                           
            }],
            buttons: [{
                text: '保存',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'gyygl.aspx',
                        params: {
                            action: add?'add':'update'
                        },
                        success: function (form, action) {  
                            console.log(action.response.responseText);                                      
                            w.close();
                            self.store.reload();
                        }
                    });
                }
            },{
                text: '取消',
                handler: function (c) {
                    w.close();
                }
            }]
        });
        
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title: '添加工业园',				        
	        items:[
	            form
	        ]
	    });
	    w.show();
	},
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"添加工业园",
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改工业园",
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除工业园",
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除工业园','确定要删除选中工业园吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'gyygl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除工业园','工业园删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			{
				text:"编辑房产类型"
			}
		]
		Ext.Hudongsoft.gyyglGrid.superclass.initComponent.call(this);
	}
})