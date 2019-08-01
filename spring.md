关于用到的springmvc：
SpringMVC 是一种基于 Java 的实现 MVC 设计模型的请求驱动类型的轻量级 Web 框架，属于 Spring FrameWork 的后续产品，已经融合在 Spring Web Flow 里面。Spring 框架提供了构建 Web 应用程序的全功 能 MVC 模块。
Springmvc的优势：
1、清晰的角色划分：  
前端控制器（DispatcherServlet）  
请求到处理器映射（HandlerMapping） 
处理器适配器（HandlerAdapter）  
视图解析器（ViewResolver）  
处理器或页面控制器（Controller）  
验证器（ Validator）  
命令对象（Command  请求参数绑定到的对象就叫命令对象）  
表单对象（Form Object 提供给表单展示和提交到的对象就叫表单对象）。 

2、分工明确，而且扩展点相当灵活，可以很容易扩展，虽然几乎不需要。 

3、由于命令对象就是一个 POJO，无需继承框架特定 API，可以使用命令对象直接作为业务对象。

4、和 Spring 其他框架无缝集成，是其它 Web 框架所不具备的。 

5、可适配，通过 HandlerAdapter 可以支持任意的类作为处理器。 

6、可定制性，HandlerMapping、ViewResolver 等能够非常简单的定制。 

7、功能强大的数据验证、格式化、绑定机制。 

8、利用 Spring 提供的 Mock 对象能够非常简单的进行 Web 层单元测试。 

9、本地化、主题的解析的支持，使我们更容易进行国际化和主题的切换。 

10、强大的 JSP 标签库，使 JSP 编写更容易

web.xml 配置核心控制器

`<!-- 配置 spring mvc 的核心控制器 --> 
<servlet>   
<servlet-name>SpringMVCDispatcherServlet</servlet-name>   
<servlet-class>    org.springframework.web.servlet.DispatcherServlet </servlet-class> 
  <!-- 配置初始化参数，用于读取 SpringMVC 的配置文件 -->  
  <init-param>    
  <param-name>contextConfigLocation</param-name>    
  <param-value>classpath:SpringMVC.xml</param-value>  
  </init-param> 
  <!-- 配置 servlet 的对象的创建时间点：应用加载时创建。    取值只能是非 0 正整数，表示启动顺序 -->   
  <load-on-startup>1</load-on-startup> 
 </servlet> 
 
 <servlet-mapping> 
  <servlet-name>SpringMVCDispatcherServlet</servlet-name>   
  <url-pattern>/</url-pattern> 
 </servlet-mapping> `
 
 添加spring-mvc.xml 配置文件
 <?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="
           http://www.springframework.org/schema/beans
           http://www.springframework.org/schema/beans/spring-beans.xsd
           http://www.springframework.org/schema/mvc
           http://www.springframework.org/schema/mvc/spring-mvc.xsd
           http://www.springframework.org/schema/context
           http://www.springframework.org/schema/context/spring-context.xsd
           http://www.springframework.org/schema/aop
		http://www.springframework.org/schema/aop/spring-aop.xsd
           ">
    <!-- 扫描controller的注解  位置位于controller包下-->
    <context:component-scan base-package="com.itheima.ssm.controller">
    </context:component-scan>

    <!-- 配置视图解析器 -->
    <bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <!-- JSP文件所在的目录 -->
        <property name="prefix" value="/pages/" />
        <!-- 文件的后缀名 -->
        <property name="suffix" value=".jsp" />
    </bean>

    <!-- 设置静态资源不过滤   不然默认是不放行的-->
    <mvc:resources location="/css/" mapping="/css/**" />
    <mvc:resources location="/img/" mapping="/img/**" />
    <mvc:resources location="/js/" mapping="/js/**" />
    <mvc:resources location="/plugins/" mapping="/plugins/**" />

    <!-- 开启对SpringMVC注解的支持 -->
    <mvc:annotation-driven />
    <!--
        支持AOP的注解支持，AOP底层使用代理技术
        JDK动态代理，要求必须有接口
        cglib代理，生成子类对象，proxy-target-class="true" 默认使用cglib的方式
    -->
    <aop:aspectj-autoproxy proxy-target-class="true"/>
