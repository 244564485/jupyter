local g_Monitor ={};
local g_InfoQuote ={};
local g_OrderResult = {} ;
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
	local StrInfo = [[���ز�����һ�������ɽ����㷨���ײ��ԣ����г��̿���
	�����������۸��ί�е������ҴﵽԤ�����������������ʱ�������ί�У�
	�����ټ����ȴ���ֱ�����������Ļ������Ϊֹ��]];
	
	local dat ={};
	dat['Name'] = '�����۽�����(%)';
	dat['Type'] = 'decimal';
	dat['Key'] = 'ExpectPriceRate';
	dat['Min'] = -10.00;
	dat['Max'] = 10.00;
	dat['Now'] = 1.00;
	dat['Step'] = 0.01;
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '��������';
	dat['Type'] = 'number';
	dat['Key'] = 'ExpectNum';
	dat['Min'] = 100;
	dat['Max'] = 10000000000;
	dat['Now'] = 100;
	dat['Step'] = 100;
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '�۸񸡶�(%)';
	dat['Type'] = 'decimal';
	dat['Key'] = 'FloatRate';
	dat['Max'] = 1.00;
	dat['Min'] = 0.00;
	dat['Now'] = 0.10;
	dat['Step'] = 0.01;
	table.insert(param,dat)
	return param,StrInfo ;
end
                         
function TimerOrder(param)   				--ִ�д���
	g_OrderResult = {};
	g_Monitor = param.Monitor;
	g_InfoQuote = param.InfoQuote;
	
	if g_Monitor and  next(g_Monitor) then
		g_Monitor = Hiddencontrol(g_Monitor);
	end	
 	return g_Monitor,g_OrderResult;
end
--~ print =hx_print;
function Hiddencontrol(v)
	if v and next(v) then
		HiddenInfo(v);	
		if v.LeftQty == 0 then
			v['Stop'] = 1;
			return v;
		end			

		if v['Stop'] == 0 and v.LeftQty >0 then
			v = CheckCondition(v,g_InfoQuote);
			return v;
		end 
	end	
	return v;
end

