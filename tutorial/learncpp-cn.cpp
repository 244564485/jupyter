
////////////////
// ��C���ԵıȽ�
////////////////

// C++_����_��C���Ե�һ������������C���ԵĻ����﷨�������֮ͬ����
// ��������ͺ�����������ԭ���������͵ȵȡ�

// ��C����һ������C++�У���ĳ�����main()��ʼִ�У�
// �ú����ķ���ֵӦ��Ϊint�ͣ��������ֵ����Ϊ������˳�״ֵ̬��
// ������������ı�������gcc��clang�ȣ�Ҳ���� void main() �ĺ���ԭ�͡�
// ���μ� http://en.wikipedia.org/wiki/Exit_status ����ȡ������Ϣ��
int main(int argc, char** argv)
{
    // ��C����һ���������в���ͨ��argc��argv���ݡ�
    // argc���������в�����������
    // ��argv��һ��������C���Է���ַ�������char *�������飬
    // ����ÿ���ַ�������һ�������в��������ݣ�
    // �׸������в����ǵ��øó���ʱ��ʹ�õ����ơ�
    // ����㲻���������в�����ֵ��argc��argv���Ա����ԡ�
    // ��ʱ���������int main()��Ϊ����ԭ�͡�

    // �˳�״ֵ̬Ϊ0ʱ����ʾ����ִ�гɹ�
    return 0;
}

// Ȼ����C++��C����Ҳ��һЩ����

// ��C++�У��ַ��������Ĵ�С��һ���ֽڡ�
sizeof('c') == 1

// ��C�����У��ַ��������Ĵ�С��int��ͬ��
sizeof('c') == sizeof(10)


// C++�ĺ���ԭ���뺯���������ϸ�ƥ���
void func(); // ����������ܽ����κβ���

// ����C������
void func(); // ��������ܽ������������Ĳ���

// ��C++�У���nullptr����C�����е�NULL
int* ip = nullptr;

// C++Ҳ����ʹ��C���Եı�׼ͷ�ļ���
// ������Ҫ����ǰ׺��c����ȥ��ĩβ�ġ�.h����
#include <cstdio>

int main()
{
    printf("Hello, world!\n");
    return 0;
}

///////////
// ��������
///////////

// C++֧�ֺ������أ�����Զ���һ��������ͬ��������ͬ�ĺ�����

void print(char const* myString)
{
    printf("String %s\n", myString);
}

void print(int myInt)
{
    printf("My int is %d", myInt);
}

int main()
{
    print("Hello"); // ����Ϊ void print(const char*)
    print(15); // ����Ϊ void print(int)
}

///////////////////
// ����������Ĭ��ֵ
///////////////////

// �����Ϊ�����Ĳ���ָ��Ĭ��ֵ��
// ���ǽ����ڵ�����û���ṩ��Ӧ����ʱ��ʹ�á�

void doSomethingWithInts(int a = 1, int b = 4)
{
    // ��������������һЩ����
}

int main()
{
    doSomethingWithInts();      // a = 1,  b = 4
    doSomethingWithInts(20);    // a = 20, b = 4
    doSomethingWithInts(20, 5); // a = 20, b = 5
}

// Ĭ�ϲ�������������еĳ������֮��

void invalidDeclaration(int a = 1, int b) // ���Ǵ���ģ�
{
}


///////////
// �����ռ�
///////////

// �����ռ�Ϊ���������������������ṩ�˷���ĵ�������
// �����ռ����Ƕ��ʹ�á�

namespace First {
    namespace Nested {
        void foo()
        {
            printf("This is First::Nested::foo\n");
        }
    } // ����Ƕ�׵������ռ�Nested
} // ���������ռ�First

namespace Second {
    void foo()
    {
        printf("This is Second::foo\n")
    }
}

void foo()
{
    printf("This is global foo\n");
}

int main()
{
    // ���û���ر�ָ�����ʹӡ�Second����ȡ����������ݡ�
    using namespace Second;

    foo(); // ��ʾ��This is Second::foo��
    First::Nested::foo(); // ��ʾ��This is First::Nested::foo��
    ::foo(); // ��ʾ��This is global foo��
}

////////////
// ����/���
////////////

// C++ʹ�á����������������<<�����Ĳ����������>>������ȡ�������
// cin��cout����cerr�ֱ����
// stdin����׼���룩��stdout����׼�������stderr����׼���󣩡�

#include <iostream> // �����������/�������ͷ�ļ�

using namespace std; // �����������std�����ռ䣨Ҳ���Ǳ�׼�⣩�С�

