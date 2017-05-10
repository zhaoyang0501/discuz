package cmcc.core.bbs.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cmcc.common.repository.SimpleCurdRepository;
import cmcc.core.bbs.entity.Comment;
import cmcc.core.sys.entity.User;
public interface CommentRepository   extends SimpleCurdRepository<Comment ,Long>{
	
	@Query("select t.user  from Comment as t   group by t.user order by count(1) desc")
	public List<User> queryHotUsers(); 
	
	@Query(" select t from  cmcc.core.bbs.entity.Comment t where t.user=?1 order by createDate")
	public List<Comment> findByUserOrderByCreateDate(User user);
	
}
