package cmcc.core.sys.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.ResourceUtils;

import cmcc.common.exception.AlreadyExistedException;
import cmcc.common.service.SimpleCurdService;
import cmcc.core.sys.entity.Deptment;
import cmcc.core.sys.entity.Role;
import cmcc.core.sys.entity.User;
import cmcc.core.sys.repository.DeptmentRepository;
import cmcc.core.sys.repository.RoleRepository;
import cmcc.core.sys.repository.UserRepository;

@Service
public class UserService extends SimpleCurdService<User, Long> {
	
	private static Logger log = LoggerFactory.getLogger(UserService.class);
	
    public final static String BIND_MAIL_SEND = "BIND_MAIL_SEND";

    public final static String BIND_MAIL_CODE = "BIND_MAIL_CODE";

    public final static String FORGET_SEND = "FORGET_SEND";

    public final static String FORGET_CODE = "FORGET_CODE";

    public final static String CODE_SUBJECT = "";
    public final static String FORGET_SUBJECT = "";

    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private DeptmentRepository deptmentRepository;

    public User getUserByToken(String token) {
        User user = (User) redisTemplate.opsForValue().get(token);
        return user;
    }

    @Transactional
    public void BindUser(Long userid) {
        this.userRepository.bindUser(userid);
    }

    @Transactional
    public User registerUser(String username, String password, String chinesename) throws AlreadyExistedException {
        User user = userRepository.findByUsername(username);
        if (user != null)
            throw new AlreadyExistedException("用户名已经存在");
        else
            user = new User();
        user.setChinesename(chinesename);
        user.setUsername(username);
        user.setPassword(DigestUtils.md5Hex(User.DEFAULT_PASSWORD));
        return userRepository.save(user);
    }