function CheckCondition(param,infoQuote)
	if param.ExpectNum ==nil or param.ExpectNum =='' or param.ExpectNum < 100  then
		param['Stop'] = 1;
		return param;
	end
	
	local stockInfo={};
	local panVolum = 0;
	local Price;
	if infoQuote and next(infoQuote) then
		stockInfo.OfferPx5  			= 	infoQuote['156'];				--��������
		stockInfo.OfferQty5 			= 	infoQuote['157'];				--��������
		stockInfo.OfferPx4  			= 	infoQuote['152'];				--��������
		stockInfo.OfferQty4			 	= 	infoQuote['153'];				--��������
		stockInfo.OfferPx3 			 	= 	infoQuote['34'];				--��������
		stockInfo.OfferQty3 			= 	infoQuote['35'];				--��������
		stockInfo.OfferPx2  			= 	infoQuote['32'];				--�����۶�
		stockInfo.OfferQty2 			= 	infoQuote['33'];				--��������
		stockInfo.OfferPx1  			= 	infoQuote['30'];				--������һ
		stockInfo.OfferQty1 			= 	infoQuote['31'];				--������һ
		local LastPx					= 	infoQuote['10'];				--���¼�
		local PrevClosePx				= 	infoQuote['6'];					--�������̼�
		stockInfo.PrevClosePx			= 	PrevClosePx						--�������̼�
		local OpenPx					= 	infoQuote['7'];					--���տ��̼�
		stockInfo.LastPx				=	LastPx;							--���¼�
		
		stockInfo.BidPx5  				= 	infoQuote['154'];				--�������
		stockInfo.BidQty5 				= 	infoQuote['155'];				--��������
		stockInfo.BidPx4  				= 	infoQuote['150'];				--�������
		stockInfo.BidQty4 				= 	infoQuote['151'];				--��������
		stockInfo.BidPx3  				= 	infoQuote['28'];				--�������
		stockInfo.BidQty3 				= 	infoQuote['29'];				--��������
		stockInfo.BidPx2  				= 	infoQuote['26'];				--����۶�
		stockInfo.BidQty2 				= 	infoQuote['27'];				--��������
		stockInfo.BidPx1  				= 	infoQuote['24'];				--�����һ
		stockInfo.BidQty1 				= 	infoQuote['25'];				--������һ
		stockInfo.DailyPriceUpLimit		=	infoQuote['69'];				--��ͣ��
		stockInfo.DailyPriceDownLimit	=	infoQuote['70'];				--��ͣ��
		
		Price = stockInfo.PrevClosePx * (tonumber(param.ExpectPriceRate)/100 + 1);
		if param.Side == "Buy" then
			if stockInfo and next(stockInfo) then
				if Price >tonumber(stockInfo.OfferPx4 ) then
					panVolum = stockInfo.OfferQty1+stockInfo.OfferQty2+stockInfo.OfferQty3+stockInfo.OfferQty4+stockInfo.OfferQty5;
				elseif Price <= tonumber(stockInfo.OfferPx4) and Price >tonumber(stockInfo.OfferPx3 ) then
					panVolum = stockInfo.OfferQty1+stockInfo.OfferQty2+stockInfo.OfferQty3+stockInfo.OfferQty4;
				elseif Price <= tonumber(stockInfo.OfferPx3) and Price >tonumber(stockInfo.OfferPx2) then
					panVolum = stockInfo.OfferQty1+stockInfo.OfferQty2+stockInfo.OfferQty3;
				elseif Price <= tonumber(stockInfo.OfferPx2) and Price >tonumber(stockInfo.OfferPx1) then
					panVolum = stockInfo.OfferQty1+stockInfo.OfferQty2;
				elseif Price <= tonumber(stockInfo.OfferPx1) and Price >= stockInfo.LastPx then
					panVolum = stockInfo.OfferQty1;
				else
					panVolum = 0;
				end
			end
			
		elseif param.Side == "Sell" then	
			if stockInfo and next(stockInfo) then
				if Price <tonumber(stockInfo.BidPx4) then
					panVolum = stockInfo.BidQty1+stockInfo.BidQty2+stockInfo.BidQty3+stockInfo.BidQty4+stockInfo.BidQty5;
				elseif Price >= tonumber(stockInfo.BidPx4) and Price <tonumber(stockInfo.BidPx3 ) then
					panVolum = stockInfo.BidQty1+stockInfo.BidQty2+stockInfo.BidQty3+stockInfo.BidQty4;
				elseif Price >= tonumber(stockInfo.BidPx3) and Price <tonumber(stockInfo.BidPx2) then
					panVolum = stockInfo.BidQty1+stockInfo.BidQty2+stockInfo.BidQty3;
				elseif Price >= tonumber(stockInfo.BidPx2) and Price <tonumber(stockInfo.BidPx1) then
					panVolum = stockInfo.BidQty1+stockInfo.BidQty2;
				elseif Price >= tonumber(stockInfo.BidPx1) and Price <= stockInfo.LastPx then
					panVolum = stockInfo.BidQty1;
				else
					panVolum = 0;
				end		
			end
		end
	end
	
	if  panVolum ~= 0 and param.ExpectNum <= panVolum then
		
		local orderprice = DiffPrice(param.Side,Price,param.FloatRate,stockInfo);
 		
		local Status,Ret = HiddenOrder(param,orderprice);	
		if Status  then
			param = Ret ;
			return param;
		end	
	end
	return param;
end

function HiddenOrder(param,orderPrice)		--���������ͼ۸��µ�
	if param and next(param) then 		
		local OrderList = {} ;		
		OrderList.Account = param.Account;
		OrderList.Side = param.Side;
		OrderList.SecurityID = param.SecurityID;
		OrderList.MarketID = param['MarketID'];
		OrderList.OrderQty = param.OrderQty;
		OrderList.OrderPrice = orderPrice;
		OrderList.Key = param.Key;
		
		local Result,Ret = OrderBuySell(OrderList);
		
		if Result then
			param['LastClOrdID'] = Ret.ClOrdID ;
			g_OrderResult = Ret;
			return true,param;
		end
	end	
	return false,{};	
end

function DiffPrice(side,price,rate,stockinfo)			--����Ԥ��ĸ����۸�����¼ۣ�����ÿ���ӵ���ί�м۸�
	local a = price * rate;
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
		if stockinfo.DailyPriceUpLimit and orderprice > stockinfo.DailyPriceUpLimit then
			orderprice = stockinfo.DailyPriceUpLimit;
		end
	else
		orderprice =  price - floatprice;
		if stockinfo.DailyPriceDownLimit and orderprice < stockinfo.DailyPriceDownLimit then
			orderprice = stockinfo.DailyPriceDownLimit;
		end
	end
	return orderprice;
	
end

function HiddenInfo(param)                 	--������ʾĸ����Ϣ
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
	end	
end
