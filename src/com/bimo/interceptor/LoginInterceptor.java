package com.bimo.interceptor;

import com.bimo.annotation.RequireAdmin;
import com.bimo.annotation.RequireLogin;
import com.bimo.pojo.User;
import org.springframework.http.HttpStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Method;

/*
 * @fileName: LoginInterceptor
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 11: 03
 */
public class LoginInterceptor implements HandlerInterceptor {
    /**
     * return true 正常情况, 继续运行
     * return false 出现错误，请求被拦截
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();
        if (method.isAnnotationPresent(RequireLogin.class)) {
            RequireLogin requireLogin = method.getAnnotation(RequireLogin.class);
            if (requireLogin.require()) {
                User user = (User) request.getSession().getAttribute("user");
                if (user == null) {
                    response.setStatus(HttpStatus.UNAUTHORIZED.value());
                    response.sendRedirect(request.getContextPath() + "/login");
                    return false;
                }
                if (method.isAnnotationPresent(RequireAdmin.class)) {
                    RequireAdmin requireAdmin = method.getAnnotation(RequireAdmin.class);
                    if (requireAdmin.require()) {
                        if (user.getSuperuser()) {
                            return true;
                        } else {
                            response.setStatus(HttpStatus.NOT_ACCEPTABLE.value());
                            return false;
                        }
                    } else {
                        return true;
                    }
                }

            }
        }
        return true;
    }

    @Override
    public void postHandle(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
