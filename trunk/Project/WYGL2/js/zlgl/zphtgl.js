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
            items: [{
                xtype: 'hidden',
                name: 'id'
            },
            {
                fieldLabel: '编码',
                name: '编码',
                width:226,
                readOnly: true,
                value: '自动产生',                
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
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()				                           
            },
            {
                fieldLabel: '合同结束时间',
                name: '合同结束时间',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()					                           
            },
            {
                fieldLabel: '操作时间',
                name: '操作时间',
                width:226,
                readOnly: true,
                format: 'Y-m-d H:i:s',
                xtype: 'datefield',
                value: new Date()					                           
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
            console.log(data);
            function trim_time(f,data) {
                var d = data[f];
                return d.substring(0,d.indexOf(' '));                
            }
            data.合同开始时间 = trim_time('合同开始时间',data);
            data.合同结束时间 = trim_time('合同结束时间',data);
            console.log(data);
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title: '添加合同',				        
            width:366,
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
				    var r = self.getSelectionModel().getSelected();
				    if (!r) return;
		            var fs = ['编号','消费项目','消费类型','值','倍率','损耗','滞纳金','前期读数','说明','读数导入','项目导入'];
		            var xf_store = new Ext.data.JsonStore({
		                url: 'ajax/zlgl/zphtgl.aspx?action=edit_gdxfx&id='+r.data.id,
	                    root : 'data',
	                    autoLoad: true,
			            fields: fs
		            });         
		            var colModel = new Ext.grid.ColumnModel({
		                columns: [{
		                    header: '编号', dataIndex: '编号', width: 40
		                },{
		                     header: '消费项目', dataIndex: '消费项目', width: 120,css:read_only_css
		                },{
		                    header: '消费类型', dataIndex: '消费类型', width: 80,css:read_only_css
		                },{
			                header: '值', dataIndex: '值', editor: textEditor, width: 70, renderer: valueRenderer
		                },{
			                header: '倍率', dataIndex: '倍率', editor: blCombox, width: 70, renderer: valueRenderer
		                },{
			                header: '损耗', dataIndex: '损耗', editor: vCombox, width: 70, renderer: percentRenderer
		                },{
			                header: '滞纳金', dataIndex: '滞纳金', editor: vCombox, width: 70, renderer: percentRenderer
		                },{
			                header: '前期读数', dataIndex: '前期读数', editor: textEditor, width: 80, renderer: valueRenderer
		                },{
			                header: '说明', dataIndex: '说明', editor: textEditor, width: 120
		                },{
			                header: '读数导入', dataIndex: '读数导入',width: 60,css:read_only_css
		                },{
			                header: '项目导入', dataIndex: '项目导入',width: 60,css:read_only_css
		                }],
		                isCellEditable: function(col, row) {
                            var record = xf_store.getAt(row);
                            if (record.get(fs[col]) == '-') { // replace with your condition
                              return false;
                            }
                            return Ext.grid.ColumnModel.prototype.isCellEditable.call(this, col, row);
                        }
		            });		            
		            
				    var grid = new Ext.grid.EditorGridPanel({
			            store: xf_store,
			            colModel: colModel,
			            tbar: ['注意:灰色项为不可编辑项。','->',{
			                text: '导入到合同',
			                handler: function () {
			                    var data = [];
			                    xf_store.each(function(record){
			                        data.push(record.data);
			                    });
			                    Ext.Ajax.request({
			                         url: "ajax/zlgl/zphtgl.aspx?action=import_gdxfx", 
			                         params: {
			                            id: r.data.id,
			                            data: Ext.encode(data)
			                         },
			                         success: function () {
			                            Ext.Msg.alert('固定消费项导入','数据导入成功！');
			                            win.close();
			                         }
			                    });			                    
			                }
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