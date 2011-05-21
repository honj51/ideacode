Ext.namespace('Ext.Hudongsoft')

Ext.Hudongsoft.zphtglGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"合同列表",
	store:new Ext.data.JsonStore({
		url: 'ajax/zlgl/zphtgl.aspx?action=list',
		root : 'data',
		totalProperty : 'totalProperty',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','合同状态','操作时间','备注'
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
			width:200
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同开始时间",
			width:150
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			width:150,
			format:"m/d/Y"
		},
		{
			header:"合同状态",
			sortable:true,
			resizable:true,
			dataIndex:"合同状态",
			width:100
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
            width:366,
            items: [{
                xtype: 'hidden',
                name: 'id'
            },
            {
                fieldLabel: '编码',
                name: '编码',
                width:226,
                allowBlank:false,
                xtype: 'textfield'				                           
            },
             {
                fieldLabel: '客户名称',
                name: '客户名称',
                width:226,
                allowBlank:false,
                xtype: 'textfield'				                           
            },
            
            {
                fieldLabel: '所属工业园',
                name: '所属工业园',
                width:226,
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '所属房产',
                name: '所属房产',
                width:226,
                allowBlank:false,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '合同开始时间',
                name: '合同开始时间',
                width:226,
                allowBlank:false,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '合同结束时间',
                name: '合同结束时间',
                width:226,
                allowBlank:false,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '操作时间',
                name: '操作时间',
                width:226,
                disabled:true,
                allowBlank:false,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                width:226,
                height:60,
                allowBlank:false,
                xtype: 'textfield'				                           
            }
           
            ],
            buttons: [{
                text: '保存',
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zlgl/zphtgl.aspx',
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
	        title: '添加合同',				        
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
	    
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
		
		var iFieldName = new Ext.form.TextField({ //搜索栏名称
            emptyText:'请输入客户姓名',
	        width:100
    	   
        });
        
        var iFieldNo = new Ext.form.TextField({ //搜索栏号码
            emptyText:'请输入编号',
	        width:150
    	   
        });
        
        var gyy = new Ext.form.ComboBox({
			triggerAction:"all",
			fieldLabel:"标签",
			width: 100,
			editable: false,
			store: new Ext.data.JsonStore({
			    autoLoad:true,
			    url: "ajax/zlgl/zphtgl.aspx?action=fclx_list",
			    fields: ['gyyName']
			}),
			displayField: 'gyyName',
			valueField: 'gyyName',
			emptyText:'请选择',
			listeners: {
			    'select' : function(combo, record,index){
			        lx_store.reload({params : {
			            gyy: combo.value
			        }});
			    }
			}
        });
        
        var leix = new Ext.form.ComboBox({
				editable: false,
				width: 100,
				triggerAction:"all",
				fieldLabel:"标签",
				emptyText:'请选择',
				store: lx_store,
				displayField: 'lx',
				valueField: 'lx'  
        });
        
		this.tbar=[		    
			{
				text:"新增合同",
				iconCls: 'icon-group-create',
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改合同",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除合同",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除合同','确定要删除选中合同吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/zphtgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除合同','合同删除成功！');
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
				text:"编辑固定消费项目",
				iconCls: 'icon-xieGenJin',
				handler: function() {
				    var bl_data = [];
				    for(var i=0;i<=100;i++) {
				        bl_data[i] = [i];
				    }				 
				    var v_data = [];
				    for(var i=0;i<=20;i++) {
				        v_data[i] = [''+i+'%'];
				    }   
		            var textEditor = new Ext.form.TextField();
		            var blCombox = new Ext.form.ComboBox({ //倍率
			            store : new Ext.data.SimpleStore({
				            fields : ['v'],
				            data : bl_data
			            }),
			            valueField : 'v',
			            displayField : 'v',
			            mode : 'local',
			            triggerAction : 'all'
		            });         
		            var vCombox = new Ext.form.ComboBox({ //损耗,滞纳金
			            store : new Ext.data.SimpleStore({
				            fields : ['v'],
				            data : v_data
			            }),
			            valueField : 'v',
			            displayField : 'v',
			            name: 'v',
			            value: 'text',
			            mode : 'local',
			            triggerAction : 'all'
		            });         
		            var read_only_css = 'background-color: #FFFFAA;border-style:solid;border-color:#0000ff;';
				    var grid = new Ext.grid.EditorGridPanel({
			            store: new Ext.data.JsonStore({
				            fields: ['编号','消费项目','消费类型','值','倍率','损耗','滞纳金','前期读数','说明','读数导入','项目导入'],
            				data: [{编号:1,消费项目:'aaa',消费类型:'ccc',值:111,倍率:33,损耗:'2%',滞纳金:'33%',前期读数:323,说明:'xxx',读数导入:'√',项目导入:'×'}]
			            }),
			            columns: [{
			                header: '编号', dataIndex: '编号', width: 40
			            },{
			                 header: '消费项目', dataIndex: '消费项目', width: 120,css:read_only_css
			            },{
			                header: '消费类型', dataIndex: '消费类型', width: 80,css:read_only_css
			            },{
				            header: '值', dataIndex: '值', editor: textEditor, width: 70
			            },{
				            header: '倍率', dataIndex: '倍率', editor: blCombox, width: 70
			            },{
				            header: '损耗', dataIndex: '损耗', editor: vCombox, width: 70
			            },{
				            header: '滞纳金', dataIndex: '滞纳金', editor: vCombox, width: 70
			            },{
				            header: '前期读数', dataIndex: '前期读数', editor: textEditor, width: 80
			            },{
				            header: '说明', dataIndex: '说明', editor: textEditor, width: 120
			            },{
				            header: '读数导入', dataIndex: '读数导入',width: 60,css:read_only_css
			            },{
				            header: '项目导入', dataIndex: '项目导入',width: 60,css:read_only_css
			            }],
			            buttons: [{
			                text: '确定'
			            },{
			                text: '取消'
			            }   
			            ]
            		});
            		var win = new Ext.Window({
            		    layout: 'fit',
			            height: 500,
			            width: 900,
            		    title: '固定消费项目',
            		    items: grid
            		});
            		win.show();
				}
			},
			'->',
	        iFieldName,
			{
				xtype:"label",
				text:"工业园："
			},
            gyy,
			{
				xtype:"label",
				text:"类型："
			},
            leix,
            iFieldNo,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.load({
				        params:{
				            iFieldName:iFieldName.getValue(),
				            iFieldNo:iFieldNo.getValue(), 
				            gyy:gyy.getValue(),
				            leix:leix.getValue()
				        }
				    });			
				}
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.zphtglGrid.superclass.initComponent.call(this);
	}
})