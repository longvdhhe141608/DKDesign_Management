package DkDesignManagement.Controller.Filter;

import DkDesignManagement.Entity.Account;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@Component
public class SecurityServletFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(SecurityServletFilter.class);


    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/login";
        String forgotPasswordURI = request.getContextPath() + "/forgotPassword";

        boolean loggedIn = session != null && session.getAttribute("loginUser") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean forgotPasswordRequest = request.getRequestURI().contains(forgotPasswordURI);

        if (loggedIn || loginRequest || forgotPasswordRequest) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }
    }
}
