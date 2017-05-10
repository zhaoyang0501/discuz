package cmcc.core.sys.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cmcc.common.repository.SimpleCurdRepository;
import cmcc.core.bbs.entity.Article;
import cmcc.core.sys.entity.BbsFavorite;
import cmcc.core.sys.entity.User;
public interface BbsFavoriteRepository   extends SimpleCurdRepository<BbsFavorite ,Long>{

	@Modifying @Query("delete from  BbsFavorite u  where u.user = ?1 and u.bbs=?2")
	public void delete(User user,Article bbs);
	
	public List<BbsFavorite> findByUserOrderByCreateDateDesc(User user);
}
