import java.util.ArrayList;
import java.util.List;

class Employee{
   // ���ʵ������������ɼ�
   public String name;
   // ˽�б��������ڸ���ɼ�
   private double salary;
   //�ڹ������ж�name��ֵ
   public Employee (String empName){
      name = empName;
   }
   //�趨salary��ֵ
   public void setSalary(double empSal){
      salary = empSal;
   }  
   // ��ӡ��Ϣ
   public void printEmp(){
      System.out.println("���� : " + name );
      System.out.println("нˮ : " + salary);
   }
 
   // public static void main(String[] args){
   //    Employee empOne = new Employee("RUNOOB");
   //    empOne.setSalary(1000.0);
   //    empOne.printEmp();
   // }
}



public class Puppy{
   int puppyAge;
   static int allClicks=0;
   String str = "Hello Java World";
   public Puppy(String name){
      // �������������һ��������name
      System.out.println("С���������� : " + name ); 


   }
 
   public void setAge( int age ){
       puppyAge = age;
   }
 
   public int getAge( ){
       System.out.println("С��������Ϊ : " + puppyAge ); 
       return puppyAge;
   }
  

   static boolean bool;
   static byte by;
   static char ch;
   static double dl;
   static float fl;
   static int in;
   static long lo;
   static short sh;
   static String stri;

