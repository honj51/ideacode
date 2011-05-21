Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zrrlbGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"自然人列表",
		store:new Ext.data.JsonStore({
		root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/zrrlb.aspx?action=list',
		fields:[
		    'id','编码','名称','描述','联系人','联系电话','助记码','性别','证件名称','证件号码','籍贯','联系地址','备注','出生日期'
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
    
    var sex = new Ext.form.ComboBox({
        fieldLabel:'性别',
        width:226,
        mode:'local',
        name:'性别'
        triggerAction:'all',
        editable:false,
        store:new Ext.data.SimpleStore({
            fields : ['myId','displayText'],
            data :[['男','男'],['女','女']]
        }),
        value:'男',
        valueField:'myId',
        displayField:'displayText'
     });
     
    var jiGuan = new Ext.form.ComboBox({
        fieldLabel:'籍贯',
        name:'籍贯',
        width:226,
        mode:'local',
        name:'籍贯',
        triggerAction:'all',
        editable:false,
        store:new Ext.data.SimpleStore({
            fields : ['id','Text'],
            data :[['河北省','河北省'],['山西省','山西省'],['辽宁省','辽宁省'],['吉林省','吉林省'],['黑龙江省','黑龙江省'],['江苏省','江苏省'],['浙江省','浙江省'],['安徽省','安徽省'],['福建省','福建省'],
                    ['江西省','江西省'],['山东省','山东省'],['河南省','河南省'],['湖北省','湖北省'],['湖南省','湖南省'],['广东省','广东省'],['海南省','海南省'],['四川省','四川省'],['贵州省','贵州省'],
                    ['云南省','云南省'],['陕西省','陕西省'],['甘肃省','甘肃省'],['青海省','青海省'],['台湾省','台湾省'],['北京市','北京市'],['天津市','天津市'],['重庆市','重庆市'],['上海市','上海市'],
                    ['香港','香港'],['澳门','澳门'],['内蒙古','内蒙古'],['广西','广西'],['宁夏','宁夏'],['新疆','新疆'],['西藏','西藏']]  
        }),
        emptyText:'请选择',
        valueField:'id',
        displayField:'Text'
     });
    
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
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '名称',
                name: '名称',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '描述',
                name: '描述',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '助记码',
                name: '助记码',
                width:226,
                xtype: 'textfield'				                           
            },
            sex,
            {
                fieldLabel: '出生日期',
                name: '出生日期',
                width:226,
                xtype: 'datefield'				                           
            },
            {
                fieldLabel: '证件名称',
                name: '证件名称',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '证件号码',
                name: '证件号码',
                width:226,
                xtype: 'textfield'				                           
            },
            jiGuan,
//            {			
//				xtype:"combo",
//				triggerAction:"all",
//				name: '籍贯',
//				fieldLabel:"籍贯",
//				width:226,
//			
//            },
            {
                fieldLabel: '联系电话',
                name: '联系电话',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系地址',
                name: '联系地址',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系人',
                name: '联系人',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                width:226,
                height:63,
                xtype: 'textarea'				                           
            }
            
              
	    ],
	    buttons:[
	        {
	            text:'保存',// callback
	            iconCls: 'icon-save',
	            handler:function (c) {		                
	                 form.getForm().submit({
	                    url:'ajax/zygl/zrrlb.aspx',
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
                iconCls: 'icon-cancel',
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
	    var iField = new Ext.form.TextField({ //搜索栏
            emptyText:'请输入姓名',
	        width:150,
    	   
        });
        this.bbar = new Ext.PagingToolbar({ //分页控件
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"新增",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除自然人','确定要删除选中的自然人吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/zrrlb.aspx?action=delete',
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
			'->',
			{
				xtype:"label",
				text:"姓名："
			},
			iField,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    //iField:iField.getValue()
				    
				    self.store.load({
				        params:{
				            iField:iField.getValue()
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
		Ext.Hudongsoft.zrrlbGrid.superclass.initComponent.call(this);
	}
})