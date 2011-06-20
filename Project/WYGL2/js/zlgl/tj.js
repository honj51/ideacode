Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.fltjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"分类统计",
    store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=fltj',
		fields:[
		    '序号','工业园名称','房产类型','消费项目','月份','费用'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:100
		},
		{
			header:"工业园名称",
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"房产类型",
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:100
		},
		{
			header:"费用",
			dataIndex:"费用",
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
		    '->',
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
				text:"搜索",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.fltjGrid.superclass.initComponent.call(this);
	}
});

Ext.Hudongsoft.xxtjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"分类统计",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间'
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
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"合同状态",
			sortable:true,
			resizable:true,
			dataIndex:"",
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
		    '->',
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
				text:"搜索",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxtjGrid.superclass.initComponent.call(this);
	}
});