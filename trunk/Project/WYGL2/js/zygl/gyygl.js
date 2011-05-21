Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gyyglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"工业园管理列表",
	store:new Ext.data.JsonStore({
		url: 'ajax/zygl/gyygl.aspx?action=list',
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
            width: 360,
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
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zygl/gyygl.aspx',
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
                iconCls: 'icon-cancel',
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
				iconCls: 'icon-group-create',
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改工业园",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除工业园",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除工业园','确定要删除选中工业园吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/gyygl.aspx?action=delete',
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
				text:"编辑房产类型",
				iconCls: 'icon-xieGenJin',
				handler:function () {
				    var r = self.getSelectionModel().getSelected();
				    //console.log(r.json.工业园名称);
				    var lxstore = new Ext.data.JsonStore({
                        url: 'ajax/zygl/gyygl.aspx?action=lx_list&find_id='+r.json.工业园名称,
                        fields:[
                            'id','序号','工业园名称','房产类型'
                        ]
	                }); 
	                
	                var lxgird = new Ext.grid.GridPanel({
	                    store:lxstore,
	                    layout:'fit',
	                    columns:[
	                                {
			                            header:"编号",
			                            sortable:true,
			                            resizable:true,
			                            dataIndex:"序号",
			                            width:200
			                           
		                            },
		                            {
			                            header:"房产类型",
			                            sortable:true,
			                            resizable:true,
			                            dataIndex:"房产类型",
			                            width:300
			                            
		                            }
	                            ]
	                            ,
	                            listeners : {
	                                celldblclick: function(grid, rowIndex, columnIndex, e) {
	                                    var d = grid.store.getAt(rowIndex);	
	                                    showLx(false, d.data);
	                                }
	                            }
	                });
	                
	                function showLx(add,data) {
	                    var lxform = new Ext.FormPanel({
	                        padding:10,
	                        items:[
	                            {
	                                xtype: 'hidden',
                                    name: 'id',
                                    value: r.json.id 
	                            },
                                {
                                    xtype: 'hidden',
                                    name: '工业园名称',
                                    value: r.json.工业园名称    
                                },
                                {
                                    fieldLabel:'编号',
                                    name:'序号',
                                    allowBlank:false,
                                    xtype: 'textfield' 
                                },
                                {
                                    fieldLabel:'房产类型',
                                    name:'房产类型',
                                    allowBlank:false,
                                    xtype: 'textfield' 
                                }
                                
                            ],
                            buttons:[
                                {
                                    text: '保存',
                                    iconCls: 'icon-save',
                                    handler:function () {
                                        lxform.getForm().submit({
                                            url: 'ajax/zygl/gyygl.aspx',
                                            params: {
                                                action:add? 'addlx':'updatelx'
                                            },
                                            success: function (form, action) {  
                                                //console.log(action.response.responseText);                                      
                                                lxWin.close();
                                                lxstore.reload();
                                            }
                                        });
                                    } 
                                },
                                {
                                    text: '取消',
                                    iconCls: 'icon-cancel',
                                    handler: function () {
                                        lxWin.close();
                                    }
                                }
                            ]
	                    });
                        var lxWin = new Ext.Window({
                            title:'类型',
                            width:300,
                            height:150,
                            layout:'fit',
                            items:[                                     
                                   lxform 
                            ]
                        });
                        
                    if (!add && data) {
                        lxform.getForm().setValues(data);
                    }
                    
                    lxWin.show();
	                }        
	                       
				    var win = new Ext.Window({
				        title:"房产类型列表",
				        width:600,
				        height:400,
				        layout:'fit',
				        tbar:[
				            {
				                text:"新增类型",
				                iconCls: 'icon-group-create',
				                handler:function(){
				                    showLx(true,null);
                                }
				            },
				            {
				                text:"修改类型",
				                iconCls: 'icon-group-update',
				                handler:function () {
				                    var d = lxgird.getSelectionModel().getSelected();
                                    showLx(false,d.data); 
				                    
				                }
				            },
				            {
				                text:"删除类型",
				                iconCls: 'icon-group-delete',
				                handler: function () {
				                    var d = lxgird.getSelectionModel().getSelected();
				                    if (d) {
				                        Ext.Msg.confirm('删除房产类型','确定要删除选中的房产类型吗？',function(btn){
							                if(btn == 'yes') {
								                Ext.Ajax.request({
									                url:'ajax/zygl/gyygl.aspx?action=deletelx',
									                success:function(){
										                Ext.Msg.alert('删除房产类型','房产类型删除成功！');
										                lxstore.reload();
									                },
									                params:{id: d.get('id')}
								                });
							                }
						                });
				                    }				    
				                }
				            },
				            {
				                text:"编辑房产消费列表",
				                iconCls: 'icon-xieGenJin',
				                handler:function () {
				                    var d = lxgird.getSelectionModel().getSelected();
				                    var fcxfStore = new Ext.data.JsonStore({
				                        url: 'ajax/zygl/gyygl.aspx?action=fcxf_list',
		                                fields:[
		                                    'id','序号','工业园名称','房产类型','消费项目','消费类型','值','倍率','损耗','滞纳金','说明'
		                                ],
		                                baseParams:{
		                                    gyyName:d.data.工业园名称,
		                                    fclx:d.data.房产类型
		                                }
				                    });
				                    //console.log(d);
				                    
				                    
				                    var fcxfGird = new Ext.grid.GridPanel({
	                                    store:fcxfStore,
	                                    columns:[
                                            {
	                                            header:"编号",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"序号",
	                                            width:50
        			                           
                                            },
                                            {
	                                            header:"消费项目",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"消费项目",
	                                            width:100
        			                            
                                            },
                                            {
                                                header:"消费类型",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"消费类型",
	                                            width:100
                                            },
                                            {
                                                header:"值",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"值",
	                                            width:100
                                            },
                                            {
                                                header:"倍率",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"倍率",
	                                            width:100
                                            },
                                            {
                                                header:"损耗",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"损耗",
	                                            width:100
                                            },
                                            {
                                                header:"滞纳金",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"滞纳金",
	                                            width:100
                                            },
                                            {
                                                header:"说明",
	                                            dataIndex:"说明",
	                                            width:100
                                            }
                                        ]
	                                });
	                                var fcxfWin = new Ext.Window({
	                                    layout:'fit',
	                                    width:800,
	                                    height:400,
	                                    tbar:[
	                                        {
	                                            text:"新增房产消费",
	                                            iconCls: 'icon-group-create',
	                                            handler:function(){
	                                                var xflx = new Ext.form.ComboBox({
                                                        fieldLabel:'消费类型',
                                                        width:130,
                                                        mode:'local',
                                                        name:'消费类型',
                                                        triggerAction:'all',
                                                        editable:false,
                                                        store:new Ext.data.SimpleStore({
                                                            fields : ['myId','displayText'],
                                                            data :[['递增','递增'],['固定','固定'],['单价','单价'],['动态','动态']]
                                                        }),
                                                        emptyText:'请选择',
                                                        valueField:'myId',
                                                        displayField:'displayText'
                                                     });
                                                     
                                                     var beilv = new Ext.form.ComboBox({
                                                        fieldLabel:'倍率',
                                                        width:130,
                                                        mode:'local',
                                                        name:'倍率',
                                                        triggerAction:'all',
                                                        editable:false,
                                                        store:new Ext.data.SimpleStore({
                                                            fields : ['myId','displayText'],
                                                            data :[[0,0],[10,10],[20,20],[30,30],[40,40],[50,50],[60,60],[70,70],[80,80],[90,90],[100,100]]
                                                        }),
                                                        emptyText:'请选择',
                                                        valueField:'myId',
                                                        displayField:'displayText'
                                                     });
                                                     
                                                    var sunhao = new Ext.form.ComboBox({
                                                        fieldLabel:'损耗',
                                                        width:130,
                                                        mode:'local',
                                                        hiddenName:'损耗',
                                                        triggerAction:'all',
                                                        editable:false,
                                                        store:new Ext.data.SimpleStore({
                                                            fields : ['myId','displayText'],
                                                            data :[[0,'0%'],[1,'1%'],[2,'2%'],[3,'3%'],[4,'4%'],[5,'5%'],[6,'6%'],[7,'7%'],[8,'8%'],[9,'9%'],[10,'10%'],[11,'11%']
                                                                    ,[12,'12%'],[13,'13%'],[14,'14%'],[15,'15%'],[16,'16%'],[17,'17%'],[18,'18%'],[19,'19%'],[20,'20%']]
                                                        }),
                                                        emptyText:'请选择',
                                                        valueField:'myId',
                                                        displayField:'displayText'
                                                     });
                                                     
                                                     var znj = new Ext.form.ComboBox({
                                                        fieldLabel:'滞纳金',
                                                        width:130,
                                                        mode:'local',
                                                        hiddenName:'滞纳金',
                                                        triggerAction:'all',
                                                        editable:false,
                                                        store:new Ext.data.SimpleStore({
                                                            fields : ['myId','displayText'],
                                                            data :[[0,'0%'],[1,'1%'],[2,'2%'],[3,'3%'],[4,'4%'],[5,'5%'],[6,'6%'],[7,'7%'],[8,'8%'],[9,'9%'],[10,'10%'],[11,'11%']
                                                                    ,[12,'12%'],[13,'13%'],[14,'14%'],[15,'15%'],[16,'16%'],[17,'17%'],[18,'18%'],[19,'19%'],[20,'20%']]
                                                        }),
                                                        emptyText:'请选择',
                                                        valueField:'myId',
                                                        displayField:'displayText'
                                                     });
                                                     
	                                                var fcxfUiForm = new Ext.FormPanel({
	                                                    padding:10,
	                                                   	items:[
	                                                        {
	                                                            xtype: 'hidden',
                                                                name: 'id'
	                                                        },
	                                                        {
	                                                            xtype: 'hidden',
                                                                name: '房产类型',
                                                                value: d.data.房产类型 
	                                                        },
                                                            {
                                                                xtype: 'hidden',
                                                                name: '工业园名称',
                                                                value: d.data.工业园名称    
                                                            },
                                                            {
                                                                fieldLabel:'编号',
                                                                name:'序号',
                                                                allowBlank:false,
                                                                xtype: 'textfield' 
                                                            },
                                                            {
                                                                fieldLabel:'消费项目',
                                                                name:'消费项目',
                                                                allowBlank:false,
                                                                xtype: 'textfield' 
                                                            },
                                                           xflx,
                                                            {
                                                                fieldLabel:'值',
                                                                name:'值',
                                                                allowBlank:false,
                                                                xtype: 'textfield' 
                                                            },
                                                            beilv,
                                                            sunhao,
                                                            znj,
                                                            {
                                                                fieldLabel:'说明',
                                                                name:'说明',
                                                                allowBlank:false,
                                                                xtype: 'textfield' 
                                                            }
                                                            
                                                            
                                                        ],
                                                        buttons:[
                                                            {
                                                                text: '保存',
                                                                iconCls: 'icon-save',
                                                                
                                                                handler:function () {
                                                                       console.log(fcxfUiForm.getForm().getValues());
//                                                                    fcxfUiForm.getForm().submit({
//                                                                        url: 'ajax/zygl/gyygl.aspx',
//                                                                        params: {
//                                                                            action:'add_fcxf'
//                                                                        },
//                                                                        success: function (form, action) {  
//                                                                            //console.log(action.response.responseText);                                      
//                                                                            fcxfWinUi.close();
//                                                                            fcxfStore.reload();
//                                                                        }
//                                                                    });
                                                                } 
                                                            },
                                                            {
                                                                text: '取消',
                                                                iconCls: 'icon-cancel',
                                                                handler: function () {
                                                                    fcxfWinUi.close();
                                                                }
                                                            }
                                                        ]
	                                                });
	                                                
                                                    var fcxfWinUi  = new Ext.Window({
                                                        layout:'fit',
                                                        width:460,
                                                        height:300,
                                                        items:[
                                                            fcxfUiForm
                                                        ]
                                                    });
                                                    
                                                    fcxfWinUi.show();
                                                }
	                                        },
	                                        {
	                                            text:"删除房产消费",
	                                            iconCls: 'icon-group-update',
	                                            handler:function () {
	                                              // var d = lxgird.getSelectionModel().getSelected();
                                                   
                        		                    
	                                            }
	                                        }
	                                    ],
				                        items:[
				                            fcxfGird
				                        ]
				                    });
				                    fcxfWin.show();
				                    fcxfStore.load();
				                }
				            }
				        ],
				        items:[
				            lxgird
				        ]
				        
				    });
				    win.show();
				    lxstore.load();
				    
				
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.gyyglGrid.superclass.initComponent.call(this);
	}
})