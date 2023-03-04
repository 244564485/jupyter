#include <iostream>
#include "math.h"
using namespace std;



void ThreeDigits() {

	int i, j, k;
	int sum = 0 ;
	for(i=1; i<5; i++) {
		for(j=1; j<5; j++) {
			for(k=1; k<5; k++) {
				if(i!=k&&i!=j&&j!=k) {
					sum++ ;
					printf("%d,%d,%d\n",i,j,k);
				}
			}
		}
	}

	printf("��1,2,3,4������,�����%d�黥����ͬ�����ظ����ֵ���λ��\n",sum);
}

void BonusAssign() {
	long int i;
	int bonus1,bonus2,bonus4,bonus6,bonus10,bonus;
	printf("�������� : ",bonus);
	scanf("%ld",&i);
	bonus1=100000*0.1;
	bonus2=bonus1+100000*0.75;
	bonus4=bonus2+200000*0.5;
	bonus6=bonus4+200000*0.3;
	bonus10=bonus6+400000*0.15;
	if(i<=100000)  bonus=i*0.1;
	else if(i<=200000)  bonus=bonus1+(i-100000)*0.075;
	else if(i<=400000)  bonus=bonus2+(i-200000)*0.05;
	else if(i<=600000)  bonus=bonus4+(i-400000)*0.03;
	else if(i<=1000000)  bonus=bonus6+(i-600000)*0.015;
	else  bonus=bonus10+(i-1000000)*0.01;

	printf("Ӧ������ : %d",bonus);
}

void FullSquare() {
	long int i,x,y,z;
	for (i=1; i<100000; i++) {
		x=sqrt(i+100);   /*xΪ����100�󿪷���Ľ��*/
		y=sqrt(i+268);   /*yΪ�ټ���168�󿪷���Ľ��*/
		if(x*x==i+100&&y*y==i+268) /*���һ������ƽ������ƽ�����ڸ���,��˵����������ȫƽ����*/
			printf("��ȫƽ���� : %ld\n",i);
	}
}

void Days() { 
	int day,month,year,sum,leap; 
	printf("\nplease input year,month,day : \n"); 
	scanf("%d,%d,%d",&year,&month,&day); 
	switch(month) {  /*�ȼ���ĳ����ǰ�·ݵ�������*/ 
		case 1:sum=0;    break; 
		case 2:sum=31;   break; 
		case 3:sum=59;   break; 
		case 4:sum=90;   break; 
		case 5:sum=120;  break; 
		case 6:sum=151;  break; 
		case 7:sum=181;  break; 
		case 8:sum=212;  break; 
		case 9:sum=243;  break; 
		case 10:sum=273; break; 
		case 11:sum=304; break; 
		case 12:sum=334; break; 
		default:printf("data error ! "); break; 
	} 
	sum=sum+day;  /*�ټ���ĳ�������*/ 
	if(year%400==0||(year%4==0&&year%100!=0))/*�ж��ǲ�������*/ 
		leap=1; 
	else 
		leap=0; 
	if(leap==1&&month>2)/*������������·ݴ���2,������Ӧ�ü�һ��*/ 
		sum++; 
	printf("It is the %dth day.",sum);
} 


void BigNum()  { 
	int x,y,z,t; 
	printf("\nplease input x,y,z : \n"); 	
	scanf("%d%d%d",&x,&y,&z); 
	if (x>y) 
		{t=x;x=y;y=t;} /*����x,y��ֵ*/ 
	if(x>z) 
		{t=z;z=x;x=t;}/*����x,z��ֵ*/ 
	if(y>z) 
		{t=y;y=z;z=t;}/*����z,y��ֵ*/ 
	printf("small to big: %d %d %d\n",x,y,z); 
} 

void ShapeC() { 
	printf("Hello C-world!\n"); 
	printf(" ****\n"); 
	printf(" *\n"); 
	printf(" * \n"); 
	printf(" ****\n"); 
} 

void ShapeA() 
{ 
	char a=176,b=219; 
	printf("%c%c%c%c%c\n",b,a,a,a,b); 
	printf("%c%c%c%c%c\n",a,b,a,b,a); 
	printf("%c%c%c%c%c\n",a,a,b,a,a); 
	printf("%c%c%c%c%c\n",a,b,a,b,a); 
	printf("%c%c%c%c%c\n",b,a,a,a,b);
} 

void MultiFormula() { 
	int i,j,result; 
	printf("\n"); 
	for (i=1;i<10;i++) { 	
		for(j=1;j<10;j++) { 
			result=i*j; 
	 		printf("%d*%d=%-3d",i,j,result);/*-3d��ʾ�����,ռ3λ*/ 
		} 
	printf("\n");/*ÿһ�к���*/ 
	} 
} 

void ChessBoard() { 
	int i,j; 
	for(i=0;i<8;i++)  { 
		for(j=0;j<8;j++) 
			if((i+j)%2==0) 
				printf("%c%c",219,219); 
			else 
				printf(" "); 
			printf("\n"); 
	} 
} 

void SmilingFace() { 
	int i,j; 
	printf("\1\1\n");/*�������Ц��*/ 
	for(i=1;i<11;i++) { 
		for(j=1;j<=i;j++) 
			printf("%c%c",219,219); 
		printf("\n"); 
	} 
}  

void Puffina() { 
	long f1,f2; 
	int i; 
	f1=f2=1; 
	for(i=1;i<=20;i++) 	{ 
		printf("%12ld %12ld",f1,f2); 
		if(i%2==0) printf("\n");/*�������,ÿ���ĸ�*/ 
		f1=f1+f2; /*ǰ�����¼�������ֵ����������*/ 
		f2=f1+f2; /*ǰ�����¼�������ֵ����������*/ 
	} 
} 





int main() {
//	ThreeDigits();    //��1,2,3,4������,����ɶ��ٸ�������ͬ�����ظ����ֵ���λ��?���Ƕ���
//	BonusAssign();    //��ҵ���ŵĽ�������������
//	FullSquare();     //һ������,������100����һ����ȫƽ����,�ټ���168����һ����ȫƽ����
//	Days();           //����ĳ��ĳ��ĳ��,�ж���һ������һ��ĵڼ���
//	BigNum();         //������������x,y,z,�������������С�������
//	ShapeC() ;        //��*�������ĸC��ͼ��
//	ShapeA() ;        //�������ͼ��	
//	MultiFormula() ;   //9*9�ھ�	
//	ChessBoard() ;     //������������
//	SmilingFace() ;     //Ц��
	Puffina() ;        //��������������1,1,2,3,5,8,13,21	
			
}





