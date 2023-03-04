--~ g_MonitorList
--~ g_InfoQuoteList
--~ g_InfoHqList

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

 ["70"] = 14.72,
 ["152"] = 16.51,
 ["55"] = "ƽ������",
 ["34"] = 16.5,
 ["35"] = 138100,
 ["157"] = 6100,
 ["29"] = 54927,
 ["10"] = 16.48,
 ["153"] = 12000,
 ["69"] = 18,
 ["28"] = 16.44,
 ["154"] = 16.42,
 ["25"] = 3200,
 ["150"] = 16.43,
 ["156"] = 16.52,
 ["151"] = 64060,
 ["7"] = 17,
 ["6"] = 16.36,
 ["155"] = 60300,
 ["24"] = 16.46,
 ["27"] = 161555,
 ["26"] = 16.45,
 ["31"] = 147852,
 ["30"] = 16.48,
 ["33"] = 68360,
 ["32"] = 16.49,}


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
function TypeInit()   --�����滮 ��ֻ�ڳ�ʼ��ʱ��ִ��
	local param = {};
	local StrInfo = [[���ڶԴ�ͳ��MVWAP�㷨�����Ż��͸Ľ������г�ʵʱ�۸�
	С�ڴ�ʱ��VWAP�г���ʱ����ԭ�мƻ��������Ļ����Ͻ��зŴ�*1.7��������ܹ���
	�Ŵ�Ĳ��ֳɽ��򲿷ֳɽ����������ڽ���VWAP�ɽ��ۣ���֮�����г�ʵʱ
	�۸���ڴ�ʱ��VWAP�г���ʱ����ԭ�мƻ��������Ļ����Ͻ���������*0.3����Ҳ����
	�ڽ���VWAP�ɽ��ۣ��Ӷ��ﵽ���ƽ��׳ɱ���Ŀ�ġ�]];
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
	table.insert(param,dat)
--~ 	
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
	dat['Name'] = '�ֶ�����(��)';
	dat['Type'] = 'Select';
	dat['Key'] = 'Period';
	dat['List'] = {};
	list ={};
	list.Value = "oneminute" ;
	list.Name = "1" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "fiveminutes" ;
	list.Name = "5" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "fifteenminutes" ;
	list.Name = "15" ;
	table.insert(dat['List'],list);
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '��������';
	dat['Type'] = 'number';
	dat['Key'] = 'Days';
	dat['Max'] = 1000000;
	dat['Min'] = 1;
	dat['Now'] = 30;
	dat['Step'] = 1
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '�µ����';
	dat['Type'] = 'number';
	dat['Key'] = 'Second';
	dat['Max'] = 1000000;
	dat['Min'] = 1;
	dat['Now'] = 15;
	dat['Step'] = 1
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
	
	return param,StrInfo;
end



local g_nowtime;
local g_Ret;
--~ print = hx_print;
function TimerOrder(param)  								--ִ�д���
	
	g_Monitor= param.Monitor;
	g_InfoQuote= param.InfoQuote;
    g_nowtime = param.NowTime;
	g_Ret = nil;
	if g_Monitor and  next(g_Monitor) then
		g_Monitor = mvwapcontrol(g_Monitor);
	end
	return g_Monitor,g_Ret;
end

function mvwapcontrol(param)
	if param and next(param) then			
		if param.LeftQty == 0 or (tonumber(os.date("%H%M%S",g_nowtime))>=145950) then
			param['Stop'] = 1;
			return param;
		end
		
		param = mvwapinfo(param);
		if not(param['MVWAP'] and next(param['MVWAP'])) then

			param.BeginTime,param.EndTime = inittime(param.BeginTime,param.EndTime);
			if tonumber(param.BeginTime) >= tonumber(param.EndTime) then
				param['Stop'] = 1;
				return param;
			elseif tonumber(param.BeginTime)<113000 and tonumber(param.EndTime)>=130000 then
				param.TimeFlag = true;
			end
			param = mvwapinit(param);
		else
			local Flag = checkstop(param['MVWAP']);
			if Flag == 0 then
				if param.Allow == '0' then
					param['Stop'] = 1;
					return param;
				else
					param.BeginTime,param.EndTime = UpdateTime(param.BeginTime,param.EndTime,param.Second,param.MarketID);
					if param.BeginTime and param.EndTime then
						if tonumber(param.BeginTime)<113000 and tonumber(param.EndTime)>=130000 then
							param.TimeFlag = true;
						end
						param = mvwapinit(param);
					else
						param['Stop'] = 1;
						return param;
					end					
				end								
			end
		end
		
		local Time = g_nowtime;	
		--�����㷨��ʼʱ�������磬����ʱ����������һ����������µ�����
		if param and param.TimeFlag and param.EntryTime and tonumber(os.date("%H%M%S",param.EntryTime+param.Second))>113000 then
			param.EntryTime =  param.EntryTime + 1.5*3600;
			param.TimeFlag = false;			
		end
		
		if param.LeftQty >=100 and param['Stop']==0 and tonumber(param.BeginTime)<=tonumber(os.date("%H%M%S",Time)) then
			if param.LastClOrdID==nil or  ((Time-param.EntryTime)>=param.Second ) then
				if param.StockPosition  and  param.StockPosition ~='' then
					local price =  g_InfoQuote[tostring(param.StockPosition)];
					if price==nil or price==0 or price=='' then
						return param;
					end
					local Status,Ret = mvwaporder(param,price);
					
					if Status  then
						param = Ret ;
						return param;
					end					
				end	
			end
		end			
	end
	return param;
