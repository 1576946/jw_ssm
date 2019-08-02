### 了解springMVC
[Mozilla](https://blog.csdn.net/qq_40435621/article/details/98091493)
### springMVC的基本配置
[Mozilla](https://blog.csdn.net/qq_40435621/article/details/98093307)

### springMVC的执行流程
 

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


      
  
  
  







 
