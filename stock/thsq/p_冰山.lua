local g_Monitor ={};
local g_InfoQuote ={};
--[[                                

g_Monitor   -- ĸ�������Ϣ  
{
["Key"] = 1,    --��ر�ʶ
 ["LeftQty"] = 0,
["MarketID"] = "SZA",
["TradeVolume"] = 0,
 ["Account"] = "15396614",
 ["Side"] = "Buy",
 ["Symbol"] = "ƽ������",
 ["Stop"] = 0,
 ["SecurityID"] = "000001",
 ["OrderQty"] = 100,
 ["LastClOrdID"] = "274302218",   --����һ��������ż�¼
                               ---  ��������
  
 ["Str"] = "��ص� 000001,ʱ�䷶Χ1422-142300,�µ���� 15��, ���� 100�ɣ�",    --�Զ�������Ϣ�涨
 ["ClOrdID"] = {         --�ӵ�������¼
 [1] = {
 ["index"] = 1,    --������ʾ�����ʶ �����Բ�����
 ["Price"] = 16.48,
 ["UserID"] = "15396614",
 ["OrdType"] = "Limit",
 ["OrderStatus"] = "δ�ɽ�",
 ["ClOrdID"] = "274302218",
 ["CxlQty"] = 0,
 ["TradeVolume"] = 0,
 ["SecurityExchange"] = "SZA",
 ["Side"] = "Buy",
 ["Symbol"] = "ƽ������",
 ["OrderQty"] = 100,
 ["AvgPx"] = 0,
 ["OrderEntryTime"] = "14:22:18",
 ["OrdStatus"] = "δ�ɽ�",
 ["TradeDate"] = "20150413",
 ["StatusMsg"] = "",
 ["SecurityID"] = "000001",}
},

g_InfoQuote   -- ��صĹ�Ʊ��10������
{

 ["70"] = 14.72,                    ��ͣ��       
 ["152"] = 16.51,		            ����
 ["55"] = "ƽ������",				֤ȯ����
 ["34"] = 16.5,                      ����
 ["35"] = 138100,					������
 ["157"] = 6100,					������					
 ["29"] = 54927,					������
 ["10"] = 16.48,					�ּ�
 ["153"] = 12000,					������
 ["69"] = 18,						��ͣ��
 ["28"] = 16.44,					����
 ["154"] = 16.42,					����
 ["25"] = 3200,						��һ��
 ["150"] = 16.43,					����
 ["156"] = 16.52,					����
 ["151"] = 64060,					������				
 ["7"] = 17,						����
 ["6"] = 16.36,						����
 ["155"] = 60300,					����
 ["24"] = 16.46,					��һ
 ["27"] = 161555,					�����
 ["26"] = 16.45,					���
 ["31"] = 147852,					��һ��
 ["30"] = 16.48,					��һ
 ["33"] = 68360,					������
 ["32"] = 16.49,}					����
 
 
 
  ["70"] = 16.34,
 ["152"] = 18.21,
 ["55"] = "�ַ�����",
 ["34"] = 18.2,
 ["35"] = 997702,
 ["157"] = 254596,
 ["29"] = 233300,
 ["10"] = 18.18,
 ["153"] = 167162,
 ["69"] = 19.98,
 ["28"] = 18.14,
 ["154"] = 18.12,
 ["25"] = 58815,
 ["150"] = 18.13,
 ["156"] = 18.22,
 ["151"] = 486013,
 ["7"] = 18.3,
 ["6"] = 18.16,
 ["155"] = 507093,
 ["24"] = 18.16,
 ["27"] = 280800,
 ["26"] = 18.15,
 ["31"] = 126377,
 ["30"] = 18.18,
 ["33"] = 910603,
 ["32"] = 18.19,


g_InfoHq = {};      --��صĹ�Ʊ�ĵ��շ�ʱ����
{

 ["1"] = {      --ʱ���
 [1] = "201504130930",
 [2] = "201504130931",
},
 ["10"] = {  --����
 [1] = 16.93,
 [2] = 16.87,
},}

OrderBuySell(Param)  �����µ�  
Param.Account  --�����˺�
Param.Side  --�������� Buy Sell
Param.SecurityID  --��Ʊ����
Param.MarketID  --�г�����
Param.OrderQty -- �µ�����
Param.OrderPrice --�µ��۸�

���� true,Ret ���� false; trueΪ�µ��ɹ���falseΪʧ�� 
Ret ��ϢΪ 
Ret['SecurityID'] 
Ret['Side']
Ret['OrderQty']
Ret['Price']
Ret['ClOrdID']


OrderCancel(Param)
Param.Account  --�����˺�
Param.SecurityID --��Ʊ����
Param.ClOrdID  --���ĺ�ͬ���
���� true ���� false; trueΪ�µ��ɹ���falseΪʧ��
GetKLineHq(code,period,begintime,endtime)  -- �������� ret,err

]]--
--[[
	Name  ��ʾ�Ĳ�������
	Type  �����������ʽ  time date number decimal text �ֱ��� ʱ�� ���� ���� С�� �ı� 
		   SelectΪѡ��� 
	Key   ���淵�ص����Զ˵Ĳ���keyֵ
	Max/Min/Now  ���ֵ ��Сֵ������ֵ ��ֻ��time date number decimal text���� ������text��Max��Minֵ
	List  ��Selectѡ��� ���е�һ����Ϣ['List']����ValueΪ�޶����ص�ֵ NameΪ��ʾ����Ϣ



]]--
function TypeInit()   						--�����滮 ��ֻ�ڳ�ʼ��ʱ��ִ��
	local param = {};
	local StrInfo = [[��ɽ�㷨��ͨ����һ���ܴ�ĵ��Ӳ�ֳɼ���С�ĵ��ӡ�
	ÿ��ֻ�ύһ��С�����ȸ�С��ȫ���ɽ������ύ��һ��С����ֱ������
	�󵥳ɽ����Ϊֹ��]];
	
	local dat ={};
	local NowTT = os.date("%H%M%S");
	if tonumber(NowTT) <= 93000 then
		dat['Now'] = '09:30:00';
	elseif tonumber(NowTT) >113000 and tonumber(NowTT)<=130000 then
		dat['Now'] = '13:00:00';
	elseif tonumber(NowTT)>=150000 then
		dat['Now'] = '15:00:00';
	else
		if #NowTT==5 then
			NowTT = '0'..NowTT;
		end
		dat['Now'] = string.sub(NowTT,1,2)..':'..string.sub(NowTT,3,4)..':'..string.sub(NowTT,5,6);
	end
	dat['Name'] = '��ʼʱ��';
	dat['Type'] = 'time';
	dat['Key'] = 'BeginTime';
	dat['Max'] = '15:00:00';
	dat['Min'] = '00:00:00';
	table.insert(param,dat);
	local dat ={};
	dat['Name'] = '����ʱ��';
	dat['Type'] = 'time';
	dat['Key'] = 'EndTime';
	dat['Max'] = '15:00:00';
	dat['Min'] = '09:30:00';
	dat['Now'] = '15:00:00';
	table.insert(param,dat);
	local dat ={};
	dat['Name'] = 'ί�м۸�';
	dat['Type'] = 'Select';
	dat['Key'] = 'StockPosition';
	dat['List'] = {};
	local list ={};
	list.Value = "10" ;
	list.Name = "���¼�" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "24" ;
	list.Name = "��1��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "26" ;
	list.Name = "��2��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "28" ;
	list.Name = "��3��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "150" ;
	list.Name = "��4��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "154" ;
	list.Name = "��5��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "30" ;
	list.Name = "��1��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "32" ;
	list.Name = "��2��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "34" ;
	list.Name = "��3��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "152" ;
	list.Name = "��4��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "156" ;
	list.Name = "��5��" ;
	table.insert(dat['List'],list);
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '�۸񸡶�(%)';
	dat['Type'] = 'decimal';
	dat['Key'] = 'FloatRate';
	dat['Max'] = 1.0;
	dat['Min'] = 0.0;
	dat['Now'] = 0.1;
	dat['Step'] = 0.1;
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = 'ÿ��ռ��(%)';
	dat['Type'] = 'decimal';
	dat['Key'] = 'Rate';
	dat['Max'] = 100.0;
	dat['Min'] = 0.1;
	dat['Now'] = 5.0;
	dat['Step']=0.1;
	table.insert(param,dat);
	local dat ={};
	dat['Name'] = '���������';
	dat['Type'] = 'Select';
	dat['Key'] = 'Allow';
	dat['List'] = {};
	list ={};
	list.Value = "0" ;
	list.Name = "������" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "1" ;
	list.Name = "����" ;
	table.insert(dat['List'],list);
	table.insert(param,dat);
	local dat ={};
	dat['Name'] = 'δ�ɽ�����';
	dat['Type'] = 'Select';
	dat['Key'] = 'CanCel';
	dat['List'] = {};
	list ={};
	list.Value = "0" ;
	list.Name = "������" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "0.25" ;
	list.Name = "15��" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "0.5" ;
	list.Name = "30��" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "1" ;
	list.Name = "60��" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "1.5" ;
	list.Name = "90��" ;
	table.insert(dat['List'],list);
	table.insert(param,dat);
	
	return param,StrInfo ;
end
    
---print = hx_print;	
	
local g_nowtime;	
local g_Ret;	
function TimerOrder(param)   				--ִ�д���
	g_Monitor = param.Monitor;
	g_InfoQuote = param.InfoQuote;
	
	g_nowtime = param.NowTime;
	g_Ret = nil;
	if g_Monitor and  next(g_Monitor) then
		g_Monitor= Icecontrol(g_Monitor);
	end	
 	return g_Monitor,g_Ret;
end

function Icecontrol(v)
	if v and next(v) then
		if tonumber(v.EndTime)<=tonumber(v.BeginTime) then
			v['Stop'] = 1;
			return v;
		end
		
		IceInfo(v);	
		JudgeCanCel(v);
		
		local TimeFlag = JudgeTime(v.EndTime,v.Allow); 
		if v.LeftQty == 0 or TimeFlag == 0 or (tonumber(os.date("%H%M%S",g_nowtime))>=145000) then
			v['Stop'] = 1;
			return v;
		end			
				
		local OrderFlag = JudgeOrder(v);
		if v['Stop'] == 0 and v.LeftQty >0 and OrderFlag == 1 and tonumber(os.date("%H%M%S",g_nowtime))>=tonumber(v.BeginTime) then				
			if g_InfoQuote['10'] and  g_InfoQuote['10'] ~='' then				
				local NewPrice =  g_InfoQuote['10'];
				if NewPrice==nil or NewPrice==0 or NewPrice=='' then
						return v;
					end
					
				local vol = IceVol(v);
				local Status,Ret = IceOrder(v,vol,NewPrice);	

				if Status  then
					v = Ret ;
					return v;
				end					
			end															
		end
	end	
	return v;
end

function JudgeCanCel(param)					--��Ԥ��ĳ�������ڣ���δ�ɽ����ӵ����г���
	if param and next(param) then
		local canceltime = initcancel(param.CanCel);
		if param.ClOrdID and canceltime then
			local OrderClOrdID = param.ClOrdID;
			
			for i=1,#OrderClOrdID do
				local OrderStr = OrderClOrdID[i].OrderStatus;
				if OrderStr and not(string.find(OrderStr,'�ѳ�')) and not(string.find(OrderStr,'��')) then
					local timestep;
					if OrderClOrdID[i].OrderEntryTime then
						timestep = JudgeStep(OrderClOrdID[i].OrderEntryTime);
					end
					 
					if timestep and timestep >= canceltime then
						local OrderList = {};
						OrderList.Account = param.Account;
						OrderList.SecurityID = param.SecurityID;
						OrderList.ClOrdID = OrderClOrdID[i].ClOrdID;						
						local Result,Err = OrderCancel(OrderList);
						if Result or string.find(Err,'�ѳ���') then
							param['ClOrdID'][i].OrderStatus = "�ѳ�";
						elseif string.find(Err,'�ѳɽ�') then
							param['ClOrdID'][i].OrderStatus = "�ѳ�";	
						end	
						return;
					end					
				end				
			end
		end
	end
end

function JudgeStep(time)					--�жϵ�ǰʱ�����ӵ�ί��ʱ���ʱ���
	local nowtime = os.date("%H%M%S",g_nowtime);
	local HH = string.sub(nowtime,1,2)  
    local MM = string.sub(nowtime,3,4)  
	local SS = string.sub(nowtime,5,6)
	local time = string.sub(time,1,2)..string.sub(time,4,5)..string.sub(time,7,8) ;
	local HH2 = string.sub(time,1,2)  
    local MM2 = string.sub(time,3,4)  
	local SS2 = string.sub(time,5,6)  
    local dt1 = os.time{year='2015', month='01', day='01', hour=HH,min=MM,sec=SS}  
	local dt2 = os.time{year='2015', month='01', day='01', hour=HH2,min=MM2,sec=SS2} 
	local a = dt1 - dt2;
	
	if tonumber(nowtime)>=130000 and tonumber(time)<=113000 then
		a = a - 1.5*3600;
	end
	
	return a;	
end

function initcancel(flag)					--��ʼ���������ʱ��
	if flag == '0' then
		return;
	elseif flag == '0.25' then
		return 15;	
	elseif flag == '0.5' then
		return 30;
	elseif flag == '1' then
		return 60;
	elseif flag == '1.5' then
		return 90;
	end
end

function JudgeTime(endtime,allow)			--�жϳ����趨�Ľ���ʱ����Ƿ����
	local nowtime = os.date("%H%M%S",g_nowtime);
	if tonumber(nowtime) >= tonumber(endtime) then
		if allow == '0' then
			return 0;
		end
	end
	return 1;
end

function JudgeOrder(param)					--�ж�������ɵ��ӵ��Ƿ��Ѿ���ȫ�ɽ��򳷵�
	local Flag = 0;
	if param and next(param) then
		if param.ClOrdID and next(param.ClOrdID) then
			local Hisorder = param.ClOrdID;
			local sumorder = 0;
			
			for i=1,#Hisorder do
				local orderstr = Hisorder[i].OrderStatus;
				if orderstr and (orderstr =='�ѳ�' or orderstr =='�ѳ�') then
					sumorder = sumorder+1;
				end
			end
			
			if sumorder == #Hisorder then
				Flag = 1;
			end
		else
			Flag = 1;
		end
	end
	return Flag;
end

function IceVol(param)						--����ÿ���ӵ�������
	if param and next(param) then
		if param.everyvol == nil or param.everyvol == '' then
			param.everyvol = math.floor(param.OrderQty * param.Rate/100/100)*100;
		end
	end

	return param.everyvol;
	
end

function IceOrder(param,vol,newprice)		--���������ͼ۸��µ�
	if param and next(param) then 
		if vol < 100 then
			vol = 100;
		end
		
		if vol > param.LeftQty then
			vol = param.LeftQty;
		end	
		
		local price = DiffPrice(param.Side,newprice,param.FloatRate);
		local OrderList = {} ;		
		OrderList.Account = param.Account;
		OrderList.Side = param.Side;
		OrderList.SecurityID = param.SecurityID;
		OrderList.MarketID = param['MarketID'];
		OrderList.OrderQty = vol;
		OrderList.OrderPrice = price;
		OrderList.Key = param.Key;
		local Result,Ret = OrderBuySell(OrderList);
		g_Ret = Ret;
		if Result then
			param.EntryTime = g_nowtime;	
			param['LastClOrdID'] = Ret.ClOrdID ;	
			return true,param;
		end
	end	
	return false,{};	
end

function DiffPrice(side,price,rate)			--����Ԥ��ĸ����۸�����¼ۣ�����ÿ���ӵ���ί�м۸�
	local a = price*rate;
	local b = a%1;
	local floatprice;
	if b>=0.5 then
		floatprice = (a-b+1)/100;
	else
		floatprice = (a-b)/100;
	end
	
	local orderprice;
	if side == 'Buy' then
		orderprice =  price + floatprice;
		if g_InfoQuote['69'] and orderprice > tonumber(g_InfoQuote['69']) then
			orderprice = tonumber(g_InfoQuote['69']);
		end
	else
		orderprice =  price - floatprice;
		if g_InfoQuote['70'] and orderprice < tonumber(g_InfoQuote['70']) then
			orderprice = tonumber(g_InfoQuote['70']);
		end
	end
	return orderprice;
	
end

function IceInfo(param)                 	--������ʾĸ����Ϣ
	if param and next(param) then
		if param.Str==nil or param.Str=='' then
			param.Str = '��ص� '..param.SecurityID..',';
			if param.Side =='Sell' then
				param.Str = param.Str..' ���� ' ;
			else 
				param.Str = param.Str..' ���� '
			end
			param.Str = param.Str..param.OrderQty..'�ɣ�';
		end
		
--~ 		if param.initflag == nil or param.initflag == '' then
--~ 			local NowTime = os.date("%H%M%S",os.time());
--~ 			if tonumber(param.BeginTime) <= math.max(93000,tonumber(NowTime)) then
--~ 				param.BeginTime = tostring(math.max(930,tonumber(NowTime)));
--~ 				if tonumber(param.BeginTime) < 130000 and tonumber(param.BeginTime)>113000 then
--~ 					param.BeginTime = '130000';
--~ 				end
--~ 				
--~ 				if string.len(param.BeginTime) == 5 then
--~ 					param.BeginTime = '0'..param.BeginTime;
--~ 				end
--~ 			end

--~ 			if tonumber(param.EndTime) <= math.min(150000,tonumber(NowTime)) then
--~ 				param.EndTime = tostring(math.min(150000,tonumber(NowTime)));
--~ 				if tonumber(param.EndTime) < 130000 and tonumber(param.EndTime)>113000 then
--~ 					param.EndTime = '113000';
--~ 				end
--~ 				
--~ 				if string.len(param.EndTime) == 5 then
--~ 					param.EndTime = '0'..param.EndTime;
--~ 				end		
--~ 			end
--~ 			param.initflag = 1;
--~ 		end
	end	
end