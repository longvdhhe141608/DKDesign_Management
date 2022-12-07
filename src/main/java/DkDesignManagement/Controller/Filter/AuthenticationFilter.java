//package DkDesignManagement.Controller.Filter;
//
//import DkDesignManagement.Controller.LoginController;
//import DkDesignManagement.Entity.Account;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/*"})
//public class AuthenticationFilter implements Filter {
//
//    @Autowired
//    private LoginController loginController;
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        Filter.super.init(filterConfig);
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest,
//                         ServletResponse servletResponse,
//                         FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest req = (HttpServletRequest) servletRequest;
//        HttpServletResponse resp = (HttpServletResponse) servletResponse;
//
//        HttpSession session = req.getSession();
//
//        Account account = (Account) session.getAttribute("loginUser");
//
//        if (account == null) {
//            resp.sendRedirect("");
//        }
//        filterChain.doFilter(servletRequest, servletResponse);
//    }
//
//    @Override
//    public void destroy() {
//        Filter.super.destroy();
//    }
//
//}
