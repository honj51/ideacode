Ext.namespace('Ext.Hudongsoft');

/************************************************************************/
/* 录入列表                                                             */
/************************************************************************/
Ext.Hudongsoft.sjlrGrid=Ext.extend(Ext.grid.GridPanel ,{	
	jfgl: false,
	dispalyDetails: function() {
	    var self = this;
	    var r = self.getSelectionModel().getSelected();
	    if (r) {
            function printDate(f) {
                var data = r.data;
                return data[f+'_年'] + '/' + data[f+'_月'] + '/' + data[f+'_日'];
            }
            
            var html = '<table class="tab1">'+
                        '<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'合同编号：'+'</strong>'+r.data.编码+'<td>'+
                            '<td>'+'<strong>'+'客户编号：'+'</strong>'+r.data.客户编码+'<td>'+
                            '<td>'+'<strong>'+'客户名称:'+'</strong>'+r.data.客户名称+'<td>'
                        +'</tr>'
                        +'<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'联系电话：'+'</strong>'+r.data.联系电话+'<td>'+
                            '<td>'+'<strong>'+'联系地址：'+'</strong>'+r.data.联系地址+'<td>'
                        +'</tr>'+
                        '<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'所属工业园：'+'</strong>'+r.data.所属工业园+'<td>'+
                            '<td>'+'<strong>'+'房产类型：'+'</strong>'+r.data.房产类型+'<td>'+
                            '<td>'+'<strong>'+'所属房产：'+'</strong>'+r.data.所属房产+'<td>'+
                            '<td>'+'<strong>'+'合同开始时间：'+'</strong>'+printDate('合同开始时间')+'<td>'+
                            '<td>'+'<strong>'+'合同结束时间：'+'</strong>'+printDate('合同结束时间')+'<td>'+
                         '</tr>'
                        +'</table>';
            var panel = new Ext.Panel({
                title: self.jfgl?'缴费总表':'录入总表',                
                layout: 'border',                
                items: [{
                    xtype: 'panel',
                    region:'north',
                    cls: 'side_col',
                    html: html
                },
                new Ext.Hudongsoft.lrzbGrid({region:'center',jfgl: self.jfgl,zbdata:r.data})]
            });
            main_tab.add(panel).show();
	    }
	},
	listeners : { // 添加监听事件
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.dispalyDetails();
	    }
	},
	initComponent: function(){
	    var self = this;
	    self.title = self.jfgl? "缴费管理":"录入管理";
	    self.store = new Ext.data.JsonStore({
	        storeId:self.jfgl?'jiaofei':'luru',
		    url: 'ajax/sfgl/sjlr.aspx?action=list',
            root : 'data',
	        totalProperty : 'totalProperty',
		    fields:[ // id为合同id
		        'id','编码','客户名称','客户编码','联系电话','联系地址','所属工业园','所属房产','房产类型','合同开始时间_年','合同开始时间_月','合同开始时间_日','合同结束时间_年','合同结束时间_月',
		        '合同结束时间_日','合同开始时间','合同结束时间','录入状态','缴费状态','录入月份'
		    ]
	    });
	    
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
			    header:"合同开始时间",
			    sortable:true,
			    resizable:true,
			    dataIndex:"合同开始时间",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer_1,
			    width:100
		    },
		    {
			    header:"合同结束时间",
			    sortable:true,
			    resizable:true,
			    dataIndex:"合同结束时间",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer_2,
			    width:100
		    },
		    {
			    header:self.jfgl?"缴费状态":"录入状态",
			    sortable:true,
			    resizable:true,
			    dataIndex:self.jfgl?"缴费状态":"录入状态",
			    renderer:self.jfgl?Ext.Hudongsoft.util.Format.jfztRenderer():Ext.Hudongsoft.util.Format.lrztRenderer(),
			    width:100
		    },
		    {
			    header:"录入月份",
			    sortable:true,
			    resizable:true,
			    dataIndex:"录入月份",
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
	    var mc = new Ext.form.TextField({width:80});
	    var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    var hm = new Ext.form.TextField({width:80});
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
	    this.tbar=new Ext.Toolbar({		
	        enableOverflow: true,    
		    items: ['名称：',
			mc,'  ',
			'工业园：',
            gyy,'  ',
            '类型：',
            gyy_lx,'  ',
			'号码：',
			hm,'  ',
			'年：',nian,'  ',
			'月：',yue,'  ',
            {
				text:"搜索",
				iconCls: 'icon-query',
				handler: function () {
	                self.store.baseParams = {
			            mc: mc.getValue(),
                        gyy: gyy.getValue(),
                        gyy_lx: gyy_lx.getValue(),
                        hm: hm.getValue(),
                        nian: nian.getValue(),
                        yue: yue.getValue()         				            
                    };
				    self.store.load({
				        params: {
				            start: 0,limit:20
				        }
				    });
				}
			},'->',
			{
			    text:"查看详情",
			    iconCls: 'icon-list',
			    handler: function () {
			        self.dispalyDetails();
			    }
			}
			
		]});
		
		self.store.baseParams = {
	        nian:now_year,yue:now_month
	    };
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
	zbdata: null,
	jfgl: false,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_zb',
		fields:[
		    'id','序号','年份月份','单据编号','客户编号','客户名称','日期年','日期月','总费用','缴费金额','余额','录入状态','缴费状态'
		]
	}),
	width:700,
	height:500,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:60		
		},
		{
			header:"年份月份",
			dataIndex:"年份月份",
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
			renderer: Ext.Hudongsoft.util.Format.lrztRenderer(),
			width:100
		},
		{
			header:"缴费状态",
			dataIndex:"缴费状态",
			renderer: Ext.Hudongsoft.util.Format.jfztRenderer(),
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    var btnXQ = new Ext.Button({
	        text: '查看详情',
	        iconCls: 'icon-list',
	        disabled: true,
		    handler: function () {
		        var r = self.getSelectionModel().getSelected();
		        if (r) {
		            var html = '';
		            var w = new Ext.Window({
                        title:"收款详细列表",
            	        width:815,
                        autoScroll: true,
                        items:[{
                            xtype: 'panel',
                            html:'<iframe src="Print.aspx?djbh='+r.data.单据编号+ '&ny='+r.data.年份月份+'" width=800 height=500 frameborder="0" scrolling="auto"></iframe>'
                         }]
                    });
                    w.show();
		        }
		    }
	    });
	    var btnLR = new Ext.Button({
	        text: self.jfgl?'缴费':'录入',
	        iconCls: 'icon-jiSuan',
	        width:90,
	        disabled: true,
		    handler: function () {		        
		        // 录入
		        function lr() {
		            if (btnLR.text == "修改录入") {
		                if (permission_xglr == false) {
		                    Ext.Msg.alert("提示","没有权限修改已录入的数据");
		                    return;
		                }
		            }
		        	var r = self.getSelectionModel().getSelected();
				    if (!r) return;
		            var fs = ['编号','消费项目','消费类型','值','倍率','损耗','滞纳金','上月读数','读数','说明','读数输入'];
		            var xf_store = new Ext.data.JsonStore({
		                url: 'ajax/sfgl/sjlr.aspx?action=list_lr&id='+self.zbdata.id +'&xh='+r.data.序号, // id为合同id,	                    
	                    autoLoad: true,
			            fields: fs
		            });         
		            // 网格编辑器
		            var textEditor = new Ext.form.NumberField();
		            var blCombox = new Ext.BLCombox();
		            var vCombox = new Ext.SHCombox();
		            var colModel = new Ext.grid.ColumnModel({
		                columns: [{
		                    header: '编号', dataIndex: '编号', width: 40
		                },{
		                     header: '消费项目', dataIndex: '消费项目', width: 110,css:read_only_css
		                },{
		                    header: '消费类型', dataIndex: '消费类型', width: 70,css:read_only_css
		                },{
			                header: '值', dataIndex: '值', width: 70, css:read_only_css
		                },{
			                header: '倍率', dataIndex: '倍率', width: 70, css:read_only_css
		                },{
			                header: '损耗', dataIndex: '损耗',  width: 70, css:read_only_css
		                },{
			                header: '滞纳金', dataIndex: '滞纳金',  width: 60, css:read_only_css
		                },{
			                header: '上月读数', dataIndex: '上月读数', width: 80,  css:read_only_css
		                },{
			                header: '读数', dataIndex: '读数', editor: textEditor, width: 80
		                },{
			                header: '说明', dataIndex: '说明', width: 110,  css:read_only_css
		                },{
			                header: '读数输入', dataIndex: '读数输入',width: 60,css:read_only_css
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
			                text: '提交',
			                width:80,
			                iconCls: 'icon-wanChen',
			                handler: function () {
			                    var data = [];
			                    var validate_pass = true;
			                    xf_store.each(function(record){
			                        var ds = record.data.读数;
			                        if (!ds || ds == '') {
			                            validate_pass = false;
			                            return false;
			                        }
			                        data.push(record.data);
			                    });
			                    if (!validate_pass) {
			                        Ext.Msg.alert('录入','请输入读数');
			                        return;
			                    }
			                    Ext.Ajax.request({
			                         url: "ajax/sfgl/sjlr.aspx?action=lr_tj", 
			                         params: {
			                            htid: self.zbdata.id, // 合同id
			                            xh: r.data.序号,
			                            year: r.data.年份月份.split('/')[0],
			                            month: r.data.年份月份.split('/')[1],
			                            data: Ext.encode(data)
			                         },
			                         success: function () {
			                            Ext.Msg.alert('提交','数据提交成功！');
			                            self.store.reload();
			                            win.close();
			                            Ext.StoreMgr.get('luru').reload();
			                         }
			                    });			                    
			                }
			            }  
			            ]
            		});
            		var win = new Ext.Window({
            		    layout: 'fit',
			            height: 500,
			            width: 850,
            		    title: '录入',
            		    items: grid
            		});
            		win.show();
		        }
		        
		        // 缴费
		        function jf() {
		        	var r = self.getSelectionModel().getSelected();
				    if (!r) return;		            
				    Ext.Ajax.request({
				        url: 'ajax/sfgl/sjlr.aspx?action=list_jf&id='+self.zbdata.id+'&xh='+r.data.序号, // id为合同id
				            success: function(response, opts) {
                                var obj = Ext.decode(response.responseText);
                                var xf_store = new Ext.data.JsonStore({
                                    url: 'ajax/sfgl/sjlr.aspx?action=list_jf&id='+self.zbdata.id+'&xh='+r.data.序号, // id为合同id
                                    data: obj.data,
                                    fields: ['编号','收费项目','收费类型','值','倍率','损耗','滞纳金','上月读数','读数','费用','说明']
                                });         	            
                                xf_store.on("load",function (store, records) {
                                    
                                })
                                var x = obj.总金额;
                                var sf_textfield = new Ext.form.NumberField({});		            
                                var grid = new Ext.grid.GridPanel({
                                    store: xf_store,
                                    columns: [{
                                        header: '编号', dataIndex: '编号', width: 40
                                    },{
                                         header: '消费项目', dataIndex: '收费项目', width: 110
                                    },{
                                        header: '消费类型', dataIndex: '收费类型', width: 70
                                    },{
                                        header: '值', dataIndex: '值',  width: 70
                                    },{
                                        header: '倍率', dataIndex: '倍率', width: 70
                                    },{
                                        header: '损耗', dataIndex: '损耗', width: 70
                                    },{
                                        header: '滞纳金', dataIndex: '滞纳金', width: 70
                                    },{
                                        header: '上月读数', dataIndex: '上月读数',  width: 70
                                    },{
                                        header: '读数', dataIndex: '读数',  width: 80
                                    },{
                                        header: '费用', dataIndex: '费用',width: 60
                                    },{
                                        header: '说明', dataIndex: '说明',  width: 110
                                    }],
                                    tbar: {
                                        items: ['']
                                    },
                                    bbar: {
                                        items: ['总金额：￥&nbsp;',''+obj.总金额,'上次结余：￥',''+obj.上次结余,'&nbsp;&nbsp;&nbsp;需要交费金额：￥',''+obj.需要交费金额,'实收金额：&nbsp',sf_textfield]
                                    },
                                    buttons: [{
                                        text: '提交',
                                        iconCls: 'icon-wanChen',
                                        handler: function () {			                    
                                            Ext.Ajax.request({
                                                 url: "ajax/sfgl/sjlr.aspx?action=jf_tj", 
                                                 params: {
                                                    zbid: r.data.id,
                                                    缴费金额: sf_textfield.getValue(),
                                                    总费用: obj.总金额,
                                                    上次余额: obj.上次结余
                                                 },
                                                 success: function (response, opts) {
                                                    var obj = Ext.decode(response.responseText);
                                                    if (obj.success) {
                                                        Ext.Msg.alert('提交','缴费成功！');
                                                        self.store.reload();
                                                        win.close();
                                                        Ext.StoreMgr.get('jiaofei').reload();
                                                    }
                                                    else {
                                                        Ext.Msg.alert('提交失败', obj.errorMessage);                                                        
                                                    }
                                                 }
                                            });			                    
                                        }
                                    }  
                                    ]
                                });
                                var win = new Ext.Window({
                                    layout: 'fit',
                                    height: 500,
                                    width: 850,
                                    title: '缴费',
                                    items: grid
                                });
                                win.show();
                            }
				    });
		        }
		        
		        if (self.jfgl) {
		            jf();
		        }
		        else
		            lr();
		    }// handler
	    });
	    self.getSelectionModel().on('rowselect', function(sm, rowIdx, r) {
	        btnLR.setDisabled(true);
	        btnXQ.setDisabled(true);
	        if (self.jfgl) { //缴费	            
	            if (r.data.缴费状态=='已缴费') btnXQ.setDisabled(false);
	            if (r.data.缴费状态=='未缴费' && r.data.录入状态=='已录入') btnLR.setDisabled(false);
	        }	        
	        else // 录入
	        {	       
	            btnLR.setText('录入');     
	            if ((r.data.录入状态=='已录入') && (r.data.缴费状态!='不要交费')) {
	                btnXQ.setDisabled(false);
	                btnLR.setDisabled(false);
	                btnLR.setText('修改录入');
                }
	            if (r.data.录入状态=='未录入') btnLR.setDisabled(false);
	        }	            
	    });
		this.tbar=['->',btnXQ,btnLR];
		
		self.store.load({params:{
            htbh: self.zbdata.编码
		}});
		Ext.Hudongsoft.lrzbGrid.superclass.initComponent.call(this);
	}
})

/*
 *	收款详细列表 (收款收据)
 */
Ext.Hudongsoft.sksjGrid=Ext.extend(Ext.grid.GridPanel ,{
    djbh: null,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_lb',
		fields:[
		    'id','序号','收费项目','收费类型','上月读数','本月读数','值','倍率','损耗','总量','滞纳金','费用','录入状态'
		]
	}),
	width:700,
	height:400,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:40		
		},
		{
			header:"收费项目",
			dataIndex:"收费项目",
			width:100
		},
		{
			header:"上月读数",
			dataIndex:"上月读数",
			width:60
		},
		{
			header:"本月读数",
			dataIndex:"本月读数",
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
			dataIndex:"总量",
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
		self.store.load({params:{
		    djbh: self.djbh
		}});
		Ext.Hudongsoft.sksjGrid.superclass.initComponent.call(this);
	}
})