end

function UpdateTime(begintime,endtime,second,market)	 	--�����µ�������ĳ�ʼʱ�䣬�Ա��Ϊ��ɵ���������ί��
	if tonumber(endtime) >= 150000 then
		return;
	end
	
	local HH = string.sub(begintime,1,2)  
    local MM = string.sub(begintime,3,4)  
	local SS = string.sub(begintime,5,6)  
	local HH2 = string.sub(endtime,1,2)  
    local MM2 = string.sub(endtime,3,4)  
	local SS2 = string.sub(endtime,5,6)  
    local dt1 = os.time{year='2015', month='01', day='01', hour=HH,min=MM,sec=SS}; 
	local dt2 = os.time{year='2015', month='01', day='01', hour=HH2,min=MM2,sec=SS2};	
	local c= (dt2- dt1);
	
	if tonumber(begintime)<113000 and tonumber(endtime)>130000 then
		c = c- 1.5*3600;
	end
	
	local NewBegintime = dt2 + second;
	local NewEndtime = NewBegintime + c;
	if tonumber(endtime)<=113000 then		
		if tonumber(os.date("%H%M%S",NewBegintime)) > 113000 then
			NewBegintime = NewBegintime +1.5*3600;
			NewEndtime = NewBegintime + c;
		elseif tonumber(os.date("%H%M%S",NewEndtime)) > 113000 then
			NewEndtime = NewEndtime + 1.5*3600;
		end
	end

	NewBegintime = os.date("%H%M%S",NewBegintime);
	NewEndtime = os.date("%H%M%S",NewEndtime);
	
	if tonumber(NewBegintime) > 150000 then
		return;
	end
	
	if tonumber(NewEndtime) > 150000 then
		if string.sub(market,1,2) == 'SH' then
			NewEndtime = '150000'
		else			
			NewEndtime = '145700';
		end
	end	

	return NewBegintime,NewEndtime;
end

function inittime(begintime,endtime)              			--����ʼʱ�������ʱ�����
	if tonumber(endtime) >= 150000 then
		endtime = '150000';
	end
	
	if tonumber(begintime)<=93000 then
		begintime = '093000'
	end
	
	local NowTime = os.date("%H%M%S",g_nowtime);
	if tonumber(begintime) <= tonumber(NowTime) then
		begintime = tostring(NowTime);
		if tonumber(begintime) < 130000 and tonumber(begintime)>113000 then
			begintime = '130000';
		end
		
		if string.len(begintime) == 5 then
			begintime = '0'..begintime;
		end
	end
	
	if tonumber(endtime) <= tonumber(NowTime) then
		begintime = endtime;
		return begintime,endtime;
	end

	if tonumber(endtime) < 130000 and tonumber(endtime)>113000 then
		endtime = '113000';
	end
	if string.len(endtime) == 5 then
		endtime = '0'..endtime;
	end		
	
	return begintime,endtime;
end

function vwapmarket(param)									--�����г�VWAP
	local sumvalue = 0;
	local sumvol = 0;
	if param and next(param) then
		if param.market == nil then
			param.market = {};
		end
			
		if g_InfoQuote and next(g_InfoQuote) and g_InfoQuote['10'] and g_InfoQuote['49'] then
			local a = {g_InfoQuote['10'],g_InfoQuote['49']};
			table.insert(param.market,a);
			
			for i=1,#(param.market) do
				local pricevalue = param.market[i];
				sumvalue = sumvalue +  pricevalue[1]*pricevalue[2];
				sumvol = sumvol + pricevalue[2];
			end
			return sumvalue/sumvol - (sumvalue/sumvol)%0.01;
		else
			return nil;
		end		
	end