int main()
{
   int myInt;

   // �ڱ�׼������ն�/��ʾ��������ʾ
   cout << "Enter your favorite number:\n";
   // �ӱ�׼���루���̣����һ��ֵ
   cin >> myInt;

   // coutҲ�ṩ�˸�ʽ������
   cout << "Your favorite number is " << myInt << "\n";
   // ��ʾ��Your favorite number is <myInt>��

   cerr << "Used for error messages";
}

/////////
// �ַ���
/////////

// C++�е��ַ����Ƕ��������кܶ��Ա����
#include <string>

using namespace std; // �ַ���Ҳ��std�����ռ䣨��׼�⣩�С�

string myString = "Hello";
string myOtherString = " World";

// + �������������ַ�����
cout << myString + myOtherString; // "Hello World"

cout << myString + " You"; // "Hello You"

// C++�е��ַ����ǿɱ�ģ����С�ֵ���塱��
myString.append(" Dog");
cout << myString; // "Hello Dog"


/////////////
// ����
/////////////

// ����֧��C�����е�ָ���������⣬C++���ṩ��_����_��
// ������һ�������ָ�����ͣ�һ��������Ͳ������¸�ֵ�����Ҳ��ܱ�����Ϊ��ֵ��
// ʹ������ʱ���﷨��ԭ������ͬ��
// Ҳ����˵�����������ͽ��н�����ʱ������Ҫʹ��*��
// ��ֵʱҲ����Ҫ��&��ȡ��ַ��

using namespace std;

string foo = "I am foo";
string bar = "I am bar";


string& fooRef = foo; // ������һ����foo�����á�
fooRef += ". Hi!"; // ͨ���������޸�foo��ֵ
cout << fooRef; // "I am foo. Hi!"

// ��仰�Ĳ�����ı�fooRef��ָ����Ч���롰foo = bar����ͬ��
// Ҳ����˵����ִ���������֮��foo == "I am bar"��
fooRef = bar;

const string& barRef = bar; // ����ָ��bar�ĳ������á�
// ��C������һ������ָ������ã�����Ϊ����ʱ����Ӧ��ֵ���ܱ��޸ġ�
barRef += ". Hi!"; // ���Ǵ���ģ������޸�һ���������õ�ֵ��

///////////////////
// �������������
///////////////////

// �й���ĵ�һ��ʾ��
#include <iostream>

// ����һ���ࡣ
// ��ͨ����ͷ�ļ���.h��.hpp����������
class Dog {
    // ��Ա�����ͳ�Ա����Ĭ���������˽�У�private���ġ�
    std::string name;
    int weight;

// �������ǩ֮�������������ǹ��У�public���ģ�
// ֱ������ָ����private:����˽�м̳У���protected:���������̳У�Ϊֹ
public:

    // Ĭ�ϵĹ�����
    Dog();

    // �����ǳ�Ա����������һ�����ӡ�
    // ����ע�⵽�������ڴ˴�ʹ����std::string��������using namespace std
    // ���using namespace����Ӧ��������ͷ�ļ����С�
    void setName(const std::string& dogsName);

    void setWeight(int dogsWeight);

    // ���һ���������Զ����״̬�����޸ģ�
    // Ӧ���������м���const��
    // ��������Ϳ��Զ�һ���Գ�����ʽ���õĶ���ִ�иò�����
    // ͬʱ����ע�⵽��������ĳ�Ա������Ҫ��������дʱ��
    // �����еĺ������뱻��ʽ����Ϊ_�麯����virtual��_��
    // ���ǵ����ܷ�������أ�����Ĭ������²��ᱻ����Ϊ�麯����
    virtual void print() const;

    // ����Ҳ������class body�ڲ����塣
    // ��������ĺ������Զ���Ϊ����������
    void bark() const { std::cout << name << " barks!\n" }

    // ���˹��������⣬C++���ṩ����������
    // ��һ������ɾ�����������䶨����ʱ���������������ᱻ���á�
    // ��ʹ��RAII������ǿ��ʽ���μ����ģ���Ϊ���ܡ�
    // Ϊ��������������������������������붨��Ϊ�麯����
    virtual ~Dog();

}; // ����Ķ���֮��Ҫ��һ���ֺ�

// ��ĳ�Ա����ͨ����.cpp�ļ���ʵ�֡�
void Dog::Dog()
{
    std::cout << "A dog has been constructed\n";
}

// ���������ַ�����Ӧ�������õ���ʽ���ݣ�
// ���ڲ���Ҫ�޸ĵĶ������ʹ�ó������á�
void Dog::setName(const std::string& dogsName)
{
    name = dogsName;
}

void Dog::setWeight(int dogsWeight)
{
    weight = dogsWeight;
}

