Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.htdqtsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"合同到期列表",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/htdqts.aspx?action=list',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','增浮期'
		]	
    }),
	width:792,
	height:560,
	viewConfig : {
		getRowClass : function(record, rowIndex, rowParams, store) {
			var zfq = record.data.增浮期;
			if (!zfq) return;
			var num = new Date(zfq).dateDiff('d',new Date());
			if (num>=0) {
				return 'x-grid-record-red';
			}
		}
	},
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:160
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
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			dataIndex:"合同开始时间",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100,
		},
		{
			header:"合同状态",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			renderer: Ext.Hudongsoft.util.Format.htztRenderer()
		},
		{
		    header:"增浮期提示",
		    sortable:true,
		    dataIndex:"增浮期" ,
		    renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
		    value: new Date()
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
	    
        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
        this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"客户名称："
			},
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
			gyy_lx,
			{
				xtype:"label",
				text:"号码："
			},
			iFieldNo,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
				            iFieldName:iFieldName.getValue(),
				            iFieldNo:iFieldNo.getValue(), 
				            gyy:gyy.getValue(),
				            leix:gyy_lx.getValue()
				        };
				    self.store.load({
				        params: {
				            start:0,
		                    limit:20
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
		Ext.Hudongsoft.htdqtsGrid.superclass.initComponent.call(this);
	}
})