package com.realm;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.model.SpeakerExample;
import com.service.SpeakerExampleService;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Jacey on 2017/6/30.
 */

@Component
public class LoginRealm extends AuthorizingRealm{
	
	@Resource(name="speakerExampleServiceImpl")
	private SpeakerExampleService speakerExampleService;

    /**
     * 获取身份信息，我们可以在这个方法中，从数据库获取该用户的权限和角色信息
     *     当调用权限验证时，就会调用此方法
     */
   protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        List<SpeakerExample> speakerList=new ArrayList<>();
        try {
        	SpeakerExample speaker=new SpeakerExample();
            Map<String,Object> map=new HashMap<>();
    		map.put("username", speaker.getUsername());
    		speakerList = speakerExampleService.speakerLogin(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //通过用户名从数据库获取权限/角色信息
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        List<String> roles=new ArrayList<>();
        roles.add(speakerList.get(0).getRolePower().toString());
        info.addRoles(roles);

        return info;
    }

    /**
     * 在这个方法中，进行身份验证
     *         login时调用
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //用户名
        String username = (String) token.getPrincipal();
        //密码
        String password = new String((char[])token.getCredentials());
        //password=new Md5Hash(password, username ,2).toString();
        
        Map<String,Object> map=new HashMap<>();
		map.put("username", username);
		List<SpeakerExample> speakerList = speakerExampleService.speakerLogin(map);

        if (speakerList.size()==0) {
            //没有该用户名
            throw new UnknownAccountException();
        } else if (!password.equals(speakerList.get(0).getPassword())) {
            //密码错误
            throw new IncorrectCredentialsException();
        }

        //身份验证通过,返回一个身份信息
        AuthenticationInfo aInfo = new SimpleAuthenticationInfo(username,password,getName());

        return aInfo;
    }
}
