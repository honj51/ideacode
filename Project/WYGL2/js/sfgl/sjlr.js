Ext.namespace('Ext.Hudongsoft');

/************************************************************************/
/* 录入列表                                                             */
/************************************************************************/
Ext.Hudongsoft.sjlrGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"录入列表",
	store:new Ext.data.JsonStore({
	    //autoLoad: true,
		url: 'ajax/sfgl/sjlr.aspx?action=list',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','录入状态'
		]
	}),
	width:802,
	height:475,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:40
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
			header:"录入状态",
			sortable:true,
			resizable:true,
			dataIndex:"录入状态",
			width:100
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同开始时间",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			width:100
		},
		{
			header:"录入月份",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:70
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
		this.tbar=[
			{
				xtype:"label",
				text:"名称："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"工业园："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"类型："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"号码："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"时间："
			},
			{
				xtype:"datefield",
				fieldLabel:"标签"
			},
			{
				text:"搜索",
				iconCls: 'icon-query'
			},
			{
			    text:"查看详情",
			    iconCls: 'icon-list',
			    handler: function () {
			         var w = new Ext.Window({
                        title:"录入总表",
                        items:[
                            new Ext.Hudongsoft.lrzbGrid()
                        ]
                    });
                    w.show();
			    }
			}
			
		];
		self.store.load();
		Ext.Hudongsoft.sjlrGrid.superclass.initComponent.call(this);
	}
})

/*
 *	录入总表
 */
 
Ext.Hudongsoft.lrzbGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"录入总表",
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_zb',
		fields:[
		    'id','单据编号','客户编号','客户名称','日期','总费用','缴费金额','余额','录入状态','缴费状态'
		]
	}),
	width:600,
	height:400,
	columns:[
		{
			header:"序号",
			dataIndex:"id",
			width:40		
		},
		{
			header:"日期",
			dataIndex:"日期",
			width:100
		},
		{
			header:"总费用",
			dataIndex:"总费用",
			width:100
		},
		{
			header:"缴费金额",
			dataIndex:"缴费金额",
			width:100
		},
		{
			header:"余额",
			dataIndex:"余额",
			width:100
		},
		{
			header:"缴费状态",
			dataIndex:"缴费状态",
			width:100
		},
		{
			header:"录入状态",
			dataIndex:"录入状态",
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
		this.tbar=[
		]
		Ext.Hudongsoft.lrzbGrid.superclass.initComponent.call(this);
	}
})
