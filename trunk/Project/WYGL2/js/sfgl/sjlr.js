﻿Ext.namespace('Ext.Hudongsoft');

/************************************************************************/
/* 录入列表                                                             */
/************************************************************************/
Ext.Hudongsoft.sjlrGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"录入列表",
	jfgl: false,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list',
        root : 'data',
	    totalProperty : 'totalProperty',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间_年','合同开始时间_月','合同开始时间_日','合同结束时间_年','合同结束时间_月','合同结束时间_日','合同开始时间','合同结束时间','录入状态','缴费状态'
		]
	}),
	width:802,
	height:475,	
	initComponent: function(){
	    var self = this;
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
	    self.columns = [
		    {
			    header:"序号",
			    sortable:true,
			    resizable:true,
			    dataIndex:"id",
			    width:60
		    },
		    {
			    header:"编码",
			    sortable:true,
			    resizable:true,
			    dataIndex:"编码",
			    width:150
		    },
		    {
			    header:"客户名称",
			    sortable:true,
			    resizable:true,
			    dataIndex:"客户名称",
			    width:70
		    },
		    {
			    header:"所属工业园",
			    sortable:true,
			    resizable:true,
			    dataIndex:"所属工业园",
			    width:80
		    },
		    {
			    header:"所属房产",
			    sortable:true,
			    resizable:true,
			    dataIndex:"所属房产",
			    width:80
		    },
		    {
			    header:self.jfgl?"缴费状态":"录入状态",
			    sortable:true,
			    resizable:true,
			    dataIndex:self.jfgl?"缴费状态":"录入状态",
			    width:100
		    },
		    {
			    header:"合同开始时间",
			    sortable:true,
			    resizable:true,
			    dataIndex:"合同开始时间",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer,
			    width:100
		    },
		    {
			    header:"合同结束时间",
			    sortable:true,
			    resizable:true,
			    dataIndex:"合同结束时间",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer,
			    width:100
		    },
		    {
			    header:"录入月份",
			    sortable:true,
			    resizable:true,
			    dataIndex:"",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthRenderer,
			    width:70
		    }
	    ];
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    // 搜索变量
	    var mc = new Ext.form.TextField({});
	    var mc = new Ext.form.TextField({});
	    var mc = new Ext.form.TextField({});
	    var mc = new Ext.form.ComboBox({});
		this.tbar=new Ext.Toolbar({		    
		    items: [{
				xtype:"label",
				text:"名称："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:100
			},'  ',
			{
				xtype:"label",
				text:"工业园："
			},
			{
				xtype:"combo",
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
				listeners: {
				    'select' : function(combo, record,index){
				        lx_store.reload({params : {
				            gyy: combo.value
				        }});
				    }
				}
			},'  ',
			{
				xtype:"label",
				text:"类型："
			},
			{   
			    xtype:"combo",
				editable: false,
				width: 100,
				triggerAction:"all",
				fieldLabel:"标签",
				store: lx_store,
				displayField: 'lx',
				valueField: 'lx'
			},'  ',
			{
				xtype:"label",
				text:"号码："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:100
			},'  ',
			'年：',new Ext.YearCombox(),'  ',
			'月：',new Ext.MonthCombox(),'  ',
            {
				text:"搜索",
				iconCls: 'icon-query',
				handler: function () {
				    self.store.load({
				        params: {
				            
				        }
				    });
				}
			},'->',
			{
			    text:"查看详情",
			    iconCls: 'icon-list',
			    handler: function () {
			         var w = new Ext.Window({
                        title:"录入总表",
                        layout: 'fit',
                        items:[
                            new Ext.Hudongsoft.lrzbGrid()
                        ]
                    });
                    w.show();
			    }
			}
			
		]});
		self.store.load({
		    params: {
		        start: 0,limit:20
		    }
		});
		Ext.Hudongsoft.sjlrGrid.superclass.initComponent.call(this);
	}
})

/*
 *	录入总表 (收费总表)
 */
Ext.Hudongsoft.lrzbGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"录入总表",
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_zb',
		fields:[
		    'id','单据编号','客户编号','客户名称','日期','总费用','缴费金额','余额','录入状态','缴费状态'
		]
	}),
	width:700,
	height:500,
	columns:[
		{
			header:"序号",
			dataIndex:"id",
			width:60		
		},
		{
			header:"日期",
			dataIndex:"日期",
			width:100
		},
		{
			header:"总费用",
			dataIndex:"总费用",
			width:80
		},
		{
			header:"缴费金额",
			dataIndex:"缴费金额",
			width:80
		},
		{
			header:"余额",
			dataIndex:"余额",
			width:80
		},
		{
			header:"录入状态",
			dataIndex:"录入状态",
			width:100
		},
		{
			header:"缴费状态",
			dataIndex:"缴费状态",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[{
		    text: '查看详情',
		    handler: function () {
		        var w = new Ext.Window({
                        title:"收款详细列表",
                        layout: 'fit',
                        items:[
                            new Ext.Hudongsoft.sksjGrid()
                        ]
                    });
                    w.show();
		    }
		},{
		    text: '录入',
		    handler: function () {
		    
		    }
		}];
		self.store.load();
		Ext.Hudongsoft.lrzbGrid.superclass.initComponent.call(this);
	}
})

/*
 *	收款详细列表 (收款收据)
 */
Ext.Hudongsoft.sksjGrid=Ext.extend(Ext.grid.GridPanel ,{
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_lb',
		fields:[
		    'id','收费项目','收费类型','日期','值','读数','倍率','损耗','滞纳金','费用','录入状态'
		]
	}),
	width:700,
	height:400,
	columns:[
		{
			header:"序号",
			dataIndex:"id",
			width:40		
		},
		{
			header:"收费项目",
			dataIndex:"收费项目",
			width:100
		},
		{
			header:"上月读数",
			dataIndex:"读数",
			width:60
		},
		{
			header:"本月读数",
			dataIndex:"读数",
			width:60
		},
		{
			header:"倍率",
			dataIndex:"倍率",
			width:60
		},
		{
			header:"损耗",
			dataIndex:"损耗",
			width:60
		},
		{
			header:"总量",
			dataIndex:"",
			width:60
		},
		{
			header:"值",
			dataIndex:"值",
			width:60
		},
		{
			header:"滞纳金",
			dataIndex:"滞纳金",
			width:60
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:60
		},
		{
			header:"说明",
			dataIndex:"说明",
			width:80
		}
	],
	initComponent: function(){
	    var self = this;
		this.tbar=['->',{
		    text: '打印',
		    handler: function () {		        
		    }
		}];
		self.store.load();
		Ext.Hudongsoft.sksjGrid.superclass.initComponent.call(this);
	}
})