</beans>

 DispatcherServlet 前端控制器： 用户请求到达前端控制器，它就相当于 mvc 模式中的 c，dispatcherServlet 是整个流程控制的中心，
 由 它调用其它组件处理用户的请求，dispatcherServlet 的存在降低了组件之间的耦合性
 HandlerMapping 处理器映射器：HandlerMapping 负责根据用户请求找到 Handler 即处理器，SpringMVC 提供了不同的映射器实现不同的 映射方式，
 例如：配置文件方式，实现接口方式，注解方式等。
 Handler：处理器 ： 它就是我们开发中要编写的具体业务控制器。由 DispatcherServlet 把用户请求转发到 Handler。由 Handler 对具体的用户请求进行处理。 
 HandlAdapter：处理器适配器：通过 HandlerAdapter 对处理器进行执行，这是适配器模式的应用，通过扩展适配器可以对更多类型的处理 器进行执行。 
 View Resolver：视图解析器 ：View Resolver 负责将处理结果生成 View 视图，View Resolver 首先根据逻辑视图名解析成物理视图名 即具体的页面地址，再生成 View 视图对象，
 最后对 View 进行渲染将处理结果通过页面展示给用户。 
 view 视图：SpringMVC 框架提供了很多的 View 视图类型的支持，包括：jstlView、freemarkerView、pdfView 等。我们最常用的视图就是 jsp。
 一般情况下需要通过页面标签或页面模版技术将模型数据通过页面展示给用户，需要由程序员根据业务需求开
发具体的页面。 
在 SpringMVC 的各个组件中，处理器映射器、处理器适配器、视图解析器称为 SpringMVC 的三大组件。 

使用<mvc:annotation-driven> 自动加载 HandlerMapping （处理映射器）和 HandlerAdapter （ 处 理 适 配 器 ）

<!-- HandlerMapping --> 
<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerM
apping"></bean> 
<bean 
class="org.springframework.web.servlet.handler.BeanNameUrlHandlerMapping"></bean> 

<!-- HandlerAdapter --> 
<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerA dapter"></bean> 
<bean class="org.springframework.web.servlet.mvc.HttpRequestHandlerAdapter"></bean> 
<bean class="org.springframework.web.servlet.mvc.SimpleControllerHandlerAdapter"></bean>


## @RequestMapping 注解
它是用来处理请求的注解
出现在类上，方法上（一般类和方法上都有 构成 二级目录）
属性：
  value ：用于指定请求的url
  method ：指定方法  如：RequestMethod.POST
  params 用于指定限制请求参数条件
      params = {"act"} 就表示请求的参数必须要有cat

### 请求参数绑定
springmvc这么好用 离不开请求参数绑定
Springmvc 绑定请求参数的过程是通过把表单提交的参数，作为控制器中的方法参数进行绑定的。



#### 支持绑定的数据类型 
  基本类型参数：
        基本数据类型和String类型
  POJO类型  实体类等
  数组和集合类型     List Map结构
  
  #### springmvc做了这么多，我们使用的规则是什么？
      1. 基本和string类型：要求我们参数名称和控制器中的方法形参名称保持一致。
      2. POJO类型   要求参数名称和POJO类的属性名称保持一致
      3.集合类型
              第一种：   
              要求集合类型的请求参数必须在 POJO 中。在表单中请求参数名称要和 POJO 中集合属性名称相同。给 List 集合中的元素赋值，使用下标。  
                                            给 Map 集合中的元素赋值，使用键值对。  
              第二种：   接收的请求参数是 json 格式数据。需要借助一个注解实现。
              
#### 解决中文post乱码问题
web配置过滤器
  <!-- 解决中文乱码过滤器 -->
    <filter>
        <filter-name>characterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>characterEncodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
    <filter>
        <filter-name>springSecurityFilterChain</filter-name>
        <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>springSecurityFilterChain</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
    