// �麯����virtual�ؼ���ֻ��Ҫ������ʱʹ�ã�����Ҫ�ڶ���ʱ�ظ�
void Dog::print() const
{
    std::cout << "Dog is " << name << " and weighs " << weight << "kg\n";
}

void Dog::~Dog()
{
    std::cout << "Goodbye " << name << "\n";
}

int main() {
    Dog myDog; // ��ʱ��ʾ��A dog has been constructed��
    myDog.setName("Barkley");
    myDog.setWeight(10);
    myDog.print(); // ��ʾ��Dog is Barkley and weighs 10 kg��
    return 0;
} // ��ʾ��Goodbye Barkley��

// �̳У�

// �����̳���Dog���еĹ��У�public���ͱ�����protected������
class OwnedDog : public Dog {

    void setOwner(const std::string& dogsOwner)

    // ��дOwnedDogs���print������
    // ����㲻��Ϥ�����̬�Ļ������Բο����ҳ���еĸ�����
    // http://zh.wikipedia.org/wiki/%E5%AD%90%E7%B1%BB%E5%9E%8B

    // override�ؼ����ǿ�ѡ�ģ���ȷ��������д���ǻ����еķ�����
    void print() const override;

private:
    std::string owner;
};

// ���ͬʱ���ڶ�Ӧ��.cpp�ļ��

void OwnedDog::setOwner(const std::string& dogsOwner)
{
    owner = dogsOwner;
}

void OwnedDog::print() const
{
    Dog::print(); // ���û���Dog�е�print����
    // "Dog is <name> and weights <weight>"

    std::cout << "Dog is owned by " << owner << "\n";
    // "Dog is owned by <owner>"
}

/////////////////////
// ��ʼ�������������
/////////////////////

// ��C++�У�ͨ������һЩ�������Ƶĺ�����
// ���������+��-��*��/�����������Ϊ��
// ���������ʹ��ʱ����Щ���⺯���ᱻ���ã��Ӷ�ʵ����������ء�

#include <iostream>
using namespace std;

class Point {
public:
    // �����������ķ�ʽΪ��Ա��������Ĭ��ֵ��
    double x = 0;
    double y = 0;

    // ����һ��Ĭ�ϵĹ�������
    // ���˽�Point��ʼ��Ϊ(0, 0)���⣬�������ʲô��������
    Point() { };

    // ����ʹ�õ��﷨��Ϊ��ʼ���б�
    // ���ǳ�ʼ�����г�Ա��������ȷ��ʽ��
    Point (double a, double b) :
        x(a),
        y(b)
    { /* ���˳�ʼ����Ա�����⣬ʲô������ */ }

    // ���� + �����
    Point operator+(const Point& rhs) const;

    // ���� += �����
    Point& operator+=(const Point& rhs);

    // ���� - �� -= �����Ҳ��������ģ������ﲻ��׸����
};

Point Point::operator+(const Point& rhs) const
{
    // ����һ���µĵ㣬
    // ���������ֱ�Ϊ���������һ���ڶ�Ӧ�����ϵ�����֮�͡�
    return Point(x + rhs.x, y + rhs.y);
}

Point& Point::operator+=(const Point& rhs)
{
    x += rhs.x;
    y += rhs.y;
    return *this;
}

int main () {
    Point up (0,1);
    Point right (1,0);
    // ����ʹ����Point���͵��������+��
    // ����up��Point���ͣ��ġ�+������������right��Ϊ�����Ĳ���
    Point result = up + right;
    // ��ʾ��Result is upright (1,1)��
    cout << "Result is upright (" << result.x << ',' << result.y << ")\n";
    return 0;
}

///////////
// �쳣����
///////////

// ��׼�����ṩ��һЩ�������쳣����
// ���μ�http://en.cppreference.com/w/cpp/error/exception��
// ���ǣ������κ�����Ҳ������Ϊһ���쳣������
#include <exception>

// ��_try_������В������쳣���Ա�����_catch_����
try {
    // ��Ҫ�� _new_�ؼ����ڶ���Ϊ�쳣����ռ䡣
    throw std::exception("A problem occurred");
}
// ����������쳣��һ�����󣬿����ó���������������
catch (const std::exception& ex)
{
  std::cout << ex.what();
// ������δ��_catch_��������д���
} catch (...)
{
    std::cout << "Unknown exception caught";
    throw; // �������쳣
}

///////
// RAII
///////

// RAIIָ���ǡ���Դ��ȡ���ǳ�ʼ������Resource Allocation Is Initialization����
// ��������C++����ǿ��ı�̷�ʽ֮һ��
// ��˵������ָ���ǣ��ù��캯������ȡһ���������Դ��
// ��Ӧ�ģ����������������ͷŶ������Դ��

