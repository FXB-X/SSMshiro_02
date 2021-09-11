package com.zking.ssm.controller;

import com.zking.ssm.model.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {

        @RequestMapping("/login")
        public String doLogin(HttpSession session, User user){
            Subject subject = SecurityUtils.getSubject();
            //将前端用户输入的账号密码放入到令牌中准备验证
            UsernamePasswordToken token=new UsernamePasswordToken(
                    user.getUsername(),user.getPassword()
            );
            String message="";
            String username="";
            try {
                subject.login(token);
                message="登陆成功";
                if(subject.hasRole("管理员")){
                    username="管理员";
                }else if(subject.hasRole("高级用户")){
                    username="高级用户";
                }else {
                    username="普通用户";
                }
                session.setAttribute("message",message);
                session.setAttribute("username",username);
                return "index";

            } catch (IncorrectCredentialsException e) {
                message="密码错误";
            }catch(UnknownAccountException e1){
                message="账号不存在";
            }
            session.setAttribute("message",message);
            session.setAttribute("username",username);
            return "main";
        }

}
