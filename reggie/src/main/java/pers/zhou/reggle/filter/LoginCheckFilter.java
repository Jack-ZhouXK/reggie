package pers.zhou.reggle.filter;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;
import pers.zhou.reggle.common.BaseContext;
import pers.zhou.reggle.common.R;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 检查用户是否登录
 * filterName: 过滤器名称
 * urlPatterns：什么请求会被拦截   /*代表所有
 */
@Slf4j
@WebFilter(filterName = "loginCheckFilter", urlPatterns = "/*")
public class LoginCheckFilter implements Filter {

    // 路径匹配器
    public static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String requestURI = request.getRequestURI();  //获取本次请求的URI
        String[] urls = new String[]{"/employee/login", "/employee/logout", "/backend/**", "/front/**", "/user/sendMsg",  // 移动端发送短信
                "/user/login"};  //  移动端登录
        //判断本次请求是否需要处理
        if (check(urls, requestURI)) {  //如果不需要处理，则直接放行
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        //判断员工登录状态，如果已登录，则直接放行
        Long employeeId = (Long) request.getSession().getAttribute("employee");
        if (employeeId != null) {
            BaseContext.setCurrentId(employeeId);
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        // 判断用户登录状态，如果已登录，则直接放行
        Long userId = (Long) request.getSession().getAttribute("user");
        if (userId != null) {
            BaseContext.setCurrentId(userId);
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        //如果未登录则返回未登录结果,通过输出流向页面响应数据
        servletResponse.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN")));
    }

    /**
     * 检查本次请求是否需要放行
     */
    public boolean check(String[] urls, String requestURI) {
        for (String url : urls) {
            if (PATH_MATCHER.match(url, requestURI)) {
                return true;
            }
        }
        return false;
    }
}