// Ϊ�������һ��ʽ���ô��������ǿ���ĳ������ʹ���ļ����ʱ�������
void doSomethingWithAFile(const char* filename)
{
    // ���ȣ������Ǽ���һ�ж���˳�����С�

    FILE* fh = fopen(filename, "r"); // ��ֻ��ģʽ���ļ�

    doSomethingWithTheFile(fh);
    doSomethingElseWithIt(fh);

    fclose(fh); // �ر��ļ����
}

// ���ҵ��ǣ����Ŵ�������Ƶ����룬������ø��ӡ�
// ����fopen�����п���ִ��ʧ�ܣ�
// ��doSomethingWithTheFile��doSomethingElseWithIt����ʧ��ʱ���ش�����롣
// ����Ȼ�쳣��C++�д��������Ƽ���ʽ��
// ����ĳЩ����Ա����������C���Ա����ģ������Ͽ��쳣������Ƶ����ã���
// ���ڣ����Ǳ�����ÿ�����������Ƿ�ɹ�ִ�У��������ⷢ����ʱ��ر��ļ������
bool doSomethingWithAFile(const char* filename)
{
    FILE* fh = fopen(filename, "r"); // ��ֻ��ģʽ���ļ�
    if (fh == nullptr) // ��ִ��ʧ���ǣ����ص�ָ����nullptr
        return false; // ������߻㱨����

    // ����ÿ����������ִ��ʧ��ʱ����false
    if (!doSomethingWithTheFile(fh)) {
        fclose(fh); // �ر��ļ��������������ڴ�й©��
        return false; // ��������
    }
    if (!doSomethingElseWithIt(fh)) {
        fclose(fh); // �ر��ļ����
        return false; // ��������
    }

    fclose(fh); // �ر��ļ����
    return true; // ָʾ�����ѳɹ�ִ��
}

// C���Եĳ���Աͨ�������goto��������Ĵ��룺
bool doSomethingWithAFile(const char* filename)
{
    FILE* fh = fopen(filename, "r");
    if (fh == nullptr)
        return false;

    if (!doSomethingWithTheFile(fh))
        goto failure;

    if (!doSomethingElseWithIt(fh))
        goto failure;

    fclose(fh); // �ر��ļ�
    return true; // ִ�гɹ�

failure:
    fclose(fh);
    return false; // ��������
}

// ������쳣���������ָʾ����Ļ���
// �����������һЩ��������Ȼ���Ż�����ء�
void doSomethingWithAFile(const char* filename)
{
    FILE* fh = fopen(filename, "r"); // ��ֻ��ģʽ���ļ�
    if (fh == nullptr)
        throw std::exception("Could not open the file.");

    try {
        doSomethingWithTheFile(fh);
        doSomethingElseWithIt(fh);
    }
    catch (...) {
        fclose(fh); // ��֤�����ʱ���ļ�����ȷ�ر�
        throw; // ֮�������׳�����쳣
    }

    fclose(fh); // �ر��ļ�
    // ���й���˳�����
}

// ���֮�£�ʹ��C++�е��ļ����ࣨfstream��ʱ��
// fstream�������Լ������������ر��ļ������
// ֻҪ�뿪��ĳһ����Ķ������������������ͻᱻ�Զ����á�
void doSomethingWithAFile(const std::string& filename)
{
    // ifstream�������ļ�����input file stream���ļ��
    std::ifstream fh(filename); // ��һ���ļ�

    // ���ļ�����һЩ����
    doSomethingWithTheFile(fh);
    doSomethingElseWithIt(fh);

} // �ļ��Ѿ����������Զ��ر�

// �����漸�ַ�ʽ��ȣ����ַ�ʽ����_����_�����ƣ�
// 1. ���۷�����ʲô�������Դ�������������ļ���������ᱻ��ȷ�رա�
//    ֻҪ����ȷʹ��������������_����_��Ϊ���ǹرվ���������Դ��й©��
// 2. ����ע�⵽��ͨ�����ַ�ʽд�����Ĵ���ʮ�ּ�ࡣ
//    ���������ں�̨�ر��ļ������������Ҫ����������Щ���¡�
// 3. ���ַ�ʽ�Ĵ�������쳣��ȫ�ԡ�
//    �����ں����еĺδ������쳣���������谭���ļ���Դ���ͷš�

// �ص���C++����Ӧ����RAII��ʹ����չ���������͵���Դ�ϣ�������
// - ��unique_ptr��shared_ptr������ڴ�
// - �������������������׼���е����������������Զ���չ�����飩��ɢ�б�ȣ�
//   ����������������ʱ�����������Զ��ͷ����д�������ݡ�
// - ��lock_guard��unique_lockʵ�ֵĻ���

