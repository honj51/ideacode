Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.htdqtsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"合同到期列表",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/htdqts.aspx?action=list',
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
			width:100
		},
		{
		    header:"增浮期提示",
		    sortable:true,
		    dataIndex:"" 
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
			leix,
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
				            leix:leix.getValue()
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