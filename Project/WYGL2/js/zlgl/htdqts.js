Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.htdqtsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"��ͬ�����б�",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/htdqts.aspx?action=list',
		fields:[
		    'id','����','�ͻ�����','������ҵ԰','��������','��ͬ��ʼʱ��','��ͬ����ʱ��','������'
		]	
    }),
	width:792,
	height:560,
	viewConfig : {
		getRowClass : function(record, rowIndex, rowParams, store) {
			var zfq = record.data.������;
			if (!zfq) return;
			var num = new Date(zfq).dateDiff('d',new Date());
			if (num>=0) {
				return 'x-grid-record-red';
			}
		}
	},
	columns:[
		{
			header:"���",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"����",
			sortable:true,
			resizable:true,
			dataIndex:"����",
			width:160
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
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			dataIndex:"��ͬ��ʼʱ��",
			width:100
		},
		{
			header:"��ͬ����ʱ��",
			sortable:true,
			resizable:true,
			dataIndex:"��ͬ����ʱ��",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"��ͬ״̬",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			renderer: Ext.Hudongsoft.util.Format.htztRenderer()
		},
		{
		    header:"��������ʾ",
		    sortable:true,
		    resizable:true,
		    dataIndex:"������" ,
		    //value: new Date(),
		    renderer: Ext.Hudongsoft.util.Format.dateRenderer()		    
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
		
		var iFieldName = new Ext.form.TextField({ //����������
            emptyText:'������ͻ�����',
	        width:100
    	   
        });
        
        var iFieldNo = new Ext.form.TextField({ //����������
            emptyText:'��������',
	        width:150
    	   
        });
	    
        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
        this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"�ͻ����ƣ�"
			},
			iFieldName,
			{
				xtype:"label",
				text:"��ҵ԰��"
			},
			gyy,
			{
				xtype:"label",
				text:"���ͣ�"
			},
			gyy_lx,
			{
				xtype:"label",
				text:"���룺"
			},
			iFieldNo,
			{
				text:"����",
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
});