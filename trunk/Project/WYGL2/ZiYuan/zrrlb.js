Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zrrlbGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"自然人列表",
		store:new Ext.data.JsonStore({
		autoLoad:true,
		url: 'zrrlb.aspx?action=list',
		fields:[
		    'id','编码','名称','描述','联系人','联系电话'
		]
	}),
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:100
		},
		{
			header:"名称",
			sortable:true,
			resizable:true,
			dataIndex:"名称",
			width:100
		},
		{
			header:"描述",
			sortable:true,
			resizable:true,
			dataIndex:"描述",
			width:100
		},
		{
			header:"联系人",
			sortable:true,
			resizable:true,
			dataIndex:"联系人",
			width:100
		},
		{
			header:"联系电话",
			sortable:true,
			resizable:true,
			dataIndex:"联系电话",
			width:100
		}
	],
	
	listeners : { // 添加监听事件
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
    var self = this;
    var form = new Ext.FormPanel({
	    id:'form1',
	    padding:10,
	    width:500,
	    items:[
	        {
                xtype:'hidden',
                name:'id'    				        
	        },
            {
                fieldLabel: '编码',
                name: '编码',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '名称',
                name: '名称',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '描述',
                name: '描述',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '助记码',
                name: '助记码',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '性别',
                name: '性别',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '出生日期',
                name: '',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '证件名称',
                name: '证件名称',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '证件号码',
                name: '证件号码',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '籍贯',
                name: '籍贯',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系电话',
                name: '联系电话',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系地址',
                name: '联系地址',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系人',
                name: '联系人',
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                xtype: 'textfield'				                           
            }
            
              
	    ],
	    buttons:[
	        {
	            text:'保存',// callback
	            handler:function (c) {		                
	                 form.getForm().submit({
	                    url:'zrrlb.aspx',
	                    params:{
	                        action: add?'add':'update'
	                    },
	                    success:function (form, action) {
	                        console.log(action.response.responseText);                                      
                            w.close();                                
                            self.store.reload();
	                    }
	                });
	            }
	        },
	        {
                text: '取消',
                handler: function (c) {
                    w.close();
                }
            }
	    ]
    });
    
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
        var w = new Ext.Window({
            title:"新增自然人",
            items:[
                form
            ]
        });
        w.show();
    },
	
	initComponent: function(){
	    var self = this;
		this.tbar=[
			{
				text:"新增",
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除自然人','确定要删除选中的自然人吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'zrrlb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除自然人','自然人删除成功！');
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
				xtype:"label",
				text:"姓名："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签"
			},
			{
				text:"搜索"
			}
		]
		Ext.Hudongsoft.zrrlbGrid.superclass.initComponent.call(this);
	}
})