### 自定义类型转换器
    我们最常用到的就是关于时间的类型转换 在我这个例子中也有对时间的输入
    这就需要类型转化
    
    要类型转化需要实现Converter接口
    public interface Converter<S,T>{
      @NUllable
      T convert(S source);
    }
    
    public class StringToDateConverter implements Converter<String, Date> { 
 
 /** 
  * 用于把 String 类型转成日期类型   */ 
 @Override  public Date convert(String source) {
 DateFormat format = null;  
 try {    
    if(StringUtils.isEmpty(source)) {     
    throw new NullPointerException("请输入要转换的日期");   
    }    
    format = new SimpleDateFormat("yyyy-MM-dd");    
    Date date = format.parse(source);    
    return date;   
    } catch (Exception e) {  
    throw new RuntimeException("输入日期有误");   
    }  
   } 
} 

Spring 中配置 
<bean id="converterService"   
class="org.springframework.context.support.ConversionServiceFactoryBean"> 
 <!-- 给工厂注入一个新的类型转换器 -->      
 <property name="converters"> 
      <array> 
       <!-- 配置自定义类型转换器 -->       <
       bean class="StringToDateConverter路径"></bean> 
      </array>     
      </property> 
</bean> 

最后在spring-mvc.xml 的annotation-driven  标签中增加属性
<mvc:annotation-driven 
conversion-service="converterService"></mvc:annotation-driven> 

#### SpringMVC 还支持使用原始 ServletAPI 对象作为控制器方法的参数。
支持原始 ServletAPI 对象有： 
HttpServletRequest  
HttpServletResponse 
HttpSession 
java.security.Principal 
Locale 
InputStream  
OutputStream  
Reader  
Writer 

### 常用注解
####RequestParam
使用在方法中。例如：@RequestParam(name = "page", required = true, defaultValue = "1") Integer page
在分页中的运用

#### RequestBody
使用在方法中 获取post的请求体 @RequestBody(required=false) String body

#### usePathVariable
用的不多，但是一些相同的网页但数据不一样时，可以用到 占位
例如@RequestMapping("/usePathVariable/{id}") 
public String usePathVariable(@PathVariable("id") Integer id）{...}

#### RequestHeader 
用于获取请求消息头

#### CookieValue 
用于把指定 cookie 名称的值传入控制器方法参数
    value：指定 cookie 的名称。
    required：是否必须有此 cookie。
    
#### SessionAttribute 
作用：用于多次执行控制器方法间的参数共享。 
属性：  value：用于指定存入的属性名称  
        type：用于指定存入的数据类型 
       
### 实际使用时
#### 当返回值为String类型时
可以直接返回内置的success 等
也可以像下面一样跳转

#### springmvc的跳转方式
围绕着DispatcherServlet展开的 底层servlet
跳转方式：
1. request.getRequestDispatcher("../index.jsp").forward(request, resp);
2. resp.sendRedirect("../index.jsp");
前面连个要在方法中加入参数 和 servlet一样
3.ModelAndView mav =new ModelAndView("forward:../index.jsp"); 
//带有 forward、redirect的跳转都不在经过视图解析器，而是直接从当前路径找页面或者方法（跳转页面时和正常springmvc页面传值一样，跳转方法时传参仅可以通过url或者是session）
4. ModelAndView mav =new ModelAndView("redirect:../index.jsp"); //带有 forward、redirect的跳转都不在经过视图解析器，而是直接从当前路径找页面或者方法（跳转页面时和正常springmvc页面传值一样，跳转方法时传参仅可以通过url或者是session）
5.还有一种就是通过视图解析器的方式。
6.return "forward:../index"; //带有 forward、redirect的跳转都不在经过视图解析器，而是直接从当前路径找页面或者方法（跳转页面时和正常springmvc页面传值一样，跳转方法时传参仅可以通过url或者是session）
7.return "redirect:../index"; //带有 forward、redirect的跳转都不在经过视图解析器，而是直接从当前路径找页面或者方法（跳转页面时和正常springmvc页面传值一样，跳转方法时传参仅可以通过url或者是session）
8. mav.setViewName("hello"); //跳转到  前缀+ hello+后缀的地方
9.return "hello"; //跳转到  前缀+ hello+后缀的地方

#### 当返回值为void时
像上面一样可以请求转发和重定向
也可以写入数据
response.setCharacterEncoding("utf-8"); 
response.setContentType("application/json;charset=utf-8"); 
response.getWriter().write("json 串");
####  ModelAndView
ModelAndView 是 SpringMVC 为我们提供的一个对象，该对象也可以用作控制器方法的返回值 
返回 ModelAndView 类型时，浏 览器跳转只能是请求转发。 

### 转发和重定向 
转发
return "forward:/WEB-INF/pages/success.jsp"
request.getRequestDispatcher("url").forward(request,response) 一样的。
需要注意的是，如果用了 formward：则路径必须写成实际视图 url，不能写逻辑视图。 
重定向
return "redirect:testReturnModelAndView"; 
相当于：response.sendRedirect(url）；

#### 响应json数据


### SpringMVC实现文件上传 
#### 文件上传的必要前提 
A form 表单的 enctype 取值必须是：multipart/form-data      
(默认值是:application/x-www-form-urlencoded)     enctype:是表单请求正文的类型 
B method 属性取值必须是 Post 
C 提供一个文件选择域<input type=”file” /> 
#### 借助第三方组件实现文件上传 
使用 Commons-fileupload 组件实现文件上传，需要导入该组件相应的支撑 jar 包：Commons-fileupload 和
commons-io。commons-io 不属于文件上传组件的开发 jar 文件，但Commons-fileupload 组件从 1.1 版本开始，它
工作时需要 commons-io 包的支持
##### springmvc 传统方式的文件上传 
1. 先导包 上面的包
2.写jsp语句
<form action="/fileUpload" method="post" enctype="multipart/form-data"> 
 	名称：<input type="text" name="picname"/><br/>  
	图片：<input type="file" name="uploadFile"/><br/>  
	<input type="submit" value=" 上传 "/> 
</form> 
3.编写控制器 
@Controller("fileUploadController") 
public class FileUploadController {    
/** 文件上传   */ 
 @RequestMapping("/fileUpload")  
 public String testResponseJson(String picname,MultipartFile uploadFile,HttpServletRequest request) throws Exception{   
 //定义文件名   
 String fileName = ""; 
  //1.获取原始文件名  
  String uploadFileName =  uploadFile.getOriginalFilename(); 
  //2.截取文件扩展名   S
  tring extendName = uploadFileName.substring(uploadFileName.lastIndexOf(".")+1, uploadFileName.length()); 
  //3.把文件加上随机数，防止文件重复   
  String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase(); 
  //4.判断是否输入了文件名   
  if(!StringUtils.isEmpty(picname)) {   
  fileName = uuid+"_"+picname+"."+extendName;   
  }else {  
  fileName = uuid+"_"+uploadFileName; 
  }  
  System.out.println(fileName); 
  //2.获取文件路径 
	ServletContext context = request.getServletContext(); 
  String basePath = context.getRealPath("/uploads"); 
  //3.解决同一文件夹中文件过多问题  
  String datePath = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); 
  //4.判断路径是否存在   
  File file = new File(basePath+"/"+datePath);   
  if(!file.exists()) {  
  file.mkdirs(); 
  } 
  //5.使用 MulitpartFile 接口中方法，把上传的文件写到指定位置   
  uploadFile.transferTo(new File(file,fileName));   
  return "success";  
}
}
4. 配置文件上传解析
<bean id="multipartResolver"
<!-- id 的值是固定的-->
	class="org.springframework.web.multipart.commons.CommonsMultipartResolver"> 
 	<!-- 设置上传文件的最大尺寸为 5MB -->  
 	<property name="maxUploadSize">  
		<value>5242880</value> 
	</property> 
</bean> 
#### 跨服务器的文件上传
###  SpringMVC中的异常处理 
[Mozilla](https://mp.csdn.net/mdeditor/98087258)
###  SpringMVC中的拦截器 


      
  
  
  







 
