参考来源：[码出高效_阿里巴巴Java开发手册](https://github.com/chjw8016/alibaba-java-style-guide)
# **代码风格**

## **缩进：**
**缩进采用4个空格，禁止使用tab字符。 说明：如果使用tab缩进，必须设置1个tab为4个空格。IDEA设置tab为4个空格时，请勿勾选Use tab character；而在eclipse中，必须勾选insert spaces for tabs。**
>正例：（涉及1-5点） public static void main(String args[]) { //缩进4个空格 String say = "hello"; //运算符的左右必须有一个空格 int flag = 0; //关键词if与括号之间必须有一个空格，括号内的f与左括号，0与右括号不需要空格 if (flag == 0) { System.out.println(say); } //左大括号前加空格且不换行；左大括号后换行 if (flag == 1) { System.out.println("world"); //右大括号前换行，右大括号后有else，不用换行 } else { System.out.println("ok"); //在右大括号后直接结束，则必须换行 } }

## **命名规约：**

**1.【强制】不得使用拼音进行命名，国际大都市等熟知的汉语词汇除外。**
>private int siWangHuanZhe;  //反例
private int deadPatient;	//正例
private City shangHai;		//正例

**2.【强制】不得使用中文进行命名。
3.【强制】命名不能以下划线或美元符号开头。
4.【强制】类名使用 UpperCamelCase 风格，**
>例如。
public CommandLogLineProcessor {
    //...
}

**5.【强制】方法名、参数名、成员变量、局部变量都统一使用lowerCamelCase风格的驼峰形式，**
>例如：
int[] localNumbers;
private void logLineProcessor(String logLine) {...}

**6.【强制】枚举类型、常量名称全部大写，单词间要用下划线分割，**
>例如：
enum Week {
    MONDAY, TUESDAY, WEDNESDAY ....
}
public static final String FILE_SUFFIX = ".flac";

**7.【强制】抽象类名使用Abstract开头，非抽象类不允许以Abstract开头；异常类名使用Exception结尾；测试类名以它要测试的类名称开始，以Test结尾。
8.【强制】不规范的缩写要避免，以免引起误导或者增加理解负担。
9.【推荐】变量名称长度不是很长时，不推荐缩写。**
>FileWriter fileWriter = new FileWriter(sourceFile);	//推荐
FileWriter fw = new FileWriter(sourceFile);         //不推荐

## **常量定义：**
**1.【强制】大括号的使用约定。大括号内为空，写为{}即可，无需换行。若代码非空**
>* 左大括号前不换行
* 左大括号后换行
* 右大括号前换行
* 右大括号后换行

**2.【强制】运算符左右必须有一个空格3.【强制】单行字符数限制不超过 120个，超出需要换行**
>* 在多个参数超长，逗号后进行换行。
* 运算符与下文一起换行。
* 方法调用的点符号与下文一起换行。

**4.【强制】方法参数在定义和传入时，多个参数逗号后边必须加空格。**
>public void max(int a, int b, int c) {...}

**5.【推荐】对于Getter和Setter，如果足够简短，可仅占一行。例如：**
>public String getName() { return name; }

**6.【推荐】方法体内的执行语句组、变量的定义语句组、不同的业务逻辑之间或者不同的语义之间插入一个空行。相同业务逻辑和语义之间不需要插入空行。**

## **注释规则：**
**类、类属性、类方法的注释必须使用Javadoc规范，使用/*内容/格式，不得使用//xxx方式。 方法内部单行注释，在被注释语句上方另起一行，使用//注释。方法内部多行注释使用/ */注释，注意与代码对齐。**

## **OOP规约：**
**1.【强制】避免通过一个类的对象引用访问此类的静态变量或静态方法，直接用类名来访问即可。
2.【强制】所有的覆写方法，必须加@Override注解。
3.【强制】不能使用过时的类或方法。
4.【强制】构造方法里面禁止加入任何业务逻辑，如果有初始化逻辑，应放在init方法中。
5.【推荐】setter方法中，参数名称与类成员变量名称一致，this.成员名=参数名。在getter/setter方法中，尽量不要增加业务逻辑，增加排查问题的难度。
6.【推荐】final可提高程序响应效率，声明成final的情况：
1.不需要重新赋值的变量，包括类属性、局部变量。
2.对象参数前加final，表示不允许修改引用的指向。
3.类方法确定不允许被重写。**
## **控制语句：**
**1.【强制】在if/else/for/while/do语句中必须使用大括号，即使只有一行代码；以下形式不被允许
//不允许以下格式**
>if(allow)
    list.add("a");
while(iterator.hasNext())
    set.remove(iterator.next());
    
**2.if-else超过三层，就要考虑状态设计模式。**