   public static void main(String[] args){
      /* �������� */
      Puppy myPuppy = new Puppy( "tommy" );
      /* ͨ���������趨age */
      myPuppy.setAge( 2 );
      /* ������һ��������ȡage */
      myPuppy.getAge( );
      /*��Ҳ�����������������ʳ�Ա���� */
      System.out.println("var : " + myPuppy.puppyAge ); 
      System.out.println("str : " + myPuppy.str ); 
      
      int a, b, c;
      int d0 = 3, e = 4, f0 = 5;
      byte z = 22;
      String s = "runoob";
      double pi = 3.14159;
      char x = 'X';

      System.out.println(" d0 : " + d0 + ", e : " + e +", f0 : " + f0 +", \n z : " + z +", s : " + s +", x : " + x +", pi : " + pi  ); 

      Employee empOne = new Employee("RUNOOB");
      empOne.setSalary(1000.0);
      empOne.printEmp();

      byte b1 = 100,  b2 = -50;
      System.out.println( b1 + b2);

      short s1 = 1000,  s2 = -20000;
      System.out.println(s1 - s2);

      int i1 = 10000, i2 = -200000;
      System.out.println(i1 - i2);

      float f1 = 234.5f;
      System.out.println(f1);

      double d1  = 7D ;
      double d2  = 7.; 
      double d3  =  8.0; 
      double d4  =  8.D; 
      double d5  =  12.9867; 

      System.out.println(" d1 : " + d1 + ", d2 : " + d2 +", d3 : " + d3 +", \n d4 : " + d4 +", d5 : " + d5   ); 

      boolean bo1 = true;
      System.out.println(bo1);

      char c1 = 'A';
      System.out.println(c1);

        // byte  
      System.out.println("�������ͣ�byte ������λ����" + Byte.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Byte");  
      System.out.println("��Сֵ��Byte.MIN_VALUE=" + Byte.MIN_VALUE);  
      System.out.println("���ֵ��Byte.MAX_VALUE=" + Byte.MAX_VALUE);  
      System.out.println();  

      // short  
      System.out.println("�������ͣ�short ������λ����" + Short.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Short");  
      System.out.println("��Сֵ��Short.MIN_VALUE=" + Short.MIN_VALUE);  
      System.out.println("���ֵ��Short.MAX_VALUE=" + Short.MAX_VALUE);  
      System.out.println();  

      // int  
      System.out.println("�������ͣ�int ������λ����" + Integer.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Integer");  
      System.out.println("��Сֵ��Integer.MIN_VALUE=" + Integer.MIN_VALUE);  
      System.out.println("���ֵ��Integer.MAX_VALUE=" + Integer.MAX_VALUE);  
      System.out.println();  

      // long  
      System.out.println("�������ͣ�long ������λ����" + Long.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Long");  
      System.out.println("��Сֵ��Long.MIN_VALUE=" + Long.MIN_VALUE);  
      System.out.println("���ֵ��Long.MAX_VALUE=" + Long.MAX_VALUE);  
      System.out.println();  

      // float  
      System.out.println("�������ͣ�float ������λ����" + Float.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Float");  
      System.out.println("��Сֵ��Float.MIN_VALUE=" + Float.MIN_VALUE);  
      System.out.println("���ֵ��Float.MAX_VALUE=" + Float.MAX_VALUE);  
      System.out.println();  

      // double  
      System.out.println("�������ͣ�double ������λ����" + Double.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Double");  
      System.out.println("��Сֵ��Double.MIN_VALUE=" + Double.MIN_VALUE);  
      System.out.println("���ֵ��Double.MAX_VALUE=" + Double.MAX_VALUE);  
      System.out.println();  

      // char  
      System.out.println("�������ͣ�char ������λ����" + Character.SIZE);  
      System.out.println("��װ�ࣺjava.lang.Character");  
      // ����ֵ��ʽ�������ַ���ʽ��Character.MIN_VALUE���������̨  
      System.out.println("��Сֵ��Character.MIN_VALUE=" + (int) Character.MIN_VALUE);  
      // ����ֵ��ʽ�������ַ���ʽ��Character.MAX_VALUE���������̨  
      System.out.println("���ֵ��Character.MAX_VALUE=" + (int) Character.MAX_VALUE);  

      System.out.println("Bool :" + bool);
      System.out.println("Byte :" + by);
      System.out.println("Character:" + ch);
      System.out.println("Double :" + dl);
      System.out.println("Float :" + fl);
      System.out.println("Integer :" + in);
      System.out.println("Long :" + lo);
      System.out.println("Short :" + sh);
      System.out.println("String :" + stri);

      final double PI = 3.1415927;
      System.out.println("PI :" + PI);

      byte ba = 68;
      char ca = 'A';
      System.out.println("ba :" + ba);
      System.out.println("ca :" + ca);

      int decimal = 100;
      int octal = 0144;
      int hexa =  0x64;      
      System.out.println("decimal :" + decimal);
      System.out.println("octal :" + octal);
      System.out.println("hexa :" + hexa);

      char ua = '\u6101';
      String ub = "\u5801";
      System.out.println("ua :" + ua);
      System.out.println("ub :" + ub);

      char c7='a';//����һ��char����
      int i7 = c7;//char�Զ�����ת��Ϊint
      System.out.println("char�Զ�����ת��Ϊint���ֵ���� : "+i7);
      char c8 = 'A';//����һ��char����
      int i8 = c8+1;//char ���ͺ� int ���ͼ���
      System.out.println("char���ͺ�int������ֵ���� : "+i8);

      int i9 = 123;
      byte b9 = (byte)i9;//ǿ������ת��Ϊbyte
      System.out.println("intǿ������ת��Ϊbyte���ֵ���� : " + b9);

      System.out.print("\n");

      int x1 = 10;
      while (x1 < 20) {
         System.out.print("value of x1 : " + x1);
         x1++;
         System.out.print("\n");
      }

      System.out.print("\n");

      do {
         System.out.print("value of x1 : " + x1 );
         x1++;
         System.out.print("\n");
      } while( x1 < 25 );      

      for (int x2 = 25; x2 < 30; x2 = x2 + 1) {
         System.out.print("value of x2 : " + x2);
         System.out.print("\n");
      }
 
      System.out.print("\n");

      int [] numbers = {10, 20, 30, 40, 50};

      for (int x3 : numbers) {

         if (x3 == 30) {
            continue;
         }

         if (x3 == 50) {
            break;
         }

         System.out.print(x3);
         System.out.print(",\t");
      }
      
      System.out.print("\n");
      String [] names ={"James", "Larry", "Tom", "Lacy"};
      for (String name : names) {
         System.out.print(name);
         System.out.print(",\t");
      }
      System.out.print("\n\n");

      for(int i=1; i<=3; i++){
         for(int n=1; n<=3; n++){
            //��������������
            System.out.println("i = " + i + ", n = " + n);
         }
      }

      System.out.print("\n");

      for (int i = 1; i <= 9; i++) {
         for (int j = 1; j <= i; j++) {
            System.out.print(j + "*" + i + "=" + i * j + " ");
         }
         System.out.println();
      }
      
      System.out.print("\n");

      for(int i = 1;i < 6; i ++) //��ѭ����������������ӡ����
      {
         //��ߴ�ӡ��ֱ�������οո�
         for (int j = 5; j > i; j--) //����ѭ����������ʼֵ���䣬���ʽ�仯�����ƴ�ӡ������
         {
            System.out.print(" ");
         }
         //�ұߵ���������
         for (int q = 1; q < i * 2; q++) //����ѭ����������ʼֵ���䣬���ʽ�仯����ӡ������1��3��5��7��9
         {
            System.out.print("*");
         }
         System.out.println(); //����
      }
      
      //��ӡ���ε��°벿�֣����Ϊֱ�������εĿո��ұ�Ϊ���ĵ���������
      for(int i = 1; i < 5; i++) //��ѭ����������������ӡ����
      {
         //���ֱ�������οո�
         for (int j = 1; j <= i; j++) { //����ѭ����������ʼֵ���䣬���ʽ�仯������ӡ����
            System.out.print(" ");
         }
         //�ұߵ�ֱ��������
         for (int q = i * 2; q < 9; q++) { //����ѭ����������ʼֵ�仯�����ʽ���䣬��ӡ������7��5��3��1
            System.out.print("*");
         }
         System.out.println(); //����
      }
      
      System.out.print("\n");

      for(int i = 0; i < 10; i++){
         for(int j = 0; j < 10; j++){
            System.out.print("" + i + j +"  ");
         }
         System.out.println("\n-------------------------------------- \n");
      }
      System.out.println("�����ϣ�\n");

      for(int i = 0; i < 10; i++){
         for(int j = 0; j < 10; j++){
            if(i * 10 + j > 29){
               break;
            }
            System.out.print("" + i + j +"  ");
         }
         System.out.println("\n-------------------------------------- \n");
      }
      System.out.println("�����ϣ�\n");


      lable:
      for(int i = 0; i < 10; i++){
         for(int j = 0; j < 10; j++){
            if(i * 10 + j > 29){
               break lable;
            }
            System.out.print("" + i + j +"  ");
         }
         System.out.println("\n-------------------------------------- \n");
      }
      System.out.println("�����ϣ�\n");

      // ����һ
      int sum1=1;
      for(int i=9;i>=1;i--){
         sum1=(sum1+1)*2;
      }        
      System.out.println("sum1=" + sum1);
      
      // ������
      int sum2=1;
      for (int i=1;i<=9;i++){
         sum2=(sum2+1)*2;            
      }
      System.out.println("sum2=" + sum2);
      
      System.out.println("\n");

      int x5 = 30;
      if( x5 < 20 ){
         System.out.print("���� if ���\n");
      } else if( x5 == 30 ){
         System.out.print("Value of X is 30");
      } else {
         System.out.print("���� else ���");
      }

      System.out.println("\n");


      char grade = 'C';
      System.out.println("��ĵȼ���: " + grade);

      switch(grade)
      {
         case 'A' :
            System.out.println("����"); 
            break;
         case 'B' :
         case 'C' :
            System.out.println("����");
            break;
         case 'D' :
            System.out.println("����");
            break;
         case 'F' :
            System.out.println("��Ŭ��Ŭ��");
            break;
         default :
            System.out.println("δ֪�ȼ�");
      }

      System.out.println("\n");

      Integer x6 = 500;
      x6 = x6 + 10;

      Integer x7 = 510;

      System.out.println("Integer: x6 = " + x6 + "\n");
      System.out.println(x6==x7);
      System.out.println(x6.equals(x7)); 

      System.out.println("\n");

      System.out.println("90 �ȵ�����ֵ��" + Math.sin(Math.PI/2));  
      System.out.println("0�ȵ�����ֵ��" + Math.cos(0));  
      System.out.println("60�ȵ�����ֵ��" + Math.tan(Math.PI/3));  
      System.out.println("1�ķ�����ֵ�� " + Math.atan(1));  
      System.out.println("��/2�ĽǶ�ֵ��" + Math.toDegrees(Math.PI/2));  
      System.out.println(Math.PI);

      System.out.println("\n");

      double[] nums = { 1.4, 1.5, 1.6, -1.4, -1.5, -1.6 };   
      for (double num : nums) {
         System.out.println("Math.floor( " + num + " ) = " + Math.floor(num));
         System.out.println("Math.round( " + num + " ) = " + Math.round(num));
         System.out.println("Math.ceil( " + num + " ) = " + Math.ceil(num));
      }
      
      System.out.println("\n");

      System.out.println("����\"java�̳̣��ַ���!\"\n");

      char ch1 = 'a';
      char uniChar = '\u039A'; 
      char[] charArray ={ '?', 'b', 'c', 'd', 'e' };
      Character ch2 = new Character('0');

      System.out.println(Character.isLetter(ch1));
      System.out.println(Character.isLetter(uniChar));
      System.out.println(Character.isLetter(charArray[0]));
      System.out.println(Character.isLetter(ch2));
      System.out.println(Character.isLetter(' '));
      System.out.println(Character.isLetter('5'));            

      String StrA="I am Tom.I am from China.";
      String StrB="";
      String StrC="";
      for(int i=0;i<StrA.length();i++){
         if(Character.isUpperCase(StrA.charAt(i)))
            StrB +=StrA.charAt(i)+"  ";
         if(Character.isLowerCase(StrA.charAt(i)))
            StrC +=StrA.charAt(i)+"  ";
      }
      System.out.println("�ַ����д�д��ĸ�У�"+StrB);
      System.out.println("�ַ�����Сд��ĸ�У�"+StrC ) ;

      char[] helloArray = { 'h', 'e', 'l', 'l', 'o', '!'};
      String helloString = new String(helloArray);  
      System.out.println(helloString);

      System.out.println( "�ַ������� : " + helloString.length() );
      System.out.println("1��" + helloString + StrB.concat(StrC) ); 

      System.out.println("\n");

      String Strary[] = { "First", "Second", "Third" };
      String Stra1 = "Hello Java World";
      List<String> list = new ArrayList<String>();
      list.add(Stra1);
      System.out.println("����Strary�ĳ���Ϊ : " + Strary.length);
      System.out.println("�ַ���Stra1�ĳ���Ϊ : " + Stra1.length());
      System.out.println("list��Ԫ�ظ���Ϊ : " + list.size());

      System.out.println("\n");

      System.out.println(String.format("%1$,09d", -3123));
      System.out.println(String.format("%1$9d", -31));
      System.out.println(String.format("%1$-9d", -31));
      System.out.println(String.format("%1$(9d", -31));
      System.out.println(String.format("%1$#9x", 5689));

      System.out.println("\n");

      String str11 = "a".concat("b").concat("c");
      String str2 = "a"+"b"+"c";
      String str3 = "abc";
      String str4 = new String("abc");
      System.out.println(str11 == str2); //���н��Ϊfalse
      System.out.println(str11 == str3); //���н��Ϊfalse
      System.out.println(str2 == str3); //���н��Ϊture
      System.out.println(str2 == str4); //���н��Ϊfalse
      System.out.println(str11.equals(str4)); //���н��Ϊtrue

      System.out.println("\n");


   }
}

