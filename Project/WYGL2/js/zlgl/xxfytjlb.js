Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xxfytjlbGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"详细费用统计列表",
	store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    '序号','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','月份','费用'
		]	
    }),
	width:843,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:40
		},
		{
			header:"编码",
			dataIndex:"编码",
			width:100
		},
		{
			header:"客户名称",
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			dataIndex:"合同开始时间",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"合同结束时间",
			dataIndex:"合同结束时间",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:70,
			format:"m/d/Y"
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:50,
			format:"0,000.00"
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
				fieldLabel:"标签"
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
				text:"费用类型："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"日期："
			},
			{
				xtype:"datefield",
				fieldLabel:"标签"
			},
			{
				text:"搜索"
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxfytjlbGrid.superclass.initComponent.call(this);
	}
})