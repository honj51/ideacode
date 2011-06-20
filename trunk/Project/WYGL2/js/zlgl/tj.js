Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.fltjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"����ͳ��",
    store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=fltj',
		fields:[
		    '���','��ҵ԰����','��������','������Ŀ','�·�','����'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			dataIndex:"���",
			width:100
		},
		{
			header:"��ҵ԰����",
			dataIndex:"��ҵ԰����",
			width:100
		},
		{
			header:"��������",
			dataIndex:"��������",
			width:100
		},
		{
			header:"������Ŀ",
			dataIndex:"������Ŀ",
			width:100
		},
		{
			header:"�·�",
			dataIndex:"�·�",
			width:100
		},
		{
			header:"����",
			dataIndex:"����",
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
				text:"���ƣ�"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���ͣ�"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���룺"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				text:"����",
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
    title:"����ͳ��",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    'id','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','��ͬ����ʱ��'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"���",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"����",
			width:100
		},
		{
			header:"�ͻ�����",
			sortable:true,
			resizable:true,
			dataIndex:"�ͻ�����",
			width:100
		},
		{
			header:"������ҵ԰",
			sortable:true,
			resizable:true,
			dataIndex:"������ҵ԰",
			width:100
		},
		{
			header:"��������",
			sortable:true,
			resizable:true,
			dataIndex:"��������",
			width:100
		},
		{
			header:"��ͬ��ʼʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ��ʼʱ��",
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ����ʱ��",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"��ͬ״̬",
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
				text:"���ƣ�"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���ͣ�"
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				xtype:"label",
				text:"���룺"
			},
			{
				xtype:"textfield",
				fieldLabel:"��ǩ",
				width:70
			},
			{
				text:"����",
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