    public Page<User> findAll(final int pageNumber, final int pageSize, final String name, final Long deptid,
            final Boolean isFreeze,final Boolean party) {
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        Specification<User> spec = new Specification<User>() {
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = cb.conjunction();
                if (StringUtils.isNotBlank(name)) {
                    predicate.getExpressions().add(cb.like(root.get("chinesename").as(String.class), "%" + name + "%"));
                }
                if (deptid != null) {
                    predicate.getExpressions().add(cb.equal(root.get("deptment").get("id").as(Long.class), deptid));
                }
                if (isFreeze != null) {
                    predicate.getExpressions().add(cb.equal(root.get("isFreeze").as(Boolean.class), isFreeze));
                }
                if (party != null) {
                    predicate.getExpressions().add(cb.equal(root.get("party").as(Boolean.class), true));
                }
                return predicate;
            }
        };
        Page<User> result = (Page<User>) simpleCurdRepository.findAll(spec, pageRequest);
        return result;
    }
    
    public Page<User> findAll(final int pageNumber, final int pageSize, final String name,final String attr,final Long deptid,
            final Boolean isFreeze,final Boolean party) {
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        Specification<User> spec = new Specification<User>() {
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate predicate = cb.conjunction();
                if (StringUtils.isNotBlank(name)) {
                    predicate.getExpressions().add(cb.like(root.get(attr).as(String.class), "%" + name + "%"));
                }
                if (deptid != null && deptid != 1) {
                    predicate.getExpressions().add(cb.equal(root.get("deptment").get("id").as(Long.class), deptid));
                }
                if (isFreeze != null) {
                    predicate.getExpressions().add(cb.equal(root.get("isFreeze").as(Boolean.class), isFreeze));
                }
                if (party != null) {
                    predicate.getExpressions().add(cb.equal(root.get("party").as(Boolean.class), true));
                }
                return predicate;
            }
        };
        Page<User> result = (Page<User>) simpleCurdRepository.findAll(spec, pageRequest);
        return result;
    }

    public void forgetSendCode(User user) {
        String sendkey = user.getId() + "_" + FORGET_SEND;
        String codekey = user.getId() + "_" + FORGET_CODE;
        if (redisTemplate.opsForValue().get(sendkey) != null) {
            throw new RuntimeException("请一分钟后再试");
        } else {
            redisTemplate.opsForValue().set(sendkey, new Date());
            redisTemplate.expire(sendkey, 1, TimeUnit.MINUTES);

            int code = (int) (Math.random() * 9000) + 1000;

            redisTemplate.opsForValue().set(codekey, String.valueOf(code));
            redisTemplate.expire(codekey, 1, TimeUnit.HOURS);
        }
    }

    public void BindMailSendCode(User user, String mail) {
        String sendkey = user.getId() + "_" + BIND_MAIL_SEND;
        String codekey = user.getId() + "_" + BIND_MAIL_CODE;
        if (redisTemplate.opsForValue().get(sendkey) != null) {
            throw new RuntimeException("请一分钟后再试");
        } else {
            redisTemplate.opsForValue().set(sendkey, new Date());
            redisTemplate.expire(sendkey, 1, TimeUnit.MINUTES);

            int code = (int) (Math.random() * 9000) + 1000;

            redisTemplate.opsForValue().set(codekey, String.valueOf(code));
            redisTemplate.expire(codekey, 1, TimeUnit.HOURS);
        }
    }

    public Boolean isForgetCodeSucess(User user, String code) {
        String codekey = user.getId() + "_" + FORGET_CODE;
        String codeInRedis = (String) redisTemplate.opsForValue().get(codekey);

        if (codeInRedis != null && codeInRedis.equals(code)) {
            redisTemplate.delete(codekey);
            return true;
        } else
            return false;
    }

    public Boolean isCodeSucess(User user, String code) {
        String codekey = user.getId() + "_" + BIND_MAIL_CODE;
        String codeInRedis = (String) redisTemplate.opsForValue().get(codekey);

        if (codeInRedis != null && codeInRedis.equals(code)) {
            redisTemplate.delete(codekey);
            return true;
        } else
            return false;
    }

    /***
     * 登录不成功返回null
     * 
     * @return
     */
    public User login(String username, String password) {
    	log.info("用户尝试登陆{}password{}",username,password);
        Assert.notNull(username);
        if (username.length() == 8) {
            return this.userRepository.findByEmpidAndPassword(username, DigestUtils.md5Hex(password));
        } else if (username.contains("@139.com")) {
            username = username.split("@")[0];
        }
        return this.userRepository.findByUsernameAndPassword(username, DigestUtils.md5Hex(password));
    }

    public User findByUsername(String username) {
        return this.userRepository.findByUsername(username);
    }

    public List<Role> findAllRoles() {
        return (List<Role>) this.roleRepository.findAll();
    }

    public Role findRole(Long id) {
        return this.roleRepository.findOne(id);
    }

    public List<User> findAll() {
        return (List<User>) this.userRepository.findAll();
    }

    public List<User> findUserByRole(Long roleid) {
        return this.userRepository.findUserByRole(roleid);
    }

    
    private	Deptment	getDept(List<Deptment> lists,String deptname){
		for(Deptment deptment:lists){
			if(deptment.getName().equals(deptname))
				return deptment;
		}
		return null;
    }

  
	
    public void updateUser(Long userid, String img) {
        this.userRepository.updateUser(userid, img);
    }
    
    public void resetPassword(Long userid) {
        this.userRepository.updatePassword(userid,DigestUtils.md5Hex(User.DEFAULT_PASSWORD));
    }
    
    public void freeze(Long userid) {
        this.userRepository.updateFreeze(userid, true);
    }
    
    public void unFreeze(Long userid) {
        this.userRepository.updateFreeze(userid, false);
    }
    public List<User> findByDeptment(Deptment deptment) {
    	return  this.userRepository.findByDeptment(deptment);
    }

	public void deleteByUsername(String username) {
		  this.userRepository.deleteByUserName(username);
	}
}