end

function checkstop(param)                               	--����Ƿ��Ѿ�����
	local flag = 0;
	if param and next(param) then
		for i=1,#param do
			if param[i][3] ~= 0 then
				flag = 1;
				break
			end
		end
	end
	return flag;
end

function UpdateRate(param) 									--���¸�K���ϵı��� 	
	
	if param and next(param) then
		local sum = 0;
		for i=1,#param do
			if param[i][2] ~= 0 then
				sum = sum + param[i][2];
			end			
		end
		
 		local sumtt = 0;
		for i=1,#param do
			if param[i][2] ~= 0 then
				n = i;
			end
		end
		
		for i=1,#param do
			if param[i][2] ~= 0 then
				m= i;
				break;
			end
		end
			
		for i =m,n-1 do
			param[i][2] = param[i][2]/sum;
			sumtt = sumtt + param[i][2];
		end
		param[n][2] = 1 - sumtt;					
	end	
	return param;
end

function mvwaporder(v,price)								--MVWAP�µ�
	local marketvwap = vwapmarket(v);
	if v and v['MVWAP'] and next(v['MVWAP']) then
		for i=1,#(v['MVWAP']),1 do
			local val = v['MVWAP'][i] ;
			local Result = false;
			local Ret;
			local qty = 0;
			if val[3]>0 then
				qty = v.LeftQty * val[2]/val[3];
				if not(marketvwap) then
					marketvwap = price;
				end

				if price >= marketvwap then
					qty = qty*0.3;
				else
					qty = qty*1.7;
				end
				
				
				if qty < 100 then
					qty = 100;
				else
					qty = math.floor(qty/100)*100;
				end
				
				if qty >= v.LeftQty  then
					qty = v.LeftQty;
				end
				
				local OrderList = {};
				OrderList.Account = v.Account
				OrderList.Side = v.Side;
				OrderList.SecurityID = v.SecurityID;
				OrderList.MarketID = v['MarketID'];
				OrderList.OrderQty = qty;
				OrderList.OrderPrice = price;
				OrderList.Key = v.Key;

				Result,Ret = OrderBuySell(OrderList);	
				g_Ret = Ret;
				if Result then
					val[2] = val[2] - val[2]/val[3];
					val[3] = val[3] - 1;
					v['MVWAP'] = UpdateRate(v['MVWAP']);					
					v['LastClOrdID'] = Ret.ClOrdID ;
					v['EntryTime'] = g_nowtime;
					--print("entytime///////////////",g_nowtime)
					return true,v;
				else
					return false,{};
				end
			end
		end
	end
	return false,{};
end

function mvwapinfo(param)                               	--������ʾĸ����Ϣ
	if param and next(param) then
		if param.Str==nil or param.Str=='' then
			param.Str = '��ص� '..param.SecurityID..',ʱ�䷶Χ'..param.BeginTime..'-'..param.EndTime..',�µ���� '..param.Second..'��,';
			if param.Side =='Sell' then
				param.Str = param.Str..' ���� ' ;
			else 
				param.Str = param.Str..' ���� '
			end
			param.Str = param.Str..param.OrderQty..'�ɣ�';
		end
	end	
	return param;
end
	
function initdate(day)										--��ʼ����������
	local enddate= os.date("%Y%m%d",g_nowtime - 24*3600)..'15'..'00';
	local time1 = os.time{year=string.sub(enddate,1,4), month=string.sub(enddate,5,6), day=string.sub(enddate,7,8), hour='09',min='30',sec='00'}
	local time2 = time1 - 24*day*3600;
	local startdate = os.date("%Y%m%d%H%M",time2);
	
	return startdate,enddate;	
end

function initkline(param)									--��930��1300ʱ����K�����ݴ���
	local a;
	local b;
	if param and next(param) then
		for i=1,#param do
			if param[i][1] == 930 then
				param[i+1][2] =  param[i+1][2] + param[i][2];
				a = i;
			end
			if param[i][1] == 1300 then
				param[i+1][2] =  param[i+1][2] + param[i][2];
				b = i;
			end
		end
		if a then
			if b then
				table.remove(param,a);
				table.remove(param,b - 1);
			else
				table.remove(param,a);
			end
		end

	end
	return param;
