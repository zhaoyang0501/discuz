package cmcc.core.bbs.repository;
import java.util.List;

import org.springframework.data.domain.Sort;

import cmcc.common.repository.SimpleCurdRepository;
import cmcc.core.bbs.entity.Article;
import cmcc.core.sys.entity.User;
public interface ArticleRepository   extends SimpleCurdRepository<Article ,Long>{
	
	public List<Article> findByGoodOrderByCreateDate(Boolean good); 
	
	
	public List<Article> findByUserOrderByCreateDate(User user);


	public List<Article> findByCategoryId(Long id);


	public List<Article> findByCategoryId(Long id, Sort sort);

}