end

function mvwapinit(v)										--�µ�������ʼ��
	local StartDate,EndDate = initdate(v.Days);
	local Ret,ErrMsg = GetKLineHq(v.SecurityID,v.Period,StartDate,EndDate);
	
	local detail ={};
	if Ret and next(Ret) then
		local param  ={};
		for i=1,#Ret,1 do
			local value = Ret[i] ;
			local time = string.sub(value['Time'],9,12);
			if param[time]==nil  then
				param[time] = 0 ;
			end
			if param[time] then
				param[time] = param[time]+value['Vol'] ;
			end
		end
		
		
		if param and next(param) then
			for kk,vv in  pairs(param) do
				table.insert(detail,{tonumber(kk),vv});
			end
			table.sort(detail,function(a, b) return tonumber(b[1])>tonumber(a[1]) end);
		end	
		for i=1,#detail do
			if detail[i][2] == 0 then
				 detail[i][2] =  detail[i-1][2];
			end
		end	
		detail  = initkline(detail);	
	else
		return v;
	end
 	
	begintt = string.sub(v.BeginTime,1,4);
	endtt = string.sub(v.EndTime,1,4);

	if detail and next(detail) then
		local alldetail = 0;
		for i=1,#detail,1 do
			local lasttime ;
			if i==1 then
				lasttime = '0930' ;
			else 
				lasttime = detail[i-1][1] ;
			end
			if tonumber(begintt)<=tonumber(lasttime) then
				if tonumber(endtt)>=tonumber(detail[i][1]) then
					local len2 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					detail[i][2] = detail[i][2];
					detail[i][3] = len2
				else
					local len1 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					local len2 = math.floor(OrderTimeDev(endtt..'00',lasttime..'00')/60) ;
					detail[i][2] = detail[i][2]*len2/len1;
					detail[i][3] = len2
				end
			elseif tonumber(begintt)>=tonumber(lasttime) and tonumber(begintt)<tonumber(detail[i][1]) then
				if tonumber(endtt)>=tonumber(detail[i][1]) then
					local len1 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					local len2 = math.floor(OrderTimeDev(detail[i][1]..'00',begintt..'00')/60) ;
					detail[i][2] = detail[i][2]*len2/len1;
					detail[i][3] = len2
				else
					local len1 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					local len2 = math.floor(OrderTimeDev(endtt..'00',begintt..'00')/60) ;
					detail[i][2] = detail[i][2]*len2/len1;
					detail[i][3] = len2
				end
			elseif  tonumber(begintt)>=tonumber(detail[i][1]) or tonumber(endtt)<=tonumber(lasttime) then
				detail[i][2] = 0;
				detail[i][3] = 0;
			end
			alldetail = alldetail + detail[i][2];
			detail[i][3] = math.floor(detail[i][3]*60/v.Second);
		end
 		
		local sumrate = 0;
		for i=1,#detail-1,1 do
			if detail[i][2] > 0 then 
				detail[i][2] = detail[i][2]/alldetail;
				sumrate = sumrate + detail[i][2]
			end
		end
		detail[#detail][2] = 1 - sumrate;
	end
	v['MVWAP'] = detail;
	return v ;
end
	
function OrderTimeDev(Time,Time2)                        	--ʱ����㺯��
	if string.len(Time) == 5 then
		Time = '0'..Time;
	end
	if string.len(Time2) == 5 then
		Time2 = '0'..Time2;
	end
	
    local HH = string.sub(Time,1,2)  
    local MM = string.sub(Time,3,4)  
	local SS = string.sub(Time,5,6)  
	local HH2 = string.sub(Time2,1,2)  
    local MM2 = string.sub(Time2,3,4)  
	local SS2 = string.sub(Time2,5,6)  
    local dt1 = os.time{year='2015', month='01', day='01', hour=HH,min=MM,sec=SS}  
	local dt2 = os.time{year='2015', month='01', day='01', hour=HH2,min=MM2,sec=SS2 } 
	local b = dt2 ;
	local c= (dt1- dt2);
	local num = 0;
	for i=1,c,1 do 
		local new =tonumber(os.date("%H%M%S", b + i ));
		if (new>93000 and new<=113000) or (new>=130000 and new<=150000)  then 
			num=num+1;
		end
	end
    return num